package com.teaspo.services.utils;

import com.teaspo.exceptions.NoSuchEntityException;
import com.teaspo.persistence.entities.PermissionEntity;
import com.teaspo.persistence.entities.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Andrii on 15.11.2016.
 */
@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private IUserService userService;

    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String email)
            throws UsernameNotFoundException {
        UserEntity user = null;
        try {
            user = userService.getByEmail(email);
        } catch (NoSuchEntityException e) {
            throw new UsernameNotFoundException("Username not found");
        }
        boolean enabled = true;
        if (!user.isActive())
            enabled = false;
        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(),
                enabled, true, true, true, getGrantedAuthorities(user));
    }


    private List<GrantedAuthority> getGrantedAuthorities(UserEntity user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (PermissionEntity perm:user.getRoleEntity().getPermissions()){
            System.out.println(user.getRoleEntity());
            System.out.println(user.getRoleEntity().getPermissions());
            authorities.add(new SimpleGrantedAuthority(perm.getName()));
        }
        return authorities;
    }
}
