package com.world.exception;

public class CourseException extends RuntimeException {

	private static final long serialVersionUID = 6021282311606685893L;
	
	private Integer code;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public CourseException(Integer code,String message) {
        super(message);
        this.code = code;
    }
}
