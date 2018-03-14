package com.pro.kkst.imp;

import java.util.List;

import com.pro.kkst.dtos.Admin_OnwerDto;
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
	public boolean restChk(int seq, Double x, Double y);
	public List<Admin_OnwerDto> a_o_list(String[] seqs);
	public boolean restDel(String[] seq);
	public Admin_OnwerDto sendEmail(int seq);
	
}
