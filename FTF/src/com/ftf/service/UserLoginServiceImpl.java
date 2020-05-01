package com.ftf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ftf.beans.Admin;
import com.ftf.beans.Team;
import com.ftf.beans.User;
import com.ftf.dao.UserLoginMapper;

@Service
public class UserLoginServiceImpl implements IUserLoginService {
	
	@Autowired
	private UserLoginMapper userLoginMapper;
    
	@Override
	public void add(User user) {	
		userLoginMapper.add(user);	
	}

	@Override
	public User check(String name) {
		User result = userLoginMapper.check(name);
		return result;
	}

	@Override
	public User getPassword(User user) {
		User result = userLoginMapper.getPassword(user);
		return result;
	}

	@Override
	public User getExit(User user) {
		User result = userLoginMapper.getExit(user);
		return result;
	}

	@Override
	public User getById(Object id) {
		User result = userLoginMapper.getById(id);
		return result;
	}
	
	@Override
	public Admin Login(Admin admin) {
	  Admin admin2 = userLoginMapper.Login(admin);	  
		return admin2;
	}
	@Override
	public void delectUser(Integer id){
		
		userLoginMapper.delectUser(id);
	}
	
	public void delectZudui(Integer id){
		
		userLoginMapper.delectZudui(id);
		
	}

	@Override
	public List<Team> All() {
		List<Team> result =  userLoginMapper.All();
		return result;
	}
}
