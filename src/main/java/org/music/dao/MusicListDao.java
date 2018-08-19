package org.music.dao;

import org.music.entity.MusicList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MusicListDao {
    List<MusicList> queryAll(@Param("musicType") String var1);

    int deleteMusic(@Param("musicListName") String var1);

    List<MusicList> queryTheMusicList();

    MusicList queryMusicList(@Param("musicFlag") Integer musicFlag, @Param("musicType") String musicType);
}
