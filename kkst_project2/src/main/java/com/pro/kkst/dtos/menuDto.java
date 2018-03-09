package com.pro.kkst.dtos;

public class menuDto {

	private int seq;
	private String name;
	private String code;
	private String res_seq;
	private int price;
	
	
	
	
	public menuDto() {
		super();
	}

	public menuDto(int seq, String name, String code, String res_seq, int price) {
		super();
		this.seq = seq;
		this.name = name;
		this.code = code;
		this.res_seq = res_seq;
		this.price = price;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(String res_seq) {
		this.res_seq = res_seq;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "menuDto [seq=" + seq + ", name=" + name + ", code=" + code + ", res_seq=" + res_seq + ", price=" + price
				+ "]";
	}
	
	
	
}
