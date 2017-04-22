package com.teaspo.persistence.entities;

import javax.persistence.*;

/**
 * Created by mykola.dekhtiarenko on 27.12.16.
 */

@Entity
@Table(name = "places")
public class PlaceEntity {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "shortlink")
    private String shortlink;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "web")
    private String web;

    @Column(name = "contacts")
    private String contacts;

    @Column(name = "latitude")
    private Double latitude;

    @Column(name = "longtitude")
    private Double longtitude;

    @Column(name = "status")
    private String status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "responcible_user", nullable = false)
    private UserEntity responsibleUser;


    @Override
    public String toString() {
        return "PlaceEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", shortlink='" + shortlink + '\'' +
                ", responsibleUserId=" + responsibleUser.getId() +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShortlink() {
        return shortlink;
    }

    public void setShortlink(String shortlink) {
        this.shortlink = shortlink;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongtitude() {
        return longtitude;
    }

    public void setLongtitude(Double longtitude) {
        this.longtitude = longtitude;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public UserEntity getResponsibleUser() {
        return responsibleUser;
    }

    public void setResponsibleUser(UserEntity responsibleUser) {
        this.responsibleUser = responsibleUser;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PlaceEntity)) return false;

        PlaceEntity entity = (PlaceEntity) o;

        if (!getId().equals(entity.getId())) return false;
        if (!getName().equals(entity.getName())) return false;
        if (getDescription() != null ? !getDescription().equals(entity.getDescription()) : entity.getDescription() != null)
            return false;
        if (!getShortlink().equals(entity.getShortlink())) return false;
        if (getEmail() != null ? !getEmail().equals(entity.getEmail()) : entity.getEmail() != null) return false;
        if (getPhone() != null ? !getPhone().equals(entity.getPhone()) : entity.getPhone() != null) return false;
        if (getWeb() != null ? !getWeb().equals(entity.getWeb()) : entity.getWeb() != null) return false;
        if (getContacts() != null ? !getContacts().equals(entity.getContacts()) : entity.getContacts() != null)
            return false;
        if (getLatitude() != null ? !getLatitude().equals(entity.getLatitude()) : entity.getLatitude() != null)
            return false;
        if (getLongtitude() != null ? !getLongtitude().equals(entity.getLongtitude()) : entity.getLongtitude() != null)
            return false;
        if (getStatus() != null ? !getStatus().equals(entity.getStatus()) : entity.getStatus() != null) return false;
        return getResponsibleUser() != null ? getResponsibleUser().equals(entity.getResponsibleUser()) : entity.getResponsibleUser() == null;
    }

    @Override
    public int hashCode() {
        int result = getId().hashCode();
        result = 31 * result + getName().hashCode();
        result = 31 * result + (getDescription() != null ? getDescription().hashCode() : 0);
        result = 31 * result + getShortlink().hashCode();
        result = 31 * result + (getEmail() != null ? getEmail().hashCode() : 0);
        result = 31 * result + (getPhone() != null ? getPhone().hashCode() : 0);
        result = 31 * result + (getWeb() != null ? getWeb().hashCode() : 0);
        result = 31 * result + (getContacts() != null ? getContacts().hashCode() : 0);
        result = 31 * result + (getLatitude() != null ? getLatitude().hashCode() : 0);
        result = 31 * result + (getLongtitude() != null ? getLongtitude().hashCode() : 0);
        result = 31 * result + (getStatus() != null ? getStatus().hashCode() : 0);
        result = 31 * result + (getResponsibleUser() != null ? getResponsibleUser().hashCode() : 0);
        return result;
    }
}
