package com.xuexi.mybatis;

import java.util.Date;

public class Affiche {
	
	private Integer id;
	private String content;
	private Date date;
	private Integer uid;
	
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Affiche(Integer id, String content, Date date) {
		super();
		this.id = id;
		this.content = content;
		this.date = date;
	}
	public Affiche() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Affiche(String content, Date date) {
		super();
		this.content = content;
		this.date = date;
	}
	public Affiche(String content, Date date, Integer uid) {
		super();
		this.content = content;
		this.date = date;
		this.uid = uid;
	}
	
	

}
