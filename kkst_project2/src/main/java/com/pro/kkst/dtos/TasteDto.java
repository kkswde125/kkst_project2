package com.pro.kkst.dtos;

public class TasteDto {

	private String attr;
	private String type;
	private double star;
	public String getAttr() {
		return attr;
	}
	public void setAttr(String attr) {
		this.attr = attr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public TasteDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TasteDto(String attr, String type, double star) {
		super();
		this.attr = attr;
		this.type = type;
		this.star = star;
	}
	@Override
	public String toString() {
		return "TasteDto [attr=" + attr + ", type=" + type + ", star=" + star + "]";
	}
	
}
