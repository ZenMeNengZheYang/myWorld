package com.world.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.result.Result;
import com.world.result.ResultUtil;

@ControllerAdvice
public class ExceptionHandle {

    //增加异常日志打印
    private final static Logger logger = LoggerFactory.getLogger(ExceptionHandle.class);

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result handle(Exception e){
        if(e instanceof CourseException){
            return ResultUtil.parameterError();
        }else{
            logger.error("【系统异常】={}",e);
            return ResultUtil.systemError();
        }
    }

}
