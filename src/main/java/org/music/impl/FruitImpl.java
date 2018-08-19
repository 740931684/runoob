package org.music.impl;


import org.springframework.stereotype.Component;

@Component
public class FruitImpl implements Fruit {

    @Override
    public void name(String name) {
        System.out.println("水果名字："+name);
    }

    @Override
    public void type(String type) {
        System.out.println("水果种类："+type);
    }

    @Override
    public String place(String place) {
        System.out.println("水果产地："+place);
        return place;
    }

    @Override
    public int returnAge(int age) {
        System.out.println(age);
        return age;
    }
}
