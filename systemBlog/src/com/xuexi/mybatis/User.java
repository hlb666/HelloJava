package com.xuexi.mybatis;

public class User {
	 private Integer id;
	 private String username;
	 private String password;
	 private String pic;
	 private Integer integral;
	 private Integer identify;
	 
	 
	 
	public Integer getIdentify() {
		return identify;
	}
	public void setIdentify(Integer identify) {
		this.identify = identify;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Integer getIntegral() {
		return integral;
	}
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}
	public User(Integer id, String username, String password, String pic,
			Integer integral) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.pic = pic;
		this.integral = integral;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	 
	 
	 
}
