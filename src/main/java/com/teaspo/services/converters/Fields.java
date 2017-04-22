package com.teaspo.services.converters;

/**
 * Created by Andrii on 15.11.2016.
 */
public class Fields {

    public static class User {
        public static final String ID = "id";
        public static final String EMAIL = "email";
        public static final String NIKNAME = "nikname";
        public static final String PASSWORD = "password";
        public static final String ROLE = "role";
        public static final String ACTIVE = "active";
        public static final String TOWN = "town";
        public static final String COUNTRY = "country";
        public static final String DEFAULT = ID + ',' + EMAIL;
    }


    public static class Place {
        public static final String ID = "id";
        public static final String NAME = "name";
        public static final String DEFAULT = ID + ',' + NAME;
    }


}
