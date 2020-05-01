package com.ftf.beans;

public class Type {
	private int id;
	private String type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Type(int id, String type) {
		super();
		this.id = id;
		this.type = type;
	}
	public Type() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Type [id=" + id + ", type=" + type + "]";
	}
	
}
