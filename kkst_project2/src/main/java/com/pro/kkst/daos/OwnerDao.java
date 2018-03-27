package com.pro.kkst.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.PhotoDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_OwnerDao;

@Repository
public class OwnerDao implements I_OwnerDao {
	@Autowired
	SqlSessionTemplate sqlSessoin;
	String namespace="com.pro.owner.";
	
	@Override
	public List<AttrJoinDto> menuAttr1() {
		return sqlSessoin.selectList(namespace+"menuAttr1");
	}
	@Override
	public List<AttrJoinDto> menuAttr2() {
		return sqlSessoin.selectList(namespace+"menuAttr2");
	}
	@Override
	public List<AttrJoinDto> menuAttr3() {
		return sqlSessoin.selectList(namespace+"menuAttr3");
	}
	@Override
	public List<AttrJoinDto> menuAttr4() {
		return sqlSessoin.selectList(namespace+"menuAttr4");
	}
	@Override
	public List<menuDto> menuSearch(String code) {
		return sqlSessoin.selectList(namespace+"MenuSearch",code);
	}
	@Override
	public boolean ownerMyInfo(Map<String, String> map) {
		
		int count = sqlSessoin.update(namespace+"ownerMyInfo",map);
		
		return count>0? true:false ;
	}
	@Override
	public List<PhotoDto> ResPhotoList(String res_seq) {
		return sqlSessoin.selectList(namespace+"selectResPhoto",res_seq);
	}
	@Override
	public List<menuDto> ResMenuList(String res_seq) {
		return sqlSessoin.selectList(namespace+"selectResMenuDto",res_seq);
	}
	@Override
	public boolean delMenu(String seq) {
		
		int count=sqlSessoin.delete(namespace+"delMenu",seq);
		
		return count>0?true:false;
	}
	
	@Override
	public boolean delPhoto(String seq) {
		int count=sqlSessoin.delete(namespace+"delPhoto",seq);
		return count>0?true:false ;
	}	
	
//-------------------------------------------------------------------------
	@Override
	public boolean insertMenu(Map<String, String> map) {
		int count=sqlSessoin.insert(namespace+"insertMenu",map);
		
		return count>0?true:false;
	}
	@Override
	public boolean insertPhoto(Map<String, String> map) {
		int count=sqlSessoin.insert(namespace+"insertPhoto",map);
		return count>0?true:false;
	}

//---------------------------------------------------------------------------
	@Override
	public boolean updateResInfo(Map<String, String> map) {
		int count=sqlSessoin.update(namespace+"updateResInfo",map);
	 return	count>0?true:false;	
		}
	@Override
	public String SearchMenuSeq(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"SearchMenuSeq",map);
	}
	@Override
	public boolean updateMenu(Map<String, String> map) {
		int count=sqlSessoin.update(namespace+"updateMenu",map);
		return count>0?true:false;	
	}
	@Override
	public boolean updatePhoto(Map<String, String> map) {
		int count=sqlSessoin.update(namespace+"updatePhoto",map);
		return count>0?true:false;	
	}
	@Override
	public boolean updatePhoto2(Map<String, String> map) {
		int count=sqlSessoin.update(namespace+"updatePhoto2",map);
		return count>0?true:false;	
	}
	
	
//--------------------------------------------------------------------
	@Override
	public boolean delRes(String seq) {
		
		int count = sqlSessoin.delete(namespace+"delRes",seq);
		
		return count>0?true:false;
	}
	@Override
	public boolean delOnwer(String seq) {
		int count = sqlSessoin.delete(namespace+"delOwner",seq);
		return count>0?true:false;
	}
	@Override
	public boolean Menudel(String seq) {
		int count = sqlSessoin.delete(namespace+"MenuDel",seq);
		return count>0?true:false;
	}
	@Override
	public boolean Photodel(String seq) {
		int count = sqlSessoin.delete(namespace+"PhotoDel",seq);
		return count>0?true:false;
	}
	@Override
	public boolean Reviewdel(String seq) {
		int count = sqlSessoin.delete(namespace+"ReviewDel",seq);
		return count>0?true:false;
	}
	
	
}
