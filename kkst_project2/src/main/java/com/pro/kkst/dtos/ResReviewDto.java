package com.pro.kkst.dtos;

import java.util.Date;

public class ResReviewDto {
	
	private String seq;
	private String id;
	private String content;
	private String refer;
	private double star;
	private String depth;
	private String step;
	private String res_Seq;
	private Date regDate;
	private String report;
	private String likey;
	private String dislikey;
	private String delFlag;
	public ResReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResReviewDto(String seq, String id, String content, String refer, double star, String depth, String step,
			String res_Seq, Date regDate, String report, String likey, String dislikey, String delFlag) {
		super();
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.refer = refer;
		this.star = star;
		this.depth = depth;
		this.step = step;
		this.res_Seq = res_Seq;
		this.regDate = regDate;
		this.report = report;
		this.likey = likey;
		this.dislikey = dislikey;
		this.delFlag = delFlag;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRefer() {
		return refer;
	}
	public void setRefer(String refer) {
		this.refer = refer;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getRes_Seq() {
		return res_Seq;
	}
	public void setRes_Seq(String res_Seq) {
		this.res_Seq = res_Seq;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	
}
