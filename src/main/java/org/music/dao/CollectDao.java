package org.music.dao;

import org.music.entity.Collect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectDao {
    List<Collect> queryCollect(@Param("user") Integer var1);

    int insertIntoCollect(@Param("user") Integer var1, @Param("musicType") String var2, @Param("picture") String var3, @Param("topic") String var4, @Param("introduced") String var5, @Param("musicFlag") Integer var6);

    int deleteMusicList(@Param("user") Integer var1, @Param("musicFlag") Integer var2);
}
