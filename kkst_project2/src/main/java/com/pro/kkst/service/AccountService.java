package com.pro.kkst.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
