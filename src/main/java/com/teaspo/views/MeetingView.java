package com.teaspo.views;


import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

/**
 * Created by Андрій on 03.04.2017.
 */
public class MeetingView {

    private Integer id;

    private String name;

    private String description;

    private Double latitude;

    private Double longitude;

    private Integer capacity;

    private String type;

    private String datetime;

    private Integer userEntityId;

    private Integer placeEntityId;


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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setUserEntityId (Integer userEntityId){ this.userEntityId = userEntityId; }
    public Integer getUserEntityId (){ return userEntityId; }

    public void setPlaceEntityId (Integer placeEntityId){ this.placeEntityId = placeEntityId; }
    public Integer getPlaceEntityId (){ return placeEntityId; }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    @Override
    public String toString() {
        return "MeetingView{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", capacity=" + capacity +
                ", type='" + type + '\'' +
                ", datetime='" + datetime + '\'' +
                ", userEntityId=" + userEntityId +
                ", placeEntityId=" + placeEntityId +
                '}';
    }
}
