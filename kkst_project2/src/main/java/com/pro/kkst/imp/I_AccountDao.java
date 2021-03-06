package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.menuDto;

public interface I_AccountDao {

	//유저
	public List<LoginDto> userList();
	public List<LoginDto> id_return(Map<String, String> map);
	public List<LoginDto> pw_return(Map<String, String> map);
	public LoginDto selectLogin(Map<String, String> map);
	public int insertRegist(LoginDto dto);
	public int selectSearchSeq(Map<String,String> map);
	public int selectGetAttrCount();
	public int insertRegist_taste(Map<String,String> map);
	
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
	public boolean addRes(Map<String, String>map);
	public boolean addMenu(Map<String, String>map);
	public boolean addPhoto(Map<String, String>map);
	public String searchMenuSeq(Map<String, String>map);
	public boolean addPhoto2(Map<String, String>map);
	public ResDto chkRes(int seq);
	public int IdChk_Onwer(String id);
	
	
}
