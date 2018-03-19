package com.pro.kkst.dtos;

public class AddrDto {
	
	private int seq;
	private String si;
	private String gu;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	@Override
	public String toString() {
		return "AddrDto [seq=" + seq + ", si=" + si + ", gu=" + gu + "]";
	}
	public AddrDto(int seq, String si, String gu) {
		super();
		this.seq = seq;
		this.si = si;
		this.gu = gu;
	}
	
	public AddrDto() {
	}

}
