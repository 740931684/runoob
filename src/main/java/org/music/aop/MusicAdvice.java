package org.music.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;


public class MusicAdvice {

    @Pointcut("@annotation(org.music.annotation.MusicAnnotation)")
    public void checkAnno(){}


    /*@Around("checkAnno()")
    public Object AroundMethod(ProceedingJoinPoint joinPoint) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        String username ="";

        for (Cookie cookie:request.getCookies()){
            if (cookie.getName().equalsIgnoreCase("user")){
                username = cookie.getValue();
            }
        }
        if (username.equalsIgnoreCase("")){
            return "未登录";
        }

        return joinPoint.proceed();
    }*/

    @Around("checkAnno()")
    public Object AroundMethod(ProceedingJoinPoint joinPoint) throws Throwable {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        Object result = joinPoint.proceed();

        stopWatch.stop();

        System.out.println(stopWatch.getTotalTimeMillis());

        return result;
    }


}
