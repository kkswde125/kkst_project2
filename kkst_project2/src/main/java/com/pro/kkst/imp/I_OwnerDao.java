package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.PhotoDto;
import com.pro.kkst.dtos.menuDto;

public interface I_OwnerDao {
	
	public List<AttrJoinDto> menuAttr1();
	public List<AttrJoinDto> menuAttr2();
	public List<AttrJoinDto> menuAttr3();
	public List<AttrJoinDto> menuAttr4();
	public List<menuDto> menuSearch(String code);
	public boolean ownerMyInfo (Map<String, String> map);
	public List<PhotoDto> ResPhotoList(String res_seq);
	public List<menuDto> ResMenuList(String res_seq);
	public boolean delMenu(String seq);
	public boolean delPhoto(String seq);
	public boolean insertMenu(Map<String, String> map);
	public boolean insertPhoto(Map<String, String> map);
	public boolean updateMenu(Map<String,String> map);
	public boolean updatePhoto(Map<String,String> map);
	public boolean updatePhoto2(Map<String,String> map);
	
	public boolean updateResInfo(Map<String,String> map);
	public String SearchMenuSeq(Map<String, String>map);
	

	public boolean delRes(String seq);
	public boolean delOnwer(String seq);
	public boolean Menudel(String seq);
	public boolean Photodel(String seq);
	public boolean Reviewdel(String seq);
	
	
	public List<AttrJoinDto> TastStar1();
	public List<AttrJoinDto> TastStar2();
	public List<AttrJoinDto> TastStar3();
	public List<AttrJoinDto> TastStar4();
	public List<AttrJoinDto> TastStar5();
	
}
