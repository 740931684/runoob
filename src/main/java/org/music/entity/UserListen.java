package org.music.entity;

public class UserListen {
    private Integer id;
    private Integer user;
    private String musicName;
    private String address;
    private Integer countMusic;

    public UserListen() {
    }

    public Integer getCountMusic() {
        return this.countMusic;
    }

    public void setCountMusic(Integer countMusic) {
        this.countMusic = countMusic;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser() {
        return this.user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    public String getMusicName() {
        return this.musicName;
    }

    public void setMusicName(String musicName) {
        this.musicName = musicName;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String toString() {
        return "UserListen{id=" + this.id + ", user=" + this.user + ", musicName='" + this.musicName + '\'' + ", address='" + this.address + '\'' + '}';
    }
}
