package com.xuexi.mybatis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.xuexi.mybatis.common.WordFilter;
import com.xuexi.mybatis.service.BackOperateImpl;

@RequestMapping("/backOperateController")
@Controller
public class BackOperateController {
	
	@Autowired
	private  BackOperateImpl backOperateImpl;
	
	BackController backController = new BackController();
	
	//增加文章
	@RequestMapping("/insertBlog")
	public String insertBlog(HttpServletRequest request,HttpSession session) throws Exception{
		Date day=new Date();    
        WordFilter filter = new WordFilter();
        filter.init();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		System.out.println(df.format(day)); 
		String dates = df.format(day);
		
		Date date = df.parse(dates);
		String title = request.getParameter("title");
		String contents = request.getParameter("content");
		String keyword = request.getParameter("keywords");
		String description = request.getParameter("describe");
		String type = request.getParameter("type");
		String lable = request.getParameter("lable");
		Object uids = session.getAttribute("uid");
		int uid = Integer.parseInt(String.valueOf(uids));		
		
		String content = filter.doFilter(contents);
				
		Article article = new Article(title, lable, date, content, uid, keyword, description, type);
		backOperateImpl.insertBlog(article);
		
        System.out.println(title+content+keyword+description+type+lable+uid);
		
		return "back/add-article";
	}
	
	//删除单篇文章
	@RequestMapping("/deleteArticle")
	public String deleteArticle(HttpServletRequest request,HttpSession session){
		
			String ids = request.getParameter("id");
			int id = Integer.parseInt(ids);
			backOperateImpl.deleteArticle(id);		
	        Object uids = session.getAttribute("uid");	        
	        int uid = Integer.parseInt(String.valueOf(uids));
			List<Article> articles = backOperateImpl.selectAll(uid);
		    request.setAttribute("list", articles);
		    
		   return "back/article";
	}
	
	//到修改界面
	@RequestMapping("/updataArticle")
	public String updataArticle(HttpServletRequest request){
			String ids = request.getParameter("id");
			int id = Integer.parseInt(ids);
			Article article = backOperateImpl.getone(id);
			request.setAttribute("article", article);
			System.out.println(article.getLable());
            return "back/update-article";
	 }
	
	
	//文章的修改提交
	@RequestMapping("/toUpdataArticle")
	public String toUpdataArticle(HttpServletRequest request,HttpSession session) throws Exception{

        WordFilter filter = new WordFilter();
        filter.init();
 
		String title = request.getParameter("title");
		String contents = request.getParameter("content");
		String keyword = request.getParameter("keywords");
		String description = request.getParameter("describe");
		String type = request.getParameter("type");
		String lable = request.getParameter("lable");				
		String content = filter.doFilter(contents);
	    String ids = request.getParameter("id");
	    int id = Integer.parseInt(ids);
	    
		Article article = new Article();
		article.setId(id);
		article.setTitle(title);
		article.setContent(content);
		article.setKeyword(keyword);
		article.setDescription(description);
		article.setType(type);
		article.setLable(lable);	
		backOperateImpl.toUpdataArticle(article);
        
	   return this.toArticle(request);
	}
	
	
	@RequestMapping("/toArticle")
	public String toArticle(HttpServletRequest request){
		HttpSession session = request.getSession();
		Object uids = session.getAttribute("uid");	        
		int uid = Integer.parseInt(String.valueOf(uids));
		List<Article> articles = backOperateImpl.selectAll(uid);
	    request.setAttribute("list", articles);
		
		return "back/article";
	}
	
	//删除多篇文章
	@RequestMapping("/deleteArticles")
	public String deleteArticles(HttpServletRequest request){
		String boxStr[] = request.getParameterValues("checkbox[]");
		int ids[] = new int[boxStr.length];
		for (int i = 0; i < boxStr.length; i++) {
			ids[i] = Integer.parseInt(boxStr[i]);
		}
		backOperateImpl.deleteArticles(ids);		
		return this.toArticle(request);
	  }
	
	//公告的发布
	@RequestMapping("/addAffiche")
	public String addAffiche(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		Object uids = session.getAttribute("uid");
		int uid = Integer.parseInt(String.valueOf(uids));
		String content = request.getParameter("content");
		String dates = request.getParameter("date");
	    SimpleDateFormat   formatter = new SimpleDateFormat("yyyy-mm-dd");
		Date   date   =   formatter.parse(dates);
		Affiche affiche = new Affiche(content, date,uid);
		backOperateImpl.addNotice(affiche);
		return this.notice(request);
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
	
	@RequestMapping("/deleteAffiche")
	public String deleteAffiche(HttpServletRequest request){
		String ids = request.getParameter("id");
		int id = Integer.parseInt(ids);
		backOperateImpl.deleteAffiche(id);
		return this.notice(request);
	}
	
	@RequestMapping("/deleteAffiches")
	public String deleteAffiches(HttpServletRequest request){
		
		String boxStr[] = request.getParameterValues("checkbox[]");
		int ids[] = new int[boxStr.length];
		for (int i = 0; i < boxStr.length; i++) {
			ids[i] = Integer.parseInt(boxStr[i]);
		}
		
		backOperateImpl.deleteAffiches(ids);		
		return this.notice(request);
	}
	
	
	@RequestMapping("/addLink")
	public String addLink(HttpServletRequest request){
		HttpSession session = request.getSession();
		Object uids = session.getAttribute("uid");
		int uid = Integer.parseInt(String.valueOf(uids));
		String title = request.getParameter("title");
		String address = request.getParameter("address");
		String descript = request.getParameter("descript");
		
		Link link = new Link(title, address, descript,uid);
		backOperateImpl.addLink(link);
		
		return this.getLink(request);
	}
	
	public String getLink(HttpServletRequest request){
		HttpSession session = request.getSession();
		Object uids = session.getAttribute("uid");
		int uid = Integer.parseInt(String.valueOf(uids));
		
		List<Link> links = backOperateImpl.getLink(uid);
		request.setAttribute("links", links);
		
		return "back/flink";	
	}
	
	@RequestMapping("/deleteLink")
	public String deleteLink(HttpServletRequest request){
		String ids = request.getParameter("id");
		int id = Integer.parseInt(ids);		
		backOperateImpl.deleteLink(id);	
		return this.getLink(request);
	}
	
	@RequestMapping("/deleteLinks")
	public String deleteLinks(HttpServletRequest request){
		String boxStr[] = request.getParameterValues("checkbox[]");
		int ids[] = new int[boxStr.length];
		for (int i = 0; i < boxStr.length; i++) {
			ids[i] = Integer.parseInt(boxStr[i]);
		}
		backOperateImpl.deleteLinks(ids);

		return this.getLink(request);
	}
	
	@RequestMapping("/deleteUser")
	public String deleteUser(HttpServletRequest request){
		String ids = request.getParameter("id");
		int id = Integer.parseInt(ids);
		System.out.println(id);
		backOperateImpl.deleteUser(id);
	 	List<User> list = backOperateImpl.list();
    	request.setAttribute("list", list);
    	return "back/manage-user";
		
	}


	
}
