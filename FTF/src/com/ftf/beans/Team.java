package com.ftf.beans;

import java.math.BigDecimal;

public class Team {
	private int id;
	private String pic;
	private String title;
	private int uid;
	private int tid;
	private String date;
	private String content;
	private BigDecimal lng;
	private BigDecimal lat;
	private String distance;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public BigDecimal getLng() {
		return lng;
	}
	public void setLng(BigDecimal lng) {
		this.lng = lng;
	}
	public BigDecimal getLat() {
		return lat;
	}
	public void setLat(BigDecimal lat) {
		this.lat = lat;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public Team(int id, String pic, String title, int uid, int tid,
			String date, String content, BigDecimal lng, BigDecimal lat,
			String distance) {
		super();
		this.id = id;
		this.pic = pic;
		this.title = title;
		this.uid = uid;
		this.tid = tid;
		this.date = date;
		this.content = content;
		this.lng = lng;
		this.lat = lat;
		this.distance = distance;
	}
	
	public Team(int id, String pic, String title, int uid, int tid,
			String date, String content, BigDecimal lng, BigDecimal lat
			) {
		super();
		this.id = id;
		this.pic = pic;
		this.title = title;
		this.uid = uid;
		this.tid = tid;
		this.date = date;
		this.content = content;
		this.lng = lng;
		this.lat = lat;
	}
	
	public Team( String pic, String title, int uid, int tid,
			String date, String content, BigDecimal lng, BigDecimal lat
			) {
		super();
		this.pic = pic;
		this.title = title;
		this.uid = uid;
		this.tid = tid;
		this.date = date;
		this.content = content;
		this.lng = lng;
		this.lat = lat;
	}
	
	public Team(String pic, String title, int uid, int tid, String date,
			String content, BigDecimal lng, BigDecimal lat, String distance) {
		super();
		this.pic = pic;
		this.title = title;
		this.uid = uid;
		this.tid = tid;
		this.date = date;
		this.content = content;
		this.lng = lng;
		this.lat = lat;
		this.distance = distance;
	}
	@Override
	public String toString() {
		return "Team [id=" + id + ", pic=" + pic + ", title=" + title
				+ ", uid=" + uid + ", tid=" + tid + ", date=" + date
				+ ", content=" + content + ", lng=" + lng + ", lat=" + lat
				+ ", distance=" + distance + ", getId()=" + getId()
				+ ", getPic()=" + getPic() + ", getTitle()=" + getTitle()
				+ ", getUid()=" + getUid() + ", getTid()=" + getTid()
				+ ", getDate()=" + getDate() + ", getContent()=" + getContent()
				+ ", getLng()=" + getLng() + ", getLat()=" + getLat()
				+ ", getDistance()=" + getDistance() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	public Team() {
		super();
	}	
	
}
