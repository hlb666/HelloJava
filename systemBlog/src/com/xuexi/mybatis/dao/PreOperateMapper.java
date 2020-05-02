package com.xuexi.mybatis.dao;

import java.util.List;



import org.apache.ibatis.annotations.Param;

import com.xuexi.mybatis.Affiche;
import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.Comment;
import com.xuexi.mybatis.Link;

public interface PreOperateMapper {

	public List<Article> selectAll();
	public List<Article> selectAllfive();
	public Article getone(@Param("id")int id);
	public List<Article> getbytype(@Param("type")String type);
	public List<Link> selectlink();
	public List<Affiche> selectgong();
	public List<Article> search(@Param("name")String name); 
	public void insertComment(@Param("comment")Comment comment);
	public List<Comment> allComments(@Param("bid")int bid);  
	
}
