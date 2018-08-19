package org.music.dao;

import org.music.entity.UserListen;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserListenDao {
    List<UserListen> queryAll(@Param("user") Integer var1);

    int insertMusic(@Param("user") Integer var1, @Param("name") String var2, @Param("address") String var3);

    List<UserListen> queryHottestMusic();

    int deleteMusic(@Param("user") Integer var1);
}
