package org.music.entity;

public class MusicDetailMusic {
    private Integer id;
    private Integer musicFlag;
    private String musicName;
    private String musicAddress;
    private String musicType;

    public String getMusicType() {
        return this.musicType;
    }

    public void setMusicType(String musicType) {
        this.musicType = musicType;
    }

    public MusicDetailMusic() {
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMusicName() {
        return this.musicName;
    }

    public Integer getMusicFlag() {
        return this.musicFlag;
    }

    public void setMusicFlag(Integer musicFlag) {
        this.musicFlag = musicFlag;
    }

    public void setMusicName(String musicName) {
        this.musicName = musicName;
    }

    public String getMusicAddress() {
        return this.musicAddress;
    }

    public void setMusicAddress(String musicAddress) {
        this.musicAddress = musicAddress;
    }

    public String toString() {
        return "(" + this.musicFlag + ",\"" + this.musicName + "\",\"" + this.musicType + "\")";
    }
}
