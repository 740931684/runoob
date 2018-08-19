package org.music.dao;

import org.apache.ibatis.annotations.Param;

public interface MacountDao {
    int addMacount(@Param("name") String name, @Param("money") int money);
    int reduceMacount(@Param("name") String name, @Param("money") int money);
}
