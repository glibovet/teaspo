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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof MeetingEntity)) return false;

        MeetingEntity that = (MeetingEntity) o;

        if (!getId().equals(that.getId())) return false;
        if (!getName().equals(that.getName())) return false;
        if (getDescription() != null ? !getDescription().equals(that.getDescription()) : that.getDescription() != null)
            return false;
        if (getLatitude() != null ? !getLatitude().equals(that.getLatitude()) : that.getLatitude() != null)
            return false;
        if (getLongitude() != null ? !getLongitude().equals(that.getLongitude()) : that.getLongitude() != null)
            return false;
        if (getCapacity() != null ? !getCapacity().equals(that.getCapacity()) : that.getCapacity() != null)
            return false;
        if (!getDatetime().equals(that.getDatetime())) return false;
        if (!getUserEntity().equals(that.getUserEntity())) return false;
        return getPlaceEntity() != null ? getPlaceEntity().equals(that.getPlaceEntity()) : that.getPlaceEntity() == null;
    }

    @Override
    public int hashCode() {
        int result = getId().hashCode();
        result = 31 * result + getName().hashCode();
        result = 31 * result + (getDescription() != null ? getDescription().hashCode() : 0);
        result = 31 * result + (getLatitude() != null ? getLatitude().hashCode() : 0);
        result = 31 * result + (getLongitude() != null ? getLongitude().hashCode() : 0);
        result = 31 * result + (getCapacity() != null ? getCapacity().hashCode() : 0);
        result = 31 * result + getDatetime().hashCode();
        result = 31 * result + getUserEntity().hashCode();
        result = 31 * result + (getPlaceEntity() != null ? getPlaceEntity().hashCode() : 0);
        return result;
    }
}
