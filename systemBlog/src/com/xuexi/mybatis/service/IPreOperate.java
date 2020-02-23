package com.xuexi.mybatis.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xuexi.mybatis.Affiche;
import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.Comment;
import com.xuexi.mybatis.Link;

public interface IPreOperate {

	public List<Article> selectAll();
	public List<Article> selectAllfive();
	public Article getone(int id);
	public List<Article> getbytype(String type);
	public List<Link> selectlink();
	public List<Affiche> selectgong();
	public List<Article> search(String name);
	public void insertComment(Comment comment);
	public List<Comment> allComments(int bid);  
}
