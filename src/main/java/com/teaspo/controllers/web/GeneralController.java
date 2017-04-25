package com.teaspo.controllers.web;

import com.teaspo.exceptions.NoSuchEntityException;
import com.teaspo.persistence.dao.MeetingRepository;
import com.teaspo.services.utils.IMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by mykola.dekhtiarenko on 05.04.17.
 */
@Controller
@RequestMapping(value = "/")
public class GeneralController {

    @Autowired
    MeetingRepository meetingRepository;

    @Autowired
    IMeetingService meetingService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() throws NoSuchEntityException {
        ModelAndView model = new ModelAndView();
        model.addObject("events", meetingService.getMeetings(0, 4));
        model.setViewName("index");
        return model;
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;

    }

    @RequestMapping(value = "/events", method = RequestMethod.GET)
    public ModelAndView events() {

        ModelAndView model = new ModelAndView();
        model.addObject("events", meetingRepository.findAll());
        model.setViewName("event/listEvents");

        return model;

    }

    @RequestMapping(value = "/events/create", method = RequestMethod.GET)
    public ModelAndView createEvent() {
        ModelAndView model = new ModelAndView();
        model.setViewName("event/createEvent");
        return model;
    }

    @RequestMapping(value = "/places/create", method = RequestMethod.GET)
    public ModelAndView createPlace() {
        ModelAndView model = new ModelAndView();
        model.setViewName("place/addPlace");
        return model;
    }



}
