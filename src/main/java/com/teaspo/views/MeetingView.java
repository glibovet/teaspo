package com.teaspo.views;

import java.sql.Date;

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

    private Date datetime;

    private Integer userEntityId;

    private Integer placeEntityId;


    @Override
    public String toString() {
        return "MeetingEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", capacity='" + capacity + '\'' +
                ", datetime='" + datetime + '\'' +
                ", latitude='" + latitude + '\'' +
                ", longitude='" + longitude + '\'' +
                ", userEntityId='" + userEntityId + '\'' +
                ", placeEntityId=" + placeEntityId +
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

    public void setUserEntityId (Integer userEntityId){ this.userEntityId = userEntityId; }
    public Integer getUserEntityId (){ return userEntityId; }

    public void setPlaceEntityId (Integer placeEntityId){ this.placeEntityId = placeEntityId; }
    public Integer getPlaceEntityId (){ return placeEntityId; }
}
