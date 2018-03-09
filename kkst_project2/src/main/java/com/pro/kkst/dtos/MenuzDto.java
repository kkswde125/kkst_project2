package com.pro.kkst.dtos;

public class MenuzDto {

	private String code;
	private String name;
	private double starz;
	public MenuzDto(String code, String name, double starz) {
		super();
		this.code = code;
		this.name = name;
		this.starz = starz;
	}
	public MenuzDto() {
		super();
		// TODO Auto-generated constructor stub
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
