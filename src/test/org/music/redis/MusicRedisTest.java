package org.music.redis;

import com.google.gson.Gson;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.music.service.impl.MusicServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-*.xml")
public class MusicRedisTest {
    @Autowired
    MusicRedis redis;

    @Autowired
    MusicServiceImpl musicService;


    @Test
    public void setRedis(){
          redis.hset("index","hottest",new Gson().toJson(musicService.queryHottestMusic()));
          redis.musicListHset("list","musicList",musicService.queryAllMusicList());
          redis.musicDetailMusicsHset("detailMusic","allOfMusic",musicService.queryDetailMusic());
    }

}