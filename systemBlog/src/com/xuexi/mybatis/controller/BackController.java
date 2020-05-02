package com.xuexi.mybatis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xuexi.mybatis.Affiche;
import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.Link;
import com.xuexi.mybatis.User;
import com.xuexi.mybatis.service.BackOperateImpl;


@RequestMapping("/backController")
@Controller
public class BackController {
	@Autowired
	private  BackOperateImpl backOperateImpl;
	
	
	@RequestMapping("/index")
	public String toBack(HttpServletRequest request){
		return "back/index";
	}
	
	@RequestMapping("/loginlog")
	public String loginlog(HttpServletRequest request){
		return "back/loginlog";
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request){
		return "back/login";
	}
	
	@RequestMapping("/manage-user")
	public String manageuser(HttpServletRequest request){
		    HttpSession session=request.getSession();
	        Object uids = session.getAttribute("uid");	        
			int uid = Integer.parseInt(String.valueOf(uids));
		    Integer identify = backOperateImpl.userIdentify(uid);
		    if(identify==1){
		    	List<User> list = backOperateImpl.list();
		    	request.setAttribute("list", list);
		    	return "back/manage-user";				    	
		    }else{
		    	request.setAttribute("MSG", "您不是超级管理员没有权限！");
		    	return "back/index";
		    			
		    	
		    }
		
		
		
	}
	
	@RequestMapping("/notice")
	public String notice(HttpServletRequest request){
		HttpSession session = request.getSession();
		Object uids = session.getAttribute("uid");
		int uid = Integer.parseInt(String.valueOf(uids));
		List<Affiche> affiches = backOperateImpl.affiches(uid);
		request.setAttribute("affiches",affiches);
		return "back/notice";
	}
	
	@RequestMapping("/readset")
	public String readset(HttpServletRequest request){
		return "back/readset";
	}
	
	@RequestMapping("/setting")
	public String setting(HttpServletRequest request){
		return "back/setting";
	}
	
	@RequestMapping("/update-article")
	public String updatearticle(HttpServletRequest request){
		return "back/update-article";
	}
	
	@RequestMapping("/update-category")
	public String updatecategory(HttpServletRequest request){
		return "back/update-category";
	}
	
	@RequestMapping("/update-flink")
	public String updateflink(HttpServletRequest request){
		return "back/update-flink";
	}
	
	@RequestMapping("/addarticle")
	public String addarticle(HttpServletRequest request){
		return "back/add-article";
	}
	
	@RequestMapping("/addcategory")
	public String addcategory(HttpServletRequest request){
		return "back/add-category";
	}
	
	@RequestMapping("/add-flink")
	public String addflink(HttpServletRequest request){
		return "back/add-flink";
	}
	
	@RequestMapping("/add-notice")
	public String addnotice(HttpServletRequest request){
		return "back/add-notice";
	}
	
	@RequestMapping("/article")
	public String article(HttpServletRequest request){
		
		    HttpSession session=request.getSession();
	        Object uids = session.getAttribute("uid");	        
			int uid = Integer.parseInt(String.valueOf(uids));

			List<Article> articles = backOperateImpl.selectAll(uid);

		    request.setAttribute("list", articles);
		   return "back/article";
	}
	
	@RequestMapping("/category")
	public String category(HttpServletRequest request){
		return "back/category";
	}
	
	@RequestMapping("/comment")
	public String comment(HttpServletRequest request){
		return "back/comment";
	}
	
	@RequestMapping("/upload")
	public String upload(HttpServletRequest request){
		return "back/upload";
	}
	
	
	
	@RequestMapping("/flink")
	public String flink(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		Object uids = session.getAttribute("uid");
		int uid = Integer.parseInt(String.valueOf(uids));
		
		List<Link> links = backOperateImpl.getLink(uid);
		request.setAttribute("links", links);
		
		return "back/flink";	
	}
	

}
