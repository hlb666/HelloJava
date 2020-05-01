package com.ftf.beans;

public class Search {
 private int id;
 private String searched;
 private int uid;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getSearched() {
	return searched;
}
public void setSearched(String searched) {
	this.searched = searched;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public Search(int id, String searched, int uid) {
	super();
	this.id = id;
	this.searched = searched;
	this.uid = uid;
}
public Search(String searched, int uid) {
	super();
	this.searched = searched;
	this.uid = uid;
}
public Search() {
	super();
}
@Override
public String toString() {
	return "search [id=" + id + ", searched=" + searched + ", uid=" + uid + "]";
}
 
}
