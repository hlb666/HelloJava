package com.xuexi.mybatis.service;

import com.xuexi.mybatis.User;

public interface IBacUserLoginService {
	public User Login(String name,String password);
}
