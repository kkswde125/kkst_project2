package com.pro.kkst.imp;

import java.util.List;

import com.pro.kkst.dtos.AddrDto;
import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.PhotoDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ResInfoDto;
import com.pro.kkst.dtos.Res_ReviewDto;
import com.pro.kkst.dtos.ReviewDto;
import com.pro.kkst.dtos.menuDto;


public interface I_AdminDao {
	
	public List<LoginDto> memberList(String snum, String cnum);
	public List<Res_ReviewDto> reviewAll(String area, int[] seqs);
	public List<Res_ReviewDto> reviewReport(String area, int[] seqs);
	public List<ResDto> restList(String snum, String cnum);
	public boolean reviewDel(String[] seq);
	public boolean memberDel(String[] seq);
	public boolean memberDelCancle(String[] seq);
	public int RestPaging();
	public int MemPaging();
	public boolean restChk(int seq, Double x, Double y);
	public boolean restDel(String[] seq);
	public Admin_OnwerDto sendEmail(int seq);
	public Admin_OnwerDto send_Email(String email, String seq);
	public List<AddrDto> addressList();
	public List<ResDto> areaResList(String area);
	public List<ResInfoDto> restList_detail(int res_seq);
	public PhotoDto restPhoto(int res_seq);
}
