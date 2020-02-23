package com.xuexi.mybatis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuexi.mybatis.User;
import com.xuexi.mybatis.dao.BacUserLoginMapper;
import com.xuexi.mybatis.dao.UserLoginMapper;



@Service
public class BacUserLoginServiceImp implements IBacUserLoginService{
	
	@Autowired
	private BacUserLoginMapper bacuserLoginMapper;

	@Override
	public User Login(String name, String password) {
		User user = bacuserLoginMapper.Login(name, password);
		return user;
	}	

}