package com.xuexi.mybatis.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.websocket.Session;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xuexi.mybatis.Affiche;
import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.Comment;
import com.xuexi.mybatis.service.PreOperateImpl;


@RequestMapping("/preOperateController")
@Controller
public class PreOperateController {
	
	
	@Autowired
	private  PreOperateImpl preOperateImpl;

	
	@RequestMapping("/prelookArticle")
	public String prelookArticle(HttpServletRequest request){
			String ids = request.getParameter("id");
			int id = Integer.parseInt(ids);
			
			Article article = preOperateImpl.getone(id);
			List<Comment> comments = preOperateImpl.allComments(id);
			
			List<Affiche> affiche = preOperateImpl.selectgong();
			request.setAttribute("affiche", affiche);
			
			System.out.println(comments.size());
			request.setAttribute("comments", comments);
			request.setAttribute("article", article);
			System.out.println(article.getLable());
            return "pages/article";
	 }
	
	public String selectArticle(HttpServletRequest request,int id){
		
		Article article = preOperateImpl.getone(id);
		
		List<Comment> comments = preOperateImpl.allComments(id);
		
		request.setAttribute("comments", comments);
		request.setAttribute("article", article);
		System.out.println(article.getLable());
        return "pages/article";
	}
	
	
	
	@RequestMapping("/autoComplete")
	public void autoComplete(HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf8");
		List<Article> articles = preOperateImpl.selectAll();
		
		String names[] =new String[articles.size()];  //这里可以把后台数据集 转为数组
//		//把 集合 的数据装在数组中
		for (int i=0;i<articles.size();i++) {
			names[i]=articles.get(i).getTitle();
		}


		String json=  JSONArray.fromObject(names).toString();
		
		//响应输出
		response.getWriter().append(json);
		
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request){
		String name = request.getParameter("search");
		
		List<Article> articles = preOperateImpl.search(name);
		request.setAttribute("articles", articles);
		request.setAttribute("type", "查询结果");
		return "pages/category";
	}
	
	
	@RequestMapping("/insertComment")
	public String insertComment(HttpServletRequest request){
		HttpSession session = request.getSession();
		String content = request.getParameter("comment");
		String bids = request.getParameter("bid");
		Object uids = session.getAttribute("uuid");
		int bid = Integer.parseInt(bids);
		int uid = Integer.parseInt(String.valueOf(uids));
		
		Comment comments = new Comment(content, bid, uid);
		preOperateImpl.insertComment(comments);
		
		return this.selectArticle(request, bid);
	}
	
	
}
