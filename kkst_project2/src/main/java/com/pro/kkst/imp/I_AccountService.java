package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;


import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;

public interface I_AccountService {
	//유저
	public List<LoginDto> userList();
	public List<LoginDto> id_return(Map<String, String> map);
	public List<LoginDto> pw_return(Map<String, String> map);
	public LoginDto getLogin(String id, String pw);
	public boolean regist(LoginDto dto);
	public boolean regist_taste00(String id);
	public int IdChk_user(String id);
	
	//점주
	public Admin_OnwerDto getOnwerLogin(Map<String, String> map);
	public boolean onwerregist(Map<String,String> map);
	public List<Admin_OnwerDto> id_return_ow(Map<String, String> map);
	public List<Admin_OnwerDto> pw_return_ow(Map<String, String> map);
	public List<AttrsDto> ATTRS2();
	public List<AttrsDto> ATTRS3();
	public List<AttrsDto> ATTRS4();
	public List<AttrsDto> ATTRS5();
	public boolean addAllRes(MultipartHttpServletRequest request,String res_seq,String name,String cate,String addr,
			String S_hour,String S_min,String E_hour,String E_min,String Rs_hour,String Rs_min,String Re_hour,String Re_min,
			String call,String parking,String[] menu_name,String[] cateCode,String[] cookCode,String[] spicyCode,String[] tempCode,
			String[] price,String comment);
	
	public ResDto chkRes(int seq);
	public int IdChk_Onwer(String id);
}
