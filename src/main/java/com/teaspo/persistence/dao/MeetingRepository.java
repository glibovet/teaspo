package com.teaspo.persistence.dao;

import com.teaspo.persistence.entities.MeetingEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Андрій on 03.04.2017.
 */
@Transactional(propagation= Propagation.REQUIRED)
public interface MeetingRepository extends JpaRepository<MeetingEntity, Integer> {

}
