package com.teaspo.services.utils;

import com.teaspo.exceptions.NoSuchEntityException;
import com.teaspo.exceptions.ServiceErrorException;
import com.teaspo.exceptions.SuchEntityExistsExeption;
import com.teaspo.persistence.dao.MeetingRepository;
import com.teaspo.persistence.dao.PlaceRepository;
import com.teaspo.persistence.dao.UsersRepository;
import com.teaspo.persistence.entities.MeetingEntity;
import com.teaspo.persistence.entities.UserEntity;
import com.teaspo.services.converters.Fields;
import com.teaspo.views.MeetingView;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.sql.Date;
import java.util.List;


/**
 * Created by Андрій on 03.04.2017.
 */
@Service
public class MeetingServiceImpl implements IMeetingService {

    @Resource
    private MeetingRepository meetingRepository;

    @Resource
    private UsersRepository usersRepository;

    @Resource
    private PlaceRepository placeRepository;


    @Override
    @Transactional
    public MeetingEntity getMeetingById (int meetingId) throws NoSuchEntityException{
        MeetingEntity meeting = meetingRepository.findOne(meetingId);
        if (meeting ==null){
            throw new NoSuchEntityException("meeting", "id:" + meetingId);
        }
        return meeting;
    }

    @Override
    @Transactional
    public List<MeetingEntity> getMeetings(int offset, int limit) throws NoSuchEntityException{
        Page<MeetingEntity> list = meetingRepository.findAll(new PageRequest(offset/limit,limit));
        if(list == null || list.getContent().isEmpty())
            throw new NoSuchEntityException("meeting", String.format("[offset: %d, limit: %d]", offset, limit));
        return list.getContent();
    }

    @Override
    @Transactional
    public int create(MeetingView view) throws ServiceErrorException, SuchEntityExistsExeption {
            MeetingEntity entity = new MeetingEntity();


            entity.setName(view.getName());
            entity.setDescription(view.getDescription());
            entity.setLatitude(view.getLatitude());
            entity.setLongitude(view.getLongitude());
            entity.setCapacity(view.getCapacity());
            entity.setDatetime(view.getDatetime());
            entity.setType(view.getType());
            if(view.getUserEntityId()!=null) {
                entity.setUserEntity(usersRepository.findOne(view.getUserEntityId()));
            }

            if(view.getPlaceEntityId()!=null) {
                entity.setPlaceEntity(placeRepository.findOne(view.getPlaceEntityId()));
            }

            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            entity.setUserEntity(usersRepository.findByEmail(userDetail.getUsername()));

            entity = meetingRepository.saveAndFlush(entity);
            return entity.getId();
    }

    @Override
    @Transactional
    public MeetingEntity update(MeetingView view) throws NoSuchEntityException {
        MeetingEntity entity =  getMeetingById(view.getId());
        entity.setName(view.getName());
        entity.setDescription(view.getDescription());
        entity.setLatitude(view.getLatitude());
        entity.setLongitude(view.getLongitude());
        entity.setCapacity(view.getCapacity());
        entity.setDatetime(view.getDatetime());
        entity.setSubscribers(view.getSubscribers());
        entity.setUserEntity(usersRepository.findOne(view.getUserEntityId()));
        entity.setPlaceEntity(placeRepository.findOne(view.getPlaceEntityId()));
        meetingRepository.saveAndFlush(entity);
        return entity;

    }

//    @Override
//    @Transactional
//    public MeetingEntity subscribe(int meetingId){
//        MeetingEntity meetingEntity = meetingRepository.findOne(meetingId);
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        UserDetails userDetail = (UserDetails) auth.getPrincipal();
//        meetingEntity.getSubscribers().add(usersRepository.findByEmail(userDetail.getUsername()));
//        return meetingEntity;
//    }

//    @Override
//    @Transactional
//    public MeetingEntity unsubscribe(int meetingId){
//        MeetingEntity meetingEntity = meetingRepository.findOne(meetingId);
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        UserDetails userDetail = (UserDetails) auth.getPrincipal();
//        meetingEntity.getSubscribers().remove(usersRepository.findByEmail(userDetail.getUsername()));
//        return meetingEntity;
//    }
}
