package com.teaspo.controllers.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by PANNA on 22.03.2017.
 */
@Controller
@RequestMapping("/web/admin")
public class UserController {

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") int id,
                             Model model){
        model.addAttribute("id", id);
        return "/admin/userEdit";
    }

    @RequestMapping(value="/{id}/show", method=RequestMethod.GET)
    public String showUser(@PathVariable("id") int id,
                           Model model){
        model.addAttribute("id", id);
        return "/user/userPage";
    }
}
