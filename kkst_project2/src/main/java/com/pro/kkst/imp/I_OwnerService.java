package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.PhotoDto;
import com.pro.kkst.dtos.menuDto;

public interface I_OwnerService {

	public List<AttrJoinDto> menuAttr1();
	public List<AttrJoinDto> menuAttr2();
	public List<AttrJoinDto> menuAttr3();
	public List<AttrJoinDto> menuAttr4();
	public List<menuDto> menuSearch(String code);
	public boolean ownerMyInfo (Map<String, String> map);
	public List<PhotoDto> ResPhotoList(String res_seq);
	public List<menuDto> ResMenuList(String res_seq);
	public boolean delMenu(String seq);
	public boolean updateResInfo(Model model,String res_seq,String name,String cate,String addr,
			String S_hour,String S_min,String E_hour,String E_min,String Rs_hour,String Rs_min,String Re_hour,String Re_min,
			String call,String parking,String comment);

	public boolean insertMenu(MultipartHttpServletRequest request,String[] menu_name,String[] cateCode,String[] cookCode,String[] spicyCode,String[] tempCode,
			String[] price,Model model,String res_seq,String cate);

	public boolean updateMenu(MultipartHttpServletRequest request,String[] menu_name_d,String[] cateCode_d,String[] cookCode_d,String[] spicyCode_d,String[] tempCode_d,
			String[] price_d,Model model,String res_seq,String cate,String menu_seq[],String [] Photo_seq,String[] fileOname,String[] fileSname);
	
	public boolean delOnwer(String seq);
	public boolean delOnwer2(String seq);
}
