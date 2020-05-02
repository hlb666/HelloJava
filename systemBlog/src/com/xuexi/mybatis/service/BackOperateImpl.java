package com.xuexi.mybatis.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuexi.mybatis.Affiche;
import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.Link;
import com.xuexi.mybatis.User;
import com.xuexi.mybatis.dao.BackOperateMapper;


@Service
public class BackOperateImpl implements IBackOperate{
	
	@Autowired
	private BackOperateMapper backMapper;

	@Override
	public void insertBlog(Article article) {
	  backMapper.insertBlog(article);
	}

	@Override
	public List<Article> selectAll(int uid) {
		List<Article> articles = backMapper.selectAll(uid);
		return articles;
	}

	@Override
	public void deleteArticle(int id) {
		backMapper.deleteArticle(id);
	}

	@Override
	public Article getone(int id) {
	     Article article  = backMapper.getone(id);
		  return article;
	}

	@Override
	public void toUpdataArticle(Article article) {
		backMapper.toUpdataArticle(article);
		
	}

	@Override
	public void deleteArticles(int[] ids) {
		backMapper.deleteArticles(ids);
		
	}

	@Override
	public void addNotice(Affiche affiche) {
      backMapper.addNotice(affiche);		
	}

	@Override
	public List<Affiche> affiches(int uid) {
		List<Affiche> affiches = backMapper.affiches(uid);	
		return affiches;
	}

	@Override
	public void deleteAffiche(int id) {
		backMapper.deleteAffiche(id);
		
	}

	@Override
	public void deleteAffiches(int[] ids) {
	  backMapper.deleteAffiches(ids);
		
	}

	@Override
	public void addLink(Link link) {
		backMapper.addLink(link);	
	}

	@Override
	public List<Link> getLink(int uid) {
		List<Link> links = backMapper.getLink(uid);
		return links;
	}

	@Override
	public void deleteLink(int id) {
		backMapper.deleteLink(id);
		
	}

	@Override
	public Integer userIdentify(int uid) {

		return backMapper.userIdentify(uid);
	}

	@Override
	public List<User> list() {
		List<User> list = backMapper.list();
		
		return list;
	}

	@Override
	public void deleteUser(int id) {
	 backMapper.deleteUser(id);
		
	}

	@Override
	public void deleteLinks(int[] ids) {
		backMapper.deleteLinks(ids);
		
	}

}
