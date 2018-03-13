package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;

public interface I_AccountService {
	//유저
	public List<LoginDto> userList();
	public List<LoginDto> id_return(Map<String, String> map);
	public List<LoginDto> pw_return(Map<String, String> map);
	public LoginDto getLogin(String id, String pw);
	public boolean regist(LoginDto dto);
	public boolean regist_taste00(String id);
	
	//점주
	public Admin_OnwerDto getOnwerLogin(Map<String, String> map);
	public boolean onwerregist(Map<String,String> map);
	public List<Admin_OnwerDto> id_return_ow(Map<String, String> map);
	public List<Admin_OnwerDto> pw_return_ow(Map<String, String> map);
	public List<AttrsDto> ATTRS2();
	public List<AttrsDto> ATTRS3();
	public List<AttrsDto> ATTRS4();
	public List<AttrsDto> ATTRS5();
	public boolean addRes(Map<String, String>map);
}
