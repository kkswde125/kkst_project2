package com.pro.kkst.dtos;

public class MenuzDto {

	private String seq;
	private String code;
	private String name;
	private double starz;
	public MenuzDto(String seq, String code, String name, double starz) {
		super();
		this.seq = seq;
		this.code = code;
		this.name = name;
		this.starz = starz;
	}
	public MenuzDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getStarz() {
		return starz;
	}
	public void setStarz(double starz) {
		this.starz = starz;
	}
	
	
}
