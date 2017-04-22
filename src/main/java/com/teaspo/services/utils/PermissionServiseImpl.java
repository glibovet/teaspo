package com.teaspo.services.utils;

import com.teaspo.exceptions.NoSuchEntityException;
import com.teaspo.exceptions.TeaSpoException;
import com.teaspo.persistence.dao.PermissionsRepository;
import com.teaspo.persistence.entities.PermissionEntity;
import com.teaspo.pojo.other.Response;
import com.teaspo.services.converters.Fields;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by mykola.dekhtiarenko on 19.12.16.
 */
@Component
public class PermissionServiseImpl implements  IPermissionService{

    @Resource
    PermissionsRepository permissionsRepository;

    @Override
    @Transactional
    public PermissionEntity getPermissionById(int permissionId) throws NoSuchEntityException {
        PermissionEntity permission = permissionsRepository.findOne(permissionId);
        if (permission == null)
            throw new NoSuchEntityException("permission", "id: " + permissionId);
        return permission;
    }


}
