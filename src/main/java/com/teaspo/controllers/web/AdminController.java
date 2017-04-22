package com.teaspo.controllers.web;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by PANNA on 11.02.2017.
 */
@Controller
@RequestMapping(value = "/web/admin/")
public class AdminController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String adminPage(){
        return "/admin/admin";
    }
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    public String userEditPage(){
        return "WEB-INF/pages/admin/userEdit";
    }
    public String userPage(){
        return "WEB-INF/pages/user/userPage";
    }

}
