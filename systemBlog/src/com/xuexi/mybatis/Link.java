package com.xuexi.mybatis;

public class Link {
	
	private Integer id;
	private String title;
	private String address;
	private String descript;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public Link(String title, String address, String descript) {
		super();
		this.title = title;
		this.address = address;
		this.descript = descript;
	}
	public Link() {
		super();
	}
	public Link(String title, String address, String descript, Integer uid) {
		super();
		this.title = title;
		this.address = address;
		this.descript = descript;
		this.uid = uid;
	}
	
	
	
	

}
