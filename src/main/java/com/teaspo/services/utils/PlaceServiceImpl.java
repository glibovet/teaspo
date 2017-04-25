package com.teaspo.services.utils;

import com.teaspo.exceptions.*;
import com.teaspo.persistence.dao.PlaceRepository;
import com.teaspo.persistence.dao.UsersRepository;
import com.teaspo.persistence.entities.PlaceEntity;
import com.teaspo.persistence.entities.UserEntity;
import com.teaspo.pojo.enams.RolesEnum;
import com.teaspo.views.PlaceView;
import com.teaspo.views.UserView;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by mykola.dekhtiarenko on 27.12.16.
 */
@Service
public class PlaceServiceImpl implements IPlaceService {

    @Resource
    private PlaceRepository placesRepository;

    @Resource
    private UsersRepository usersRepository;

    @Override
    @Transactional
    public PlaceEntity getPlaceById(int placeId) throws NoSuchEntityException {
        PlaceEntity place = placesRepository.findOne(placeId);
        if (place == null)
            throw new NoSuchEntityException("place", "id: " + placeId);
        return place;
    }


    @Override
    @Transactional
    public List<PlaceEntity> getPlaces(int offset, int limit) throws NoSuchEntityException {
        Page<PlaceEntity> list = placesRepository.findAll(new PageRequest(offset / limit, limit));
        if (list == null || list.getContent().isEmpty())
            throw new NoSuchEntityException("place", String.format("[offset: %d, limit: %d]", offset, limit));
        return list.getContent();
    }

    @Override
    @Transactional
    public int create(PlaceView view) throws ServiceErrorException, SuchEntityExistsExeption {
        PlaceEntity entity = new PlaceEntity();
        entity.setEmail(view.getEmail());
        entity.setDescription(view.getDescription());
        entity.setContacts(view.getContacts());
        entity.setName(view.getName());
        entity.setLatitude(view.getLatitude());
        entity.setLongtitude(view.getLongtitude());
        entity.setPhone(view.getPhone());
        entity.setWeb(view.getWeb());
        entity.setStatus(view.getStatus());
        entity.setShortlink(""+view.getId());

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetail = (UserDetails) auth.getPrincipal();

        entity.setResponsibleUser(usersRepository.findByEmail(userDetail.getUsername()));
        entity = placesRepository.saveAndFlush(entity);
        return entity.getId();
    }

    @Override
    @Transactional
    public PlaceEntity update(PlaceView view) throws NoSuchEntityException {
        PlaceEntity place = getPlaceById(view.getId());
        place.setContacts(view.getContacts());
        place.setEmail(view.getEmail());
        place.setResponsibleUser(usersRepository.findOne(view.getRespUserId()));
        place.setShortlink(view.getShortlink());
        place.setStatus(view.getStatus());
        place.setDescription(view.getDescription());
        place.setLatitude(view.getLatitude());
        place.setLongtitude(view.getLongtitude());
        place.setName(view.getName());
        place.setPhone(view.getPhone());
        place.setWeb(view.getWeb());
        placesRepository.saveAndFlush(place);
        return place;

    }


}
