package com.xuexi.mybatis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuexi.mybatis.User;
import com.xuexi.mybatis.dao.UserLoginMapper;



@Service
public class UserLoginServiceImpl implements IUserLoginService{
	
	@Autowired
	private UserLoginMapper userLoginMapper;

	@Override
	public User Login(String name, String password) {
		User user = userLoginMapper.Login(name, password);
		return user;
	}	

}
