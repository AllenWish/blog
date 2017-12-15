package com.awsoft.core.exceptions;

/**
 * Created by AllenWish on 2017-12-11.
 */
public class CustomException extends RuntimeException{
    private static final long serialVersionUID = 1L;

    public CustomException(String message) {
        super(message);
    }

    public CustomException(String message, Throwable cause) {
        super(message, cause);
    }

    public CustomException(Throwable cause) {
        super(cause);
    }
}
