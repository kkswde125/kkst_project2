package com.pro.kkst.dtos;

import java.util.Date;

public class LoginDto {
//SEQ, ID, PW, NAME, NICKNAME, REGDATE, DELFLAG, SEX, BIRTH, EMAIL
	private int seq;
	private String id;
	private String pw; 
	private String name;
	private String nickName;
	private Date regDate;
	private String delFlag;
	private String sex;
	private Date birth;
	private String email;
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LoginDto(String id, String pw, String name, String nickName, String sex, Date birth, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.sex = sex;
		this.birth = birth;
		this.email = email;
	}

	public LoginDto(int seq, String id, String pw, String name, String nickName, Date regDate, String delFlag,
			String sex, Date birth, String email) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.regDate = regDate;
		this.delFlag = delFlag;
		this.sex = sex;
		this.birth = birth;
		this.email = email;
	}
	@Override
	public String toString() {
		return "LoginDto [seq=" + seq + ", id=" + id + ", pw=" + pw + ", name=" + name + ", nickName=" + nickName
				+ ", regDate=" + regDate + ", delFlag=" + delFlag + ", sex=" + sex + ", birth=" + birth + ", email="
				+ email + "]";
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
