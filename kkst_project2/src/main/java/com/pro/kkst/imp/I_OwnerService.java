package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.menuDto;

public interface I_OwnerService {

	public List<AttrJoinDto> menuAttr1();
	public List<AttrJoinDto> menuAttr2();
	public List<AttrJoinDto> menuAttr3();
	public List<AttrJoinDto> menuAttr4();
	public menuDto menuSearch(String code);
	public boolean ownerMyInfo (Map<String, String> map);
}
