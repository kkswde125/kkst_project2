package com.pro.kkst.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.imp.I_AccountDao;
import com.pro.kkst.imp.I_AccountService;

@Service
public class AccountService implements I_AccountService {
	@Autowired
	private I_AccountDao accountDao;

	@Override
	public List<LoginDto> userList() {
		return null;
	}

	@Override
	public List<LoginDto> id_return(Map<String, String> map) {
		return accountDao.id_return(map);
	}

	@Override
	public List<LoginDto> pw_return(Map<String, String> map) {
		return accountDao.pw_return(map);
	}

	@Override
	public LoginDto getLogin(String id, String pw) {
		LoginDto dto = new LoginDto();
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		dto=accountDao.selectLogin(map);
		return dto;
	}

	@Override
	public boolean regist(LoginDto dto) {
		int count=0;
		count=accountDao.insertRegist(dto);
		return count>0?true:false;
	}

	@Transactional
	@Override
	public boolean regist_taste00(String id) {
		int count=0;
		int attrCount=0;
		int seq=0;
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		seq=accountDao.selectSearchSeq(map);
		map.put("user_seq", seq+"");
		attrCount=accountDao.selectGetAttrCount();
		for (int i = 0; i < attrCount; i++) {
			map.put("index", i+1+"");
			count=accountDao.insertRegist_taste(map);
		}
		return count>0?true:false;
	}

	@Override
	public Admin_OnwerDto getOnwerLogin(Map<String, String> map) {
		return accountDao.getOnwerLogin(map);
	}

	@Override
	public boolean onwerregist(Map<String,String> map) {
		
		 return accountDao.onwerregist(map);
	}

	@Override
	public List<Admin_OnwerDto> id_return_ow(Map<String, String> map) {
		return accountDao.id_return_ow(map);
	}

	@Override
	public List<Admin_OnwerDto> pw_return_ow(Map<String, String> map) {
		return accountDao.pw_return_ow(map);
	}

	@Override
	public List<AttrsDto> ATTRS2() {
		return accountDao.ATTRS2();
	}

	@Override
	public List<AttrsDto> ATTRS3() {
		return accountDao.ATTRS3();
	}

	@Override
	public List<AttrsDto> ATTRS4() {
		return accountDao.ATTRS4();
	}

	@Override
	public List<AttrsDto> ATTRS5() {
		return accountDao.ATTRS5();
	}

	@Override
	public boolean addRes(Map<String, String> map) {
		return false;
	}


}
