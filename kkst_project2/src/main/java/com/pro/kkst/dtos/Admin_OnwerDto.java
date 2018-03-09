package com.pro.kkst.dtos;

public class Admin_OnwerDto {

	private int seq;
	private String id;
	private String pw;
	private String name;
	private int res_seq;
	private String phone;
	private String res_call;
	private String grade;
	
	
	
	public Admin_OnwerDto() {
		super();
	}
	
	public Admin_OnwerDto(int seq, String id, String pw, String name, int res_seq, String phone, String res_call,
			String grade) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.res_seq = res_seq;
		this.phone = phone;
		this.res_call = res_call;
		this.grade = grade;
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
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRes_call() {
		return res_call;
	}
	public void setRes_call(String res_call) {
		this.res_call = res_call;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	@Override
	public String toString() {
		return "Admin_OnwerDto [seq=" + seq + ", id=" + id + ", pw=" + pw + ", name=" + name + ", res_seq=" + res_seq
				+ ", phone=" + phone + ", res_call=" + res_call + ", grade=" + grade + "]";
	}
	
	
	
}
