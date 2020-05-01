package com.ftf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ftf.beans.ErWeiMa;
import com.ftf.beans.User;
import com.ftf.dao.UserUpdateMapper;



@Service
public class UserUpdateServiceImpl implements IUserUpdateService {
	
	@Autowired
	private UserUpdateMapper userUpdateMapper;

	@Override
	public void updateUser(User user) {
	  userUpdateMapper.updateUser(user);	
	}

	public ErWeiMa erWeiMa(int id) {
		ErWeiMa result = userUpdateMapper.erWeiMa(id);
		return result;
	}
}
