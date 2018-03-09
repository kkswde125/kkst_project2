package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;

public interface I_AccountService {

	public List<LoginDto> userList();
	public List<LoginDto> id_return(Map<String, String> map);
	public List<LoginDto> pw_return(Map<String, String> map);
	public LoginDto getLogin(String id, String pw);
	public boolean regist(LoginDto dto);
	public boolean regist_taste00(String id);
	public Admin_OnwerDto getOnwerLogin(Map<String, String> map);
	
}
