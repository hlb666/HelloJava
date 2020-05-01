package com.ftf.beans;

public class InvolueTeam {
	
	private int id;
	private String name;
	private String sex;
	private String age ;
	private String email;
	private int sid;
	private int uid;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public InvolueTeam(String name, String sex, String age, String email,
			int sid, int uid) {
		super();
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.email = email;
		this.sid = sid;
		this.uid = uid;
	}
	public InvolueTeam(int id, String name, String sex, String age,
			String email, int sid, int uid) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.email = email;
		this.sid = sid;
		this.uid = uid;
	}
	public InvolueTeam() {
		super();
	}
	@Override
	public String toString() {
		return "InvolueTeam [id=" + id + ", name=" + name + ", sex=" + sex
				+ ", age=" + age + ", Email=" + email + ", sid=" + sid
				+ ", uid=" + uid + "]";
	}
	
}
