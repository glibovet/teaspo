package com.teaspo.services.utils;

import com.teaspo.exceptions.NoSuchEntityException;
import com.teaspo.exceptions.ServiceErrorException;
import com.teaspo.exceptions.SuchEntityExistsExeption;
import com.teaspo.persistence.entities.PlaceEntity;
import com.teaspo.views.PlaceView;


import java.util.List;

/**
 * Created by mykola.dekhtiarenko on 27.12.16.
 */
public interface IPlaceService {

    PlaceEntity getPlaceById(int placeId) throws NoSuchEntityException;

    List<PlaceEntity> getPlaces(int offset, int limit) throws NoSuchEntityException;

    int create(PlaceView view) throws ServiceErrorException, SuchEntityExistsExeption;

    PlaceEntity update(PlaceView view) throws NoSuchEntityException;
}
