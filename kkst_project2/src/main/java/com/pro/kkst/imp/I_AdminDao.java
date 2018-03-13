package com.pro.kkst.imp;

import java.util.List;

import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ReviewDto;


public interface I_AdminDao {
	
	public List<LoginDto> memberList();
	public List<ReviewDto> reviewAll();
	public ReviewDto reviewReport(int seq);
	public List<ResDto> restList(String snum, String cnum);
	public boolean memberDel(String[] seq);
	public int paging();
}
