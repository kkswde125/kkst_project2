package com.pro.kkst.dtos;

import java.util.Date;

public class ReviewDto {
	
	private int seq;
	private int id;
	private String content;
	private int refer;
	private int star;
	private int depth;
	private int step;
	private int res_seq;
	private Date regdate;
	private String report;
	private String likey;
	private String dislikey;
	private String delflag;
	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRefer() {
		return refer;
	}

	public void setRefer(int refer) {
		this.refer = refer;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getRes_seq() {
		return res_seq;
	}

	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getLikey() {
		return likey;
	}

	public void setLikey(String likey) {
		this.likey = likey;
	}

	public String getDislikey() {
		return dislikey;
	}

	public void setDislikey(String dislikey) {
		this.dislikey = dislikey;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	public ReviewDto(int seq, int id, String content, int refer, int star, int depth, int step, int res_seq,
			Date regdate, String report, String likey, String dislikey, String delflag) {
		super();
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.refer = refer;
		this.star = star;
		this.depth = depth;
		this.step = step;
		this.res_seq = res_seq;
		this.regdate = regdate;
		this.report = report;
		this.likey = likey;
		this.dislikey = dislikey;
		this.delflag = delflag;
	}

	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", id=" + id + ", content=" + content + ", refer=" + refer + ", star=" + star
				+ ", depth=" + depth + ", step=" + step + ", res_seq=" + res_seq + ", regdate=" + regdate + ", report="
				+ report + ", likey=" + likey + ", dislikey=" + dislikey + ", delflag=" + delflag + "]";
	}
	
	

}
