package org.music.service;

import org.music.entity.*;

import java.util.List;

public interface MusicService {
    //检测用户账户密码是否正确
    boolean check(Integer user, Integer password);
    //用户登录
    User login(Integer user);
    //注册账号
    int insertInfo(String name, Integer user, Integer password);
    //用户试听记录查询
    List<UserListen> queryAll(Integer user);
    //清除用户试听记录
    int deleteMusic(Integer user);
    //当用户点击歌曲向试听记录表插入数据
    int insertMusic(Integer user, String name, String address);
    //查询歌单列表
    List<MusicList> queryMusicList(String musicType);
    //查询歌单详情页作者歌单名等记录
    MusicList queryMusicDetail(Integer musicFlag, String musicType);
    //查询具体歌单歌曲列表
    List<MusicDetailMusic> queryMusicInfo(Integer musicFlag, String musicType);
    //查询界面查询歌曲的方法
    List<MusicDetailMusic> queryMusicByName(String musicName);
    //缓存全部的歌曲
    List<MusicDetailMusic> queryDetailMusic();
    //查询收藏的歌单
    List<Collect> queryCollectMusic(Integer user);
    //删除收藏的歌单
    int deleteMusicList(Integer user, Integer musicFlag);
    //点击收藏歌单
    int insertToCollect(Integer user, String musicType, String picture, String topic, String introduced, Integer musicFlag);
    //主界面自动检索最热的歌曲
    List<UserListen> queryHottestMusic();
    //修改用户登录密码
    int updateInfo(Integer user, Integer password);
    //获取所有的用户
    List<User> queryAllUser();
    //删除用户个人信息
    int deleteUserInfo(Integer user);
    //获取所有的歌单信息
    List<MusicList> queryAllMusicList();
    //删除某个歌单信息
    int deleteMusicList(String musicListName);

    //转账
    void transfer(String fromAcount, String toAcount, int money);
}
