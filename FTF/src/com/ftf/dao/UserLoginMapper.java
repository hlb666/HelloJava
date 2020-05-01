package com.ftf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ftf.beans.Admin;
import com.ftf.beans.Team;
import com.ftf.beans.User;

public interface UserLoginMapper {
	public void add(@Param("user")User user);
    public User check(String name);  
    public User getPassword(@Param("user")User user);
    public User getExit(@Param("user")User user);
    public User getById(Object id);
    public Admin Login(@Param("admin")Admin admin);
    public void delectUser(Integer id);
    public void delectZudui(Integer id);
    public List<Team> All();
}
