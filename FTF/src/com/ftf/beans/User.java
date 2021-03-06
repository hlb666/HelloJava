package com.ftf.beans;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String pic;
	
	
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", email=" + email + ", pic=" + pic + "]";
	}
	public User() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User(String username, String password, String email) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
	}
	public User(int id,String username, String password, String email) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
	}
	public User(String username, String password, String email, String pic) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.pic = pic;
	}
	public User(int id, String username, String password, String email,
			String pic) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.pic = pic;
	}
}
