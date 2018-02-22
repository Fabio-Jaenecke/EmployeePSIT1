package com.example.employees.util;


public class ServiceException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public ServiceException(final String message) {
        super(message);
    }

    public ServiceException(final Throwable cause) {
        super(cause);
    }

    public ServiceException(final String message, final Throwable cause) {
        super(message, cause);
    }

}
