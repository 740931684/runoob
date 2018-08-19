package org.music.impl;


import org.aopalliance.intercept.MethodInterceptor;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class MyAspect {

    public static final Logger logger = LoggerFactory.getLogger(MyAspect.class);

    @Pointcut("within(org.music.impl.FruitImpl+)")
    public void point(){}


   /* @Before("point()")
    public void FruitBefore(){
        logger.info("before");
    }

    @AfterReturning(value = "point()",returning = "reback")
    public void FruitAfter(int reback){
        logger.info("AfterReturning");
    }

    @After(value = "point()")
    public void After(){
        logger.info("After");
    }

    @AfterThrowing(value = "point()",throwing = "e")
    public void FruitThrow(Throwable e){
        logger.info("AfterThrowing");
    }*/

    @Around("point()")
    public Object aroundFruit(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println("before");
        Object result = joinPoint.proceed();
        System.out.println("after");
        return result;
    }



}
