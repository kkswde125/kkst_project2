package com.pro.kkst.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.imp.I_AccountDao;

@Repository
public class AccountDao implements I_AccountDao {
	
	@Autowired
	SqlSessionTemplate sqlSessoin;
	String namespace="com.pro.account.";
	
	@Override
	public List<LoginDto> userList() {
	return null;
	}
	@Override
	public List<LoginDto> id_return(Map<String, String> map) {
		List<LoginDto>lists=sqlSessoin.selectList(namespace+"id_Retrun",map);
		return lists;
	}
	@Override
	public List<LoginDto> pw_return(Map<String, String> map) {
		List<LoginDto>lists=sqlSessoin.selectList(namespace+"pw_Retrun",map);
		return lists;
	}

}
