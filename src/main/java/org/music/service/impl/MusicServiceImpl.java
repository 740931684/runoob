package org.music.service.impl;

import org.music.dao.*;
import org.music.entity.*;
import org.music.service.MusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MusicServiceImpl implements MusicService {
    @Autowired
    private UserDao userDao;
    @Autowired
    UserListenDao userListenDao;
    @Autowired
    MusicListDao musicListDao;
    @Autowired
    MusicDetailMusicDao musicDetailMusicDao;
    @Autowired
    CollectDao collectDao;
    @Autowired
    MacountDao macountDao;

    public MusicServiceImpl() {
    }

    public boolean check(Integer user, Integer password) {
        User u = this.userDao.login(user);
        if (u == null) {
            return false;
        } else {
            return u.getPassword() == password;
        }
    }

    public User login(Integer user) {
        return this.userDao.login(user);
    }

    public int insertInfo(String name, Integer user, Integer password) {
        return this.userDao.register(name, user, password);
    }

    public List<UserListen> queryAll(Integer user) {
        List<UserListen> userListen = this.userListenDao.queryAll(user);
        return userListen;
    }

    public int deleteMusic(Integer user) {
        return this.userListenDao.deleteMusic(user);
    }

    public int insertMusic(Integer user, String name, String address) {
        return this.userListenDao.insertMusic(user, name, address);
    }

    public List<MusicList> queryMusicList(String musicType) {
        return this.musicListDao.queryAll(musicType);
    }

    public MusicList queryMusicDetail(Integer musicFlag, String musicType) {
        return this.musicListDao.queryMusicList(musicFlag, musicType);
    }

    public List<MusicDetailMusic> queryMusicInfo(Integer musicFlag, String musicType) {
        return this.musicDetailMusicDao.queryMusicInfo(musicFlag, musicType);
    }

    public List<MusicDetailMusic> queryMusicByName(String musicName) {
        return this.musicDetailMusicDao.queryMusicByName(musicName);
    }

    @Override
    public List<MusicDetailMusic> queryDetailMusic() {
        return musicDetailMusicDao.queryMusic();
    }

    public List<Collect> queryCollectMusic(Integer user) {
        return this.collectDao.queryCollect(user);
    }

    public int deleteMusicList(Integer user, Integer musicFlag) {
        return this.collectDao.deleteMusicList(user, musicFlag);
    }

    public int insertToCollect(Integer user, String music_type, String picture, String topic, String introduced, Integer musicFlag) {
        return this.collectDao.insertIntoCollect(user, music_type, picture, topic, introduced, musicFlag);
    }

    public List<UserListen> queryHottestMusic() {
        return this.userListenDao.queryHottestMusic();
    }

    public int updateInfo(Integer user, Integer password) {
        return this.userDao.updateInfo(user, password);
    }

    public List<User> queryAllUser() {
        return this.userDao.queryAllUser();
    }

    public int deleteUserInfo(Integer user) {
        return this.userDao.deleteInfo(user);
    }

    public List<MusicList> queryAllMusicList() {
        return this.musicListDao.queryTheMusicList();
    }

    public int deleteMusicList(String musicListName) {
        return this.musicListDao.deleteMusic(musicListName);
    }


    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void transfer(String fromAcount, String toAcount, int money) {


        System.out.println("-----------转账开始-----------");
        macountDao.reduceMacount(fromAcount,money);
        macountDao.addMacount(toAcount,money);


        System.out.println("-----------转账结束-----------");
    }
}
