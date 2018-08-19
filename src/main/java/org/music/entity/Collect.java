package org.music.entity;

public class Collect {
    private Integer user;
    private String musicType;
    private String picture;
    private String topic;
    private String introduced;
    private Integer musicFlag;


    public Collect(){}

    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    public String getMusicType() {
        return musicType;
    }

    public void setMusicType(String musicType) {
        this.musicType = musicType;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getIntroduced() {
        return introduced;
    }

    public void setIntroduced(String introduced) {
        this.introduced = introduced;
    }

    public Integer getMusicFlag() {
        return musicFlag;
    }

    public void setMusicFlag(Integer musicFlag) {
        this.musicFlag = musicFlag;
    }


    public String toString() {
        return "Collect{user=" + this.user + ", musicType='" + this.musicType + '\'' + ", picture='" + this.picture + '\'' + ", topic='" + this.topic + '\'' + ", introduced='" + this.introduced + '\'' + ", musicFlag=" + this.musicFlag + '}';
    }
}
