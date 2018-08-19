package org.music.impl;


import org.springframework.stereotype.Component;

@Component
public class TestFruit extends FruitImpl {
    public void display(){
        System.out.println("extendFruit");
    }
}
