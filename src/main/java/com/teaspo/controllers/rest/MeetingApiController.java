package com.teaspo.controllers.rest;

import com.teaspo.exceptions.NoSuchEntityException;
import com.teaspo.exceptions.TeaSpoException;
import com.teaspo.persistence.entities.MeetingEntity;
import com.teaspo.persistence.entities.PlaceEntity;
import com.teaspo.pojo.other.Response;
import com.teaspo.services.utils.IMeetingService;
import com.teaspo.services.utils.ResponseFactory;
import com.teaspo.views.MeetingView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Андрій on 03.04.2017.
 */
@Controller
@RequestMapping(value = "/api/meetings")
public class MeetingApiController {

    @Autowired
    private IMeetingService meetingService;

    @Autowired
    private ResponseFactory responseFactory;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    Response<MeetingEntity>
    getMeeting(@PathVariable("id") int meetingId)
            throws NoSuchEntityException {
        return responseFactory.get(meetingService.getMeetingById(meetingId));
    }

    @RequestMapping(
            value = "/",
            method = RequestMethod.GET
    )
    public @ResponseBody Response<List<MeetingEntity>>
    getMeetings(
            @RequestParam(value = "offset", required = false, defaultValue = "0") int offset,
            @RequestParam(value = "limit", required = false, defaultValue = "10") int limit
    ) throws TeaSpoException {
        return responseFactory.get(meetingService.getMeetings(offset, limit));
    }

    @RequestMapping(
            value = "/",
            method = RequestMethod.PUT
    )
    public
    @ResponseBody Response<Integer>
    createMeeting(
            @RequestBody MeetingView view
    ) throws TeaSpoException {
        return responseFactory.get(meetingService.create(view));
    }

    @RequestMapping(
            value = "/update",
            method = RequestMethod.POST
    )
    public
    @ResponseBody Response<MeetingEntity>
    update(
            @RequestBody MeetingView view
    ) throws NoSuchEntityException {
        return responseFactory.get(meetingService.update(view));
    }
}
