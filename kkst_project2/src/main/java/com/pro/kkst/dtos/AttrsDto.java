package com.pro.kkst.dtos;

public class AttrsDto {

	private String attr;
	private String code;
	private String type;
	private String menu;
	private double stars;
	
	
	public double getStars() {
		return stars;
	}
	public void setStars(double stars) {
		this.stars = stars;
	}
	public AttrsDto(String attr, String code, String type, String menu) {
		super();
		this.attr = attr;
		this.code = code;
		this.type = type;
		this.menu = menu;
	}
	@Override
	public String toString() {
		return "AttrsDto [attr=" + attr + ", code=" + code + ", type=" + type + ", menu=" + menu + "]";
	}
	public AttrsDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getAttr() {
		return attr;
	}
	public void setAttr(String attr) {
		this.attr = attr;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	
}
