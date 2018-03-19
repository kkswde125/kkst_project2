package com.pro.kkst.dtos;

public class AttrJoinDto {
	
	private int rk;
	private String attr;
	private String code;
	private int stars;
	
	
	
	
	




	public AttrJoinDto() {
		super();
	}




	public AttrJoinDto(int rk, String attr, String code, int stars) {
		super();
		this.rk = rk;
		this.attr = attr;
		this.code = code;
		this.stars = stars;
	}




	public int getRk() {
		return rk;
	}





	public void setRk(int rk) {
		this.rk = rk;
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





	public int getStars() {
		return stars;
	}





	public void setStars(int stars) {
		this.stars = stars;
	}





	@Override
	public String toString() {
		return "AttrJoinDto [rk=" + rk + ", attr=" + attr + ", code=" + code + ", stars=" + stars + "]";
	}
	
	
	

}
