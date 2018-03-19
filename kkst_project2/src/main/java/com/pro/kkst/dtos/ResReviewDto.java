package com.pro.kkst.dtos;

import java.util.Date;

public class ResReviewDto {
	
	private String seq;
	private String id;//user_seq
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
	private String report_Count;
	private String likey_Count;
	private String dislikey_Count;
	
	public String getReport_Count() {
		return report_Count;
	}
	public void setReport_Count(String report_Count) {
		this.report_Count = report_Count;
	}
	public String getLikey_Count() {
		return likey_Count;
	}
	public void setLikey_Count(String likey_Count) {
		this.likey_Count = likey_Count;
	}
	public String getDislikey_Count() {
		return dislikey_Count;
	}
	public void setDislikey_Count(String dislikey_Count) {
		this.dislikey_Count = dislikey_Count;
	}
	public ResReviewDto(String seq, String id, String content, String refer, double star, String depth, String step,
			String res_Seq, Date regDate, String report, String likey, String dislikey, String delFlag,
			String report_Count, String likey_Count, String dislikey_Count) {
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
		this.report_Count = report_Count;
		this.likey_Count = likey_Count;
		this.dislikey_Count = dislikey_Count;
	}
	public ResReviewDto(String seq, String id, String content, String res_Seq, String delFlag) {
		super();
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.res_Seq = res_Seq;
		this.delFlag = delFlag;
	}
	public ResReviewDto(String id, String content, String star, String res_Seq) {
		super();
		this.id = id;
		this.content = content;
		this.star = (double)Integer.parseInt(star);
		this.res_Seq = res_Seq;
	}
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
