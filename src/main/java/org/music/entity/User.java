package org.music.entity;

public class User {
    private int id;
    private String name;
    private Integer user;
    private Integer password;

    public User() {
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUser() {
        return this.user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    public Integer getPassword() {
        return this.password;
    }

    public void setPassword(Integer password) {
        this.password = password;
    }

    public String toString() {
        return "User{id=" + this.id + ", name='" + this.name + '\'' + ", user=" + this.user + ", password=" + this.password + '}';
    }
}
