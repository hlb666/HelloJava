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
import com.xuexi.mybatis.service.PreOperateImpl;


@RequestMapping("/mainController")
@Controller
public class MainController {
	
	@Autowired
	private  PreOperateImpl preOperateImpl;
	
	@RequestMapping("/tomain")
	public String toMain(HttpServletRequest request){		
		List<Article> articles = preOperateImpl.selectAll();
		List<Article> articlesfive = preOperateImpl.selectAllfive();
		List<Affiche> affiche = preOperateImpl.selectgong();
			
	    request.setAttribute("list", articles);
	    request.setAttribute("listfive", articlesfive);
	    request.setAttribute("affiche", affiche);
	    		
		return "pages/index";
	}
	
	@RequestMapping("/toreaders")
	public String toReaders(HttpServletRequest request){
		return "pages/readers";
	}
	@RequestMapping("/tolinks")
	public String tolinks(HttpServletRequest request){
		
		List<Link> link = preOperateImpl.selectlink();			
			request.setAttribute("link", link);
			return "pages/links";
		
	}
	@RequestMapping("/tocategory")
	public String toCategory(HttpServletRequest request){	
		List<Article> articlesfive = preOperateImpl.selectAllfive();
		request.setAttribute("listfive", articlesfive);		
		String identy = request.getParameter("identy");
		int identys=Integer.parseInt(identy);
		String type=null;
		
		if(identys==1){
			type="前端程序";
		}else if(identys==2){
			type="后端程序";	
		}else if(identys==3){
			type="管理系统";     
		}else if(identys==4){
			type="授人以渔";     
		}else if(identys==5){
			type="程序人生";     
		}
		
		List<Article> articles = preOperateImpl.getbytype(type);
		System.out.println(articles.size());
		request.setAttribute("articles", articles);
		request.setAttribute("type", type);
	
						
		return "pages/category";
	}
	@RequestMapping("/toarticle")
	public String toArticle(HttpServletRequest request){
		
		return "pages/article";
	}
	@RequestMapping("/totags")
	public String toTags(HttpServletRequest request){
		return "pages/tags";
	}
	@RequestMapping("/toindex")
	public String toIndex(HttpServletRequest request){
		return "pages/index";
	}
	
	
	
}
