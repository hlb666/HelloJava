package com.xuexi.mybatis.dao;

import org.apache.ibatis.annotations.Param;

import com.xuexi.mybatis.User;

public interface BacUserLoginMapper {

	public User Login(@Param("name")String name,@Param("password")String password);
}
