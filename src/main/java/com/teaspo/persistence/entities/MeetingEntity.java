package com.teaspo.persistence.entities;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.Date;

/**
 * Created by mykola.dekhtiarenko on 29.03.17.
 */
@Entity
@Table(name = "meeting")
public class MeetingEntity {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "latitude")
    private Double latitude;

    @Column(name = "longitude")
    private Double longitude;

    @Column(name = "capacity")
    private Integer capacity;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "datetime")
    private Date datetime;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "owner", nullable = false)
    private UserEntity userEntity;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "place")
    private PlaceEntity placeEntity;


    @Override
    public String toString() {
        return "MeetingEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", userEntityId='" + userEntity.getId() + '\'' +
                ", PlaceEntityId=" + placeEntity.getId() +
                '}';
    }

    public void setId (Integer id){ this.id = id; }
    public Integer getId (){ return id; }

    public void setName (String name){ this.name = name; }
    public String getName (){ return name; }

    public void setDescription (String description){ this.description = description; }
    public String getDescription (){ return description; }

    public void setLatitude (Double latitude){ this.latitude = latitude; }
    public Double getLatitude (){ return latitude; }

    public void setLongitude (Double longitude){ this.longitude = longitude; }
    public Double getLongitude (){ return longitude; }

    public void setCapacity (Integer capacity){ this.capacity = capacity; }
    public Integer getCapacity (){ return capacity; }

    public void setDatetime (Date datetime){ this.datetime = datetime; }
    public Date getDatetime (){ return datetime; }

    public void setUserEntity (UserEntity userEntity){ this.userEntity = userEntity; }
    public UserEntity getUserEntity (){ return userEntity; }

    public void setPlaceEntity (PlaceEntity id){ this.placeEntity = placeEntity; }
    public PlaceEntity getPlaceEntity (){ return placeEntity; }

}
