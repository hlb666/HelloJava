package com.xuexi.mybatis.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xuexi.mybatis.Affiche;
import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.Link;
import com.xuexi.mybatis.User;

public interface IBackOperate {
	public void insertBlog(Article article);
	public List<Article> selectAll(int uid);
	public void deleteArticle(int id);
	public Article getone(int id);
	public void toUpdataArticle(Article article);
	public void deleteArticles(int[] ids);
	public void addNotice(Affiche affiche);
	public List<Affiche> affiches(int uid);
	public void deleteAffiche(int id);
	public void deleteAffiches(int[] ids);
	public void addLink(Link link);
	public List<Link> getLink(int uid);
	public void deleteLink(int id);
	public Integer userIdentify(int uid);
	public List<User> list();
	public void deleteUser(int id);
	public void deleteLinks(int[] ids);

}
