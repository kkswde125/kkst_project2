package com.pro.kkst.imp;

import java.util.List;

import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ReviewDto;

public interface I_AdminService {

	public List<LoginDto> memberList();
	public List<ReviewDto> reviewList();
	public List<ResDto> restList();
	public boolean memberDel(String[] seq);
	
}
