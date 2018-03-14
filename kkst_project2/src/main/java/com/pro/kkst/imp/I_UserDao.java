package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.MenuzDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.TasteDto;
import com.pro.kkst.dtos.WatchaDto;
import com.pro.kkst.dtos.menuDto;

public interface I_UserDao {
	public List<menuDto> menuList();
	public List<menuDto> food(Map<String, int[]> map);
	public List<ResDto> ResList(String cate);
	public String[] getCateCode();
	public int getMenuCount(Map<String, String> map);
	public WatchaDto getWatchaBox(Map<String, String> map);
	public int updateSetStars(Map<String, String> map);
	public int selectHasZero(Map<String, String> map);
	public List<AttrsDto> selectGetZeros2(Map<String, String[]> map);
	public int selectGetZeroMenuCount2(Map<String, String[]> map);
	public WatchaDto selectGetZeroMenu(Map<String, String[]> map);
	public List<TasteDto> selectGetMyTaste(Map<String,String> map);
	public List<MenuzDto> selectRecommendMenuList(Map<String,String> map);
	public int selectHasTaste(Map<String,String> map);
	public int selectGetAllMenuCount(Map<String,String> map);
	public WatchaDto selectWatchaMoreMoreBox(Map<String,String> map);
	public List<MenuzDto> selectKeepList(Map<String, String[]> map);
	public ResDto selectResDetail(Map<String, String> map);
	public List<ResDto> ResList2(String seq);
	public int updateCustomizeTastePlus(Map<String, String> map);
	public int updateCustomizeTasteMinus(Map<String, String> map);
	
	public boolean fileupload(Map<String, String> map);
}
