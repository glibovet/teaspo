package com.teaspo.exceptions;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by mykola.dekhtiarenko on 30.12.16.
 */
public class SuchEntityExistsExeption extends TeaSpoException {
    private static final String DEFAULT_MESSAGE = "Such entity('%s') exists with this params %s";
    private static final String ENTITY_OF_TYPE_EXISTS = "Entity of type '%s' exists";

    public SuchEntityExistsExeption(String className){
        super(String.format(ENTITY_OF_TYPE_EXISTS , className));
    }

    public SuchEntityExistsExeption(String classname, String params){
        super(String.format(DEFAULT_MESSAGE, classname,  params));
    }

    public int getCode(){
        return HttpServletResponse.SC_BAD_REQUEST;
    }

}
