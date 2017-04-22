package com.teaspo.services.utils;

import com.teaspo.pojo.enams.RolesEnum;
import com.teaspo.exceptions.*;
import com.teaspo.persistence.dao.RolesRepository;
import com.teaspo.persistence.dao.UsersRepository;
import com.teaspo.persistence.entities.PermissionEntity;
import com.teaspo.persistence.entities.RoleEntity;
import com.teaspo.persistence.entities.UserEntity;
import com.teaspo.services.converters.Converter;
import com.teaspo.services.validators.IUserValidateService;
import com.teaspo.views.UserView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.CookieClearingLogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.authentication.rememberme.AbstractRememberMeServices;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Andrii on 15.11.2016.
 */
@Service
public class UserServiceImpl implements IUserService {

    @Resource
    private UsersRepository usersRepository;

    @Autowired
    private SessionUtils sessionUtils;

    @Autowired
    private IUserValidateService userValidateService;

    @Resource
    private RolesRepository rolesRepository;

    @Autowired
    private Converter<UserEntity> userConverter;

    @Override
    @Transactional
    public UserEntity getUserById(int userId) throws NoSuchEntityException {
        UserEntity user = usersRepository.findOne(userId);
        if (user == null)
            throw new NoSuchEntityException("user", "id: " + userId);
        return user;
    }


    @Override
    @Transactional
    public Map<String, Object> getUserByIdMap(int userId, Set<String> fields) throws NoSuchEntityException {
        return userConverter.convert(getUserById(userId), fields);
    }

    @Override
    @Transactional
    /**
     * offset number of rows to skip
     * limit max on request
     */
    public List<UserEntity> getUsers(int offset, int limit) throws NoSuchEntityException {
        Page<UserEntity> list = usersRepository.findAll(new PageRequest(offset/limit,limit));
        if(list == null || list.getContent().isEmpty())
            throw new NoSuchEntityException("user", String.format("[offset: %d, limit: %d]", offset, limit));
        return list.getContent();
    }

    
    @Override
    @Transactional
    public List<Map<String, Object>> getUsersMap(int offset, int limit, Set<String> fields) throws NoSuchEntityException {
        return userConverter.convert(getUsers(offset, limit), fields);
    }

    @Override
    @Transactional
    public UserEntity getByEmail(String email) throws NoSuchEntityException {
        UserEntity find = usersRepository.findByEmail(email);
        if (find == null)
            throw new NoSuchEntityException(UserEntity.class.getName(),"user email "+email);
        return find;
    }

    @Override
    @Transactional
    public int create(UserView view) throws EmailExistsException, ServiceErrorException, ValidationException {
        try {
            getByEmail(view.getEmail());
            // should be exception
            // otherwise user exists and exception should be thrown
            throw new EmailExistsException();
        } catch (NoSuchEntityException e) {
            UserEntity entity = new UserEntity();
            if (view.getRole() == null)
                view.setRole(RolesEnum.user);
            view.setActive(true);
            merge(entity, view);
            userValidateService.validForCreate(view);
            entity = usersRepository.saveAndFlush(entity);
            if(entity == null){
                throw new ServiceErrorException();
            }
            entity.setActive(true);
            entity = usersRepository.saveAndFlush(entity);
            if (!sessionUtils.isAuthorized()){
                sessionUtils.logeInUser(entity);
            }
            return entity.getId();
        }
    }

    @Override
    @Transactional(rollbackFor=NoSuchEntityException.class)
    public UserEntity update(UserView userView) throws NoSuchEntityException {
       return update(viewToEntity(userView));
    }

    @Override
    @Transactional(rollbackFor=NoSuchEntityException.class)
    public UserEntity update(UserEntity userData) throws NoSuchEntityException {
        UserEntity updatedUser = usersRepository.findOne(userData.getId());

        if (updatedUser == null)
            throw new NoSuchEntityException(UserEntity.class.getName(),"userId"+userData.getId());
        updatedUser.setNikname(userData.getNikname());
        updatedUser.setEmail(userData.getEmail());
        updatedUser.setPassword(userData.getPassword());
        updatedUser.setActive(userData.isActive());
        updatedUser.setRoleEntity(userData.getRoleEntity());
        usersRepository.saveAndFlush(updatedUser);
        return updatedUser;
    }

    @Override
    @Transactional
    public boolean signInUser(UserView view) throws NoSuchEntityException, WrongPasswordException {
        UserEntity entity = getByEmail(view.getEmail());
        if(!entity.getPassword().equals(view.getPassword()))
            throw new WrongPasswordException();

        Authentication authentication = new UsernamePasswordAuthenticationToken(entity, entity.getPassword(), getGrantedAuthorities(entity));
        SecurityContext securityContext = SecurityContextHolder.getContext();
        securityContext.setAuthentication(authentication);

        return true;
    }

    @Override
    public boolean logoutUser(HttpServletRequest request, HttpServletResponse response) {
        CookieClearingLogoutHandler cookieClearingLogoutHandler = new CookieClearingLogoutHandler(AbstractRememberMeServices.SPRING_SECURITY_REMEMBER_ME_COOKIE_KEY);
        SecurityContextLogoutHandler securityContextLogoutHandler = new SecurityContextLogoutHandler();
        cookieClearingLogoutHandler.logout(request, response, null);
        securityContextLogoutHandler.logout(request, response, null);
        SecurityContextHolder.clearContext();
        HttpSession session = request.getSession(false);
        if(session != null) {
            session.invalidate();
        }
        return true;
    }

    @Override
    public UserEntity disableUser(int userId) throws NoSuchEntityException {
        UserEntity entity = getUserById(userId);
        entity.setActive(false);
        update(entity);
        return entity;
    }

    @Override
    public UserEntity enableUser(int userId) throws NoSuchEntityException {
        UserEntity entity = getUserById(userId);
        entity.setActive(true);
        update(entity);
        return entity;
    }

    private List<GrantedAuthority> getGrantedAuthorities(UserEntity user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (PermissionEntity perm : user.getRoleEntity().getPermissions()){
            authorities.add(new SimpleGrantedAuthority(perm.getName()));
        }
        return authorities;
    }


    public void merge(UserEntity entity, UserView view){
        if(view.getNikname() != null)
            entity.setNikname(view.getNikname());
        else view.setNikname(entity.getNikname());

        if(view.getEmail() != null)
            entity.setEmail(view.getEmail());
        else view.setEmail(entity.getEmail());

        if(view.getActive() != null)
            entity.setActive(view.getActive());
        else view.setActive(entity.isActive());

        if(view.getPassword() != null)
            entity.setPassword(view.getPassword());
        else view.setPassword(entity.getPassword());

        if (view.getRole() != null){
            RoleEntity role = rolesRepository.findByName(view.getRole());
            entity.setRoleEntity(role);
        }else if (entity.getRoleEntity()!=null){
            view.setRole(entity.getRoleEntity().getName());
        }
    }

    public UserEntity viewToEntity(UserView view){
        UserEntity userEntity = new UserEntity();
        userEntity.setId(view.getId());
        userEntity.setEmail(view.getEmail());
        userEntity.setNikname(view.getNikname());
        userEntity.setPassword(view.getPassword());
        userEntity.setActive(view.getActive());
        RoleEntity role = rolesRepository.findByName(view.getRole());
        userEntity.setRoleEntity(role);
        return userEntity;
    }
}
