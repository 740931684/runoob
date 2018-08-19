package org.music.entity;

public class MusicList {
    private String musicType;
    private String picture;
    private String topic;
    private String detail;
    private String author;
    private int musicFlag;

    public MusicList() {
    }

    public String getMusicType() {
        return this.musicType;
    }

    public void setMusicType(String musicType) {
        this.musicType = musicType;
    }

    public String getPicture() {
        return this.picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getTopic() {
        return this.topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getDetail() {
        return this.detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getMusicFlag() {
        return this.musicFlag;
    }

    public void setMusicFlag(int musicFlag) {
        this.musicFlag = musicFlag;
    }

    /*public String toString() {
        return "('" + this.musicType + "','" + this.picture + "','" + this.topic + "','" + this.detail + "','" + this.author + "'," + this.musicFlag + ')';
    }*/

    @Override
    public String toString() {
        return "MusicList{" +
                "musicType='" + musicType + '\'' +
                ", picture='" + picture + '\'' +
                ", topic='" + topic + '\'' +
                ", detail='" + detail + '\'' +
                ", author='" + author + '\'' +
                ", musicFlag=" + musicFlag +
                '}';
    }
}
