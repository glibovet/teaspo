package com.teaspo.services.utils;

import com.teaspo.exceptions.NoSuchEntityException;
import com.teaspo.exceptions.ServiceErrorException;
import com.teaspo.exceptions.SuchEntityExistsExeption;
import com.teaspo.persistence.entities.MeetingEntity;
import com.teaspo.views.MeetingView;

import java.util.List;
import java.util.Set;

/**
 * Created by Андрій on 03.04.2017.
 */
public interface IMeetingService {

    MeetingEntity getMeetingById(int MeetingId) throws NoSuchEntityException;

    List<MeetingEntity> getMeetings(int offset, int limit) throws NoSuchEntityException;

    Set<MeetingEntity> getMeetingsByUser() throws NoSuchEntityException;

    int create(MeetingView view) throws ServiceErrorException, SuchEntityExistsExeption;

    MeetingEntity update (MeetingView view) throws NoSuchEntityException;
//
//    MeetingEntity subscribe (int MeetingId) throws NoSuchEntityException;
//
//    MeetingEntity unsubscribe (int MeetingId) throws NoSuchEntityException;
}
