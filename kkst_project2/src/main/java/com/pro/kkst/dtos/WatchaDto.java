package com.pro.kkst.dtos;

public class WatchaDto {

	private int seq;
	private String name;
	private String code;
	private int res_seq;
	private int price;
	public WatchaDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WatchaDto(int seq, String name, String code, int res_seq, int price) {
		super();
		this.seq = seq;
		this.name = name;
		this.code = code;
		this.res_seq = res_seq;
		this.price = price;
	}
	@Override
	public String toString() {
		return "WatchaDto [seq=" + seq + ", name=" + name + ", code=" + code + ", res_seq=" + res_seq + ", price="
				+ price + "]";
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
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
