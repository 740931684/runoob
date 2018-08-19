package org.music.dao;

import org.music.entity.MusicDetailMusic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MusicDetailMusicDao {
    List<MusicDetailMusic> queryMusicInfo(@Param("musicFlag") Integer var1, @Param("musicType") String var2);

    List<MusicDetailMusic> queryMusicByName(String var1);

    List<MusicDetailMusic> queryMusic();
}
