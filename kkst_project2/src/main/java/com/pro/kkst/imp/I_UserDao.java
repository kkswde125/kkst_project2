package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.MenuzDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ResReviewDto;
import com.pro.kkst.dtos.TasteDto;
import com.pro.kkst.dtos.WatchaDto;
import com.pro.kkst.dtos.menuDto;

public interface I_UserDao {
	public int menuList();
	public List<MenuzDto> food(Map<String, int[]> map);
	public List<MenuzDto> realFood(Map<String, int[]> map);
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
	public List<MenuzDto> selectStoredNames(Map<String, String[]> map); 
	public int selectHasTaste(Map<String,String> map);
	public int selectGetAllMenuCount(Map<String,String> map);
	public WatchaDto selectWatchaMoreMoreBox(Map<String,String> map);
	public List<MenuzDto> selectKeepList(Map<String, String[]> map);
	public ResDto selectResDetail(Map<String, String> map);
	public int updateCustomizeTastePlus(Map<String, String> map);
	public int updateCustomizeTasteMinus(Map<String, String> map);
	
	public boolean fileupload(Map<String, String> map);
	
	public List<ResDto> ResList2(String seq);
	public String getResPhoto(Map<String, String> map);
	public List<MenuzDto> getResMenuPhoto(Map<String, String> map);
	
	public int getResReviewCount(Map<String, String> map);
	public List<ResReviewDto> selectGetResReview(Map<String, String> map);
	public int beforeInsertResReview(Map<String, String> map); 
	public boolean insertResReview(ResReviewDto dto);
	public boolean insertAnsResReviewUpdate(Map<String, String> map);
	public boolean insertAnsResReviewInsert(ResReviewDto dto);
	public boolean updateResReview(Map<String, String> map);
	public boolean delMyReview(Map<String, String> map);
	public boolean addLikey0(Map<String, String> map);
	public boolean addLikey(Map<String, String> map);
	
	public boolean addDislikey0(Map<String, String> map);
	public boolean addDislikey(Map<String, String> map);
	
	public boolean addReport0(Map<String, String> map);
	public boolean addReport(Map<String, String> map);
	
	public List<ResReviewDto> getResBestLikeyReview(Map<String, String> map);
	public double getAvgStar(Map<String, String> map);
	public String[] getTypes();
	public List<AttrsDto> getMyTasteStarStats(Map<String, String> map);
	
}
