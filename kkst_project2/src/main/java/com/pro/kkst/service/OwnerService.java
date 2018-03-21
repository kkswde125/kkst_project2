package com.pro.kkst.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.PhotoDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_AccountDao;
import com.pro.kkst.imp.I_OwnerDao;
import com.pro.kkst.imp.I_OwnerService;
import com.pro.kkst.utils.ac_Utils;

@Service
public class OwnerService implements I_OwnerService {
	@Autowired
	private I_OwnerDao ownerDao;
	
	@Autowired
	private I_AccountDao accountDao;
	
	ac_Utils ac_util = new ac_Utils();

	@Override
	public List<AttrJoinDto> menuAttr1() {
		return ownerDao.menuAttr1();
	}

	@Override
	public List<AttrJoinDto> menuAttr2() {
		return ownerDao.menuAttr2();
	}

	@Override
	public List<AttrJoinDto> menuAttr3() {
		return ownerDao.menuAttr3();
	}

	@Override
	public List<AttrJoinDto> menuAttr4() {
		return ownerDao.menuAttr4();
	}

	@Override
	public List<menuDto> menuSearch(String code) {
		return ownerDao.menuSearch(code);
	}

	@Override
	public boolean ownerMyInfo(Map<String, String> map) {
		return ownerDao.ownerMyInfo(map);
	}

	@Override
	public List<PhotoDto> ResPhotoList(String res_seq) {
		return ownerDao.ResPhotoList(res_seq);
	}

	@Override
	public List<menuDto> ResMenuList(String res_seq) {
		return ownerDao.ResMenuList(res_seq);
	}

	@Transactional
	@Override
	public boolean delMenu(String seq) {
	
		boolean isS = false;
		
		 isS=ownerDao.delPhoto(seq);
		 isS=ownerDao.delMenu(seq);

		return isS; 
	}

	@Transactional
	@Override
	public boolean updateResInfo(Model model, MultipartHttpServletRequest request, String res_seq, String name,
			String cate, String addr, String S_hour, String S_min, String E_hour, String E_min, String Rs_hour,
			String Rs_min, String Re_hour, String Re_min, String call, String parking, String[] menu_name,
			String[] cateCode, String[] cookCode, String[] spicyCode, String[] tempCode, String[] price,
			String comment) {
		
		boolean isS=false;
		
		String Sdate = ac_util.isTwo(S_hour)+":"+ac_util.isTwo(S_min);
		String Edate = ac_util.isTwo(E_hour)+":"+ac_util.isTwo(E_min);
		String RsDate = ac_util.isTwo(Rs_hour)+":"+ac_util.isTwo(Rs_min);
		String ReDate = ac_util.isTwo(Re_hour)+":"+ac_util.isTwo(Re_min);
		
		String code[]=new String[menu_name.length];

		for (int i = 0; i < menu_name.length; i++) {
			code[i]=ac_util.Resultcode(cate, cateCode[i], cookCode[i], spicyCode[i], tempCode[i]);
			System.out.println(i+":"+code[i]);
			
		}
		
		Map<String, String> resmap = new HashMap<String,String>();
		//식당 추가 부분	
		resmap.put("name",name);
		resmap.put("cate", cate);
		resmap.put("addr", addr);
		resmap.put("call",call);
		resmap.put("start", Sdate);
		resmap.put("end", Edate);
		resmap.put("rest_start", RsDate);
		resmap.put("rest_end", ReDate);
		resmap.put("parking", parking);
		resmap.put("comment",comment);
		resmap.put("seq", res_seq);	
		
		System.out.println(resmap);
		
		isS=accountDao.addRes(resmap);
		
		if(isS==true) {
			
		}
		
		
		
		
		return false;
	}


}
