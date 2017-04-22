package com.teaspo.services.validators;

import com.teaspo.pojo.enams.RolesEnum;
import com.teaspo.exceptions.ServiceErrorException;
import com.teaspo.exceptions.ValidationException;
import com.teaspo.persistence.entities.UserEntity;
import com.teaspo.services.utils.SessionUtils;
import com.teaspo.views.UserView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.Set;

/**
 * Created by Andrii on 15.11.2016.
 */
@Service
public class UserValidateServiceImpl implements IUserValidateService {

    @Autowired
    private SessionUtils sessionUtils;

    @Autowired
    private Validator validator;

    @Override
    public void validForCreate(UserView user) throws ServiceErrorException, ValidationException {
        Set<ConstraintViolation<UserView>> violations = validator.validate(user);
        if(violations != null && !violations.isEmpty()) {
            System.out.println(violations.toString());
            throw new ValidationException(UserEntity.class.getName(), violations);
        }
        if (!sessionUtils.isAuthorized()){
            if (user.getRole()==null||!user.getRole().equals(RolesEnum.user)){
                throw new ServiceErrorException();
            }
        }else if (!sessionUtils.isUserWithRole(RolesEnum.admin)){
            throw new ServiceErrorException();
        }
    }
}
