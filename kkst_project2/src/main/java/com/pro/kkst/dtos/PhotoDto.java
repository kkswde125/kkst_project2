package com.pro.kkst.dtos;

public class PhotoDto {

	private int seq;
	private String origin;
	private String change;
	private int res_seq;
	private int menu_seq;
	
	
	
	
	public PhotoDto(int seq, String origin, String change, int res_seq, int menu_seq) {
		super();
		this.seq = seq;
		this.origin = origin;
		this.change = change;
		this.res_seq = res_seq;
		this.menu_seq = menu_seq;
	}
	
	
	




	public int getSeq() {
		return seq;
	}








	public void setSeq(int seq) {
		this.seq = seq;
	}








	public String getOrigin() {
		return origin;
	}








	public void setOrigin(String origin) {
		this.origin = origin;
	}








	public String getChange() {
		return change;
	}








	public void setChange(String change) {
		this.change = change;
	}








	public int getRes_seq() {
		return res_seq;
	}








	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}








	public int getMenu_seq() {
		return menu_seq;
	}








	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}








	@Override
	public String toString() {
		return "PhotoDto [seq=" + seq + ", origin=" + origin + ", change=" + change + ", res_seq=" + res_seq
				+ ", menu_seq=" + menu_seq + "]";
	}
	
}
