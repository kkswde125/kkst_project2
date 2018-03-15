package com.pro.kkst.dtos;

public class WatchaDto {

	private int seq;
	private String name;
	private String code;
	private int res_seq;
	private int price;
	private String change;
	public WatchaDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WatchaDto(int seq, String name, String code, int res_seq, int price, String change) {
		super();
		this.seq = seq;
		this.name = name;
		this.code = code;
		this.res_seq = res_seq;
		this.price = price;
		this.change = change;
	}
	
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
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
