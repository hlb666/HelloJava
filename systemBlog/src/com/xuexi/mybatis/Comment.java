package com.xuexi.mybatis;

public class Comment {
	private Integer id;
	private String content;
	private Integer bid;
	private Integer uid;
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
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Comment(Integer id, String content, Integer bid, Integer uid) {
		super();
		this.id = id;
		this.content = content;
		this.bid = bid;
		this.uid = uid;
	}
	public Comment() {
		super();
	}
	public Comment(String content, Integer bid, Integer uid) {
		super();
		this.content = content;
		this.bid = bid;
		this.uid = uid;
	}
	
	
	

}
