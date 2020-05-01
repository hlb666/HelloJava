package com.ftf.service;


import java.util.List;

import com.ftf.beans.Admin;
import com.ftf.beans.Team;
import com.ftf.beans.User;

public interface IUserLoginService {
	public void add(User user);
	public User check(String name);
    public User getPassword(User user);
    public User getExit(User user);
    public User getById(Object id);
    public Admin Login(Admin admin);
    public void delectUser(Integer id);
    public void delectZudui(Integer id);
    public List<Team> All();
}
