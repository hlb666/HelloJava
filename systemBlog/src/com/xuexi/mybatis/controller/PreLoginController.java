package com.xuexi.mybatis.controller;

import java.util.List;

import javax.management.loading.PrivateClassLoader;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.User;
import com.xuexi.mybatis.dao.UserLoginMapper;
import com.xuexi.mybatis.service.PreOperateImpl;
import com.xuexi.mybatis.service.UserLoginServiceImpl;


@RequestMapping("/preLoginController")
@Controller
public class PreLoginController {
	
	@Autowired
	private UserLoginServiceImpl userLoginServiceImpl;
	@Autowired
	private  PreOperateImpl preOperateImpl;
	
	@RequestMapping("/login")
	private String Login(HttpServletRequest request,HttpSession session){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+password);		
		User user = userLoginServiceImpl.Login(username, password);
		if(user!=null){	
			Integer id = user.getId();
			String name = user.getUsername();
			String pic = user.getPic();
			Integer integral = user.getIntegral();
			
			List<Article> articles = preOperateImpl.selectAll();
		    request.setAttribute("list", articles);
			
		    session.setAttribute("uuid", id);
			session.setAttribute("name", name);
			session.setAttribute("pic", pic);
			request.setAttribute("MSG", "恭喜你登录成功");
		return "pages/index";
		}
		request.setAttribute("MSG", "登录失败，请检查账号密码");
	    return "pages/index";
		
	}

}
