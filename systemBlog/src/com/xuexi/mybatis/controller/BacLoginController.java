package com.xuexi.mybatis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xuexi.mybatis.User;
import com.xuexi.mybatis.service.BacUserLoginServiceImp;
import com.xuexi.mybatis.service.UserLoginServiceImpl;


@RequestMapping("/bacLoginController")
@Controller
public class BacLoginController {

	@Autowired
	private BacUserLoginServiceImp bacuserLoginServiceImpl;
	
	
	@RequestMapping("/login")
	private String Login(HttpServletRequest request,HttpSession session){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+password);		
		User user = bacuserLoginServiceImpl.Login(username, password);
		if(user!=null){	
			Integer id = user.getId();
			String usernames = user.getUsername();
			Integer integral = user.getIntegral();
			session.setAttribute("uid", id);
			session.setAttribute("integral", integral);
			session.setAttribute("username", usernames);
		return "back/index";
		}
	    return "back/login";
		
	}

}