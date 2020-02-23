package com.xuexi.mybatis.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuexi.mybatis.Affiche;
import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.Comment;
import com.xuexi.mybatis.Link;
import com.xuexi.mybatis.dao.BackOperateMapper;
import com.xuexi.mybatis.dao.PreOperateMapper;


@Service
public class PreOperateImpl implements IPreOperate {

	@Autowired
	private PreOperateMapper preMapper;

	@Override
	public List<Article> selectAll() {
		List<Article> articles = preMapper.selectAll();
		return articles;
	}
	@Override
	public List<Article> selectAllfive() {
		List<Article> articles = preMapper.selectAllfive();
		return articles;
	}
	@Override
	public Article getone(int id) {
	     Article article  = preMapper.getone(id);
		  return article;
	}

	@Override
	public List<Article> getbytype(String type) {
		List<Article> articles = preMapper.getbytype(type);
		return articles;
	}
	@Override
	public List<Link> selectlink() {		
		List<Link> link = preMapper.selectlink();
		return link;
	}
	@Override
	public List<Affiche> selectgong() {
		List<Affiche> link = preMapper.selectgong();
		return link;	
	}
	@Override
	public List<Article> search(@Param("name") String name) {
		List<Article> articles = preMapper.search(name);
		return articles;
	}
	@Override
	public void insertComment(Comment comment) {
		preMapper.insertComment(comment);
		
	}
	@Override
	public List<Comment> allComments(int bid) {
		List<Comment> comments = preMapper.allComments(bid);
		return comments;
	}
}
