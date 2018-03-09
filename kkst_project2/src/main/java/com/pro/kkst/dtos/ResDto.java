package com.pro.kkst.dtos;

public class ResDto {
	private int seq;
	private String name;
	private String cate;
	private String addr;
	private String call;
	private String start;
	private String end;
	private String rest_start;
	private String rest_end;
	private String parking;
	private String open;
	private String chk;
	private String comment;
	private String x;
	private String y;
	
	
	
	public ResDto() {
		super();
	}
	
	
	public ResDto(int seq, String name, String cate, String addr, String call, String start, String end,
			String rest_start, String rest_end, String parking, String open, String chk, String comment, String x,
			String y) {
		super();
		this.seq = seq;
		this.name = name;
		this.cate = cate;
		this.addr = addr;
		this.call = call;
		this.start = start;
		this.end = end;
		this.rest_start = rest_start;
		this.rest_end = rest_end;
		this.parking = parking;
		this.open = open;
		this.chk = chk;
		this.comment = comment;
		this.x = x;
		this.y = y;
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
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getRest_start() {
		return rest_start;
	}
	public void setRest_start(String rest_start) {
		this.rest_start = rest_start;
	}
	public String getRest_end() {
		return rest_end;
	}
	public void setRest_end(String rest_end) {
		this.rest_end = rest_end;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getChk() {
		return chk;
	}
	public void setChk(String chk) {
		this.chk = chk;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	
	
	@Override
	public String toString() {
		return "ResDto [seq=" + seq + ", name=" + name + ", cate=" + cate + ", addr=" + addr + ", call=" + call
				+ ", start=" + start + ", end=" + end + ", rest_start=" + rest_start + ", rest_end=" + rest_end
				+ ", parking=" + parking + ", open=" + open + ", chk=" + chk + ", comment=" + comment + ", x=" + x
				+ ", y=" + y + "]";
	}
	
	
	
	
	
	
}
