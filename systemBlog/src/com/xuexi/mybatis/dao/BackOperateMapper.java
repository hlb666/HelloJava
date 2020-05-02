package com.xuexi.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xuexi.mybatis.Affiche;
import com.xuexi.mybatis.Article;
import com.xuexi.mybatis.Link;
import com.xuexi.mybatis.User;

public interface BackOperateMapper {
	
	public void insertBlog(@Param("article")Article article);
	public List<Article> selectAll(@Param("uid")int uid);
	public void deleteArticle(@Param("id")int id);
	public Article getone(@Param("id")int id);
	public void toUpdataArticle(@Param("article")Article article);
	public void deleteArticles(@Param("ids")int[] ids);
	public void addNotice(@Param("affiche")Affiche affiche);
	public List<Affiche> affiches(@Param("uid")int uid);
	public void deleteAffiche(@Param("id")int id);
	public void deleteAffiches(@Param("ids")int[] ids);
	public void addLink(@Param("link")Link link);
	public List<Link> getLink(@Param("uid")int uid);
	public void deleteLink(@Param("id")int id);
	public void deleteLinks(@Param("ids")int[] ids);
	public Integer userIdentify(@Param("uid")int uid);
	public List<User> list();
	public void deleteUser(@Param("id")int id);
	

}
