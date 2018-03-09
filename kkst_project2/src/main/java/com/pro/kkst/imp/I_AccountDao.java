package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;

public interface I_AccountDao {

	public List<LoginDto> userList();
	public List<LoginDto> id_return(Map<String, String> map);
	public List<LoginDto> pw_return(Map<String, String> map);
	public LoginDto selectLogin(Map<String, String> map);
	public int insertRegist(LoginDto dto);
	public int selectSearchSeq(Map<String,String> map);
	public int selectGetAttrCount();
	public int insertRegist_taste(Map<String,String> map);
	public Admin_OnwerDto getOnwerLogin(Map<String, String> map);
}
