package org.music.dao;

import org.music.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User login(Integer var1);

    int register(@Param("name") String var1, @Param("user") Integer var2, @Param("password") Integer var3);

    int updateInfo(@Param("user") Integer var1, @Param("password") Integer var2);

    List<User> queryAllUser();

    int deleteInfo(@Param("user") Integer var1);
}
