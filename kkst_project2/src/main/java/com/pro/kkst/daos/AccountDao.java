package com.pro.kkst.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.kkst.dtos.Admin_OnwerDto;
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
	@Override
	public LoginDto selectLogin(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"login", map);
	}
	@Override
	public int insertRegist(LoginDto dto) {
		return sqlSessoin.insert(namespace+"regist", dto);
	}
	
	@Override
	public int selectSearchSeq(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"searchSeq", map);
	}

	@Override
	public int selectGetAttrCount() {
		return sqlSessoin.selectOne(namespace+"getAttrCount");
	}

	@Override
	public int insertRegist_taste(Map<String, String> map) {
		return sqlSessoin.insert(namespace+"regist_taste", map);
	}
	@Override
	public Admin_OnwerDto getOnwerLogin(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"onwerLogin",map);
	}
	@Override
	public boolean onwerregist(Admin_OnwerDto aoDto) {
		
		int count=sqlSessoin.insert(namespace+"onewrRegist",aoDto);
		
		return count>0?true:false;
		 
	}

}
