package com.pro.kkst.imp;

import java.util.List;

import com.pro.kkst.dtos.AddrDto;
import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ReviewDto;


public interface I_AdminDao {
	
	public List<LoginDto> memberList(String snum, String cnum);
	public List<ReviewDto> reviewAll(String area);
	public ReviewDto reviewReport(int seq);
	public List<ResDto> restList(String snum, String cnum);
	public boolean memberDel(String[] seq);
	public int RestPaging();
	public int MemPaging();
	public boolean restChk(int seq, Double x, Double y);
	public boolean restDel(String[] seq);
	public Admin_OnwerDto sendEmail(int seq);
	public Admin_OnwerDto send_Email(String email, String seq);
//	public List<ResDto> 
	public List<AddrDto> addressList();
}
