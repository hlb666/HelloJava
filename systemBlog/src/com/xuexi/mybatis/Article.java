package com.xuexi.mybatis;

import java.util.Date;





public class Article {
    private int id;
    private String title;
    private String lable;
    private Date date;
    private int numpeople;
    private String content;
    private int uid;
    private String keyword;
    private String description;
    private String type;
    private String images;
    
    
    
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public Article(int id, String title, String lable, Date date,
			int numpeople, String content, int uid, String keyword,
			String description, String type, String images) {
		super();
		this.id = id;
		this.title = title;
		this.lable = lable;
		this.date = date;
		this.numpeople = numpeople;
		this.content = content;
		this.uid = uid;
		this.keyword = keyword;
		this.description = description;
		this.type = type;
		this.images = images;
	}
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Article(int id, String title, String lable, Date date,
			int numpeople, String content, int uid, String keyword,
			String description, String type) {
		super();
		this.id = id;
		this.title = title;
		this.lable = lable;
		this.date = date;
		this.numpeople = numpeople;
		this.content = content;
		this.uid = uid;
		this.keyword = keyword;
		this.description = description;
		this.type = type;
	}
	
	
	
	public Article(String title, String lable, Date date, String content,
			int uid, String keyword, String description, String type) {
		super();
		this.title = title;
		this.lable = lable;
		this.date = date;
		this.content = content;
		this.uid = uid;
		this.keyword = keyword;
		this.description = description;
		this.type = type;
	}
	public Article(String title, String lable, Date date, int numpeople,
			String content, int uid, String keyword, String description,
			String type) {
		super();
		this.title = title;
		this.lable = lable;
		this.date = date;
		this.numpeople = numpeople;
		this.content = content;
		this.uid = uid;
		this.keyword = keyword;
		this.description = description;
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLable() {
		return lable;
	}
	public void setLable(String lable) {
		this.lable = lable;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getNumpeople() {
		return numpeople;
	}
	public void setNumpeople(int numpeople) {
		this.numpeople = numpeople;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	} 
}
