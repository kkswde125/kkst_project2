package com.pro.kkst.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.menuDto;
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
	
	@Transactional
	@Override
	public boolean onwerregist(Map<String,String> map) {
		
		int count=0;
		count=sqlSessoin.insert(namespace+"ResListDefault");
		
		String res_seq = sqlSessoin.selectOne(namespace+"DefaultResList");
		
		map.put("res_seq", res_seq);
		
		if(count==1) {
			count=sqlSessoin.insert(namespace+"onewrRegist",map);
		}
		
		return count>0?true:false;
		 
	}
	@Override
	public List<Admin_OnwerDto> id_return_ow(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"id_Retrun_ow",map);
	}
	@Override
	public List<Admin_OnwerDto> pw_return_ow(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"pw_Retrun_ow",map);
	}
	@Override
	public List<AttrsDto> ATTRS2() {
		return sqlSessoin.selectList(namespace+"attrs2");
	}
	@Override
	public List<AttrsDto> ATTRS3() {
		return sqlSessoin.selectList(namespace+"attrs3");
	}
	@Override
	public List<AttrsDto> ATTRS4() {
		return sqlSessoin.selectList(namespace+"attrs4");
	}
	@Override
	public List<AttrsDto> ATTRS5() {
		return sqlSessoin.selectList(namespace+"attrs5");
	}
	@Override
	public boolean addRes(Map<String, String> map) {
		
		int count=sqlSessoin.update(namespace+"ResAdd",map);
		
		return count>0?true:false;
	}
	@Override
	public boolean addMenu(Map<String, String> map) {
		
		int count = sqlSessoin.insert(namespace+"AddMenu",map);
		
		return count>0?true:false;
	}
	@Override
	public boolean addPhoto(Map<String, String> map) {
		int count = sqlSessoin.insert(namespace+"AddImg",map);
		return count>0?true:false;
	}
	@Override
	public String searchMenuSeq(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"SearchMenuSeq",map);
	}
	@Override
	public boolean addPhoto2(Map<String, String> map) {
		int count = sqlSessoin.insert(namespace+"AddImg2",map);
		return count>0?true:false;
	}
	@Override
	public ResDto chkRes(int seq) {
		return sqlSessoin.selectOne(namespace+"ChkRes",seq);
	}
	@Override
	public int IdChk_user(String id) {
		return sqlSessoin.selectOne(namespace+"isChk_user",id);
	}
	@Override
	public int IdChk_Onwer(String id) {
		return sqlSessoin.selectOne(namespace+"idChk_owner",id);
	}

}
