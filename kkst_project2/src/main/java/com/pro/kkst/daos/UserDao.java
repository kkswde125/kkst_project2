package com.pro.kkst.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.MenuzDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ResReviewDto;
import com.pro.kkst.dtos.TasteDto;
import com.pro.kkst.dtos.WatchaDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_UserDao;
@Repository
public class UserDao implements I_UserDao {
	@Autowired
	SqlSessionTemplate sqlSessoin;
	String namespace="com.pro.user.";
	
	@Override
	public int menuList() {
		return sqlSessoin.selectOne(namespace+"menulist");
	}

	@Override
	public List<MenuzDto> food(Map<String, int[]> map) {
		return sqlSessoin.selectList(namespace+"foodchosse",map);
	}
	
	@Override
	public List<ResDto> ResList(String cate) {
		return sqlSessoin.selectList(namespace+"ResList",cate) ;
	}

	@Override
	public String[] getCateCode() {
		return (String[])sqlSessoin.selectList(namespace+"getCateCode").toArray(new String[0]);
	}

	@Override
	public int getMenuCount(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"getMenuCount", map);
	}

	@Override
	public WatchaDto getWatchaBox(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"watchaBox", map);
	}

	@Override
	public int updateSetStars(Map<String, String> map) {
		return sqlSessoin.update(namespace+"setStars", map);
	}

	@Override
	public int selectHasZero(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"hasZero", map);
	}

	@Override
	public List<AttrsDto> selectGetZeros2(Map<String, String[]> map) {
		return sqlSessoin.selectList(namespace+"getZeros2", map);
	}

	@Override
	public int selectGetZeroMenuCount2(Map<String, String[]> map) {
		return sqlSessoin.selectOne(namespace+"getZeroMenuCount2", map);
	}

	@Override
	public WatchaDto selectGetZeroMenu(Map<String, String[]> map) {
		return sqlSessoin.selectOne(namespace+"getZeroMenu", map);
	}

	@Override
	public List<TasteDto> selectGetMyTaste(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"getMyTaste", map);
	}

	@Override
	public List<MenuzDto> selectRecommendMenuList(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"recommendMenuList", map);
	}

	@Override
	public int selectHasTaste(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"hasTaste", map);
	}

	@Override
	public int selectGetAllMenuCount(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"getAllMenuCount", map);
	}

	@Override
	public WatchaDto selectWatchaMoreMoreBox(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"watchaMoreMoreBox", map);
	}

	@Override
	public List<MenuzDto> selectKeepList(Map<String, String[]> map) {
		return sqlSessoin.selectList(namespace+"getKeepList", map);
	}

	@Override
	public ResDto selectResDetail(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"getResDetail", map);
	}

	@Override
	public List<ResDto> ResList2(String seq) {
		return sqlSessoin.selectList(namespace+"ResList2", seq);
	}

	@Override
	public int updateCustomizeTastePlus(Map<String, String> map) {
		return sqlSessoin.update(namespace+"customizeTastePlus", map);
	}

	@Override
	public int updateCustomizeTasteMinus(Map<String, String> map) {
		return sqlSessoin.update(namespace+"customizeTasteMinus", map);
	}

	@Override
	public boolean fileupload(Map<String, String> map) {
		int count=0;
		count=sqlSessoin.insert(namespace+"insertFile",map);
		return count>0?true:false;
	}

	@Override
	public List<MenuzDto> selectStoredNames(Map<String, String[]> map) {
		return sqlSessoin.selectList(namespace+"getStoredNames", map);
	}

	
	@Override
	public String getResPhoto(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"getResPhoto", map);
	}
	
	@Override
	public List<MenuzDto> getResMenuPhoto(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"getResMenuPhoto", map);
	}
	
	@Override
	public int getResReviewCount(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"getResReviewCount", map);
	}
	
	@Override
	public List<ResReviewDto> selectGetResReview(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"getResReview", map);
	}

	@Override
	public boolean insertResReview(ResReviewDto dto) {
		return sqlSessoin.insert(namespace+"insertResReview", dto)>0?true:false;
	}

	@Override
	public boolean insertAnsResReviewUpdate(Map<String, String> map) {
		return sqlSessoin.update(namespace+"insertAnsResReviewUpdate", map)>0?true:false;
	}

	@Override
	public boolean insertAnsResReviewInsert(ResReviewDto dto) {
		return sqlSessoin.insert(namespace+"insertAnsResReviewInsert", dto)>0?true:false;
	}
	
	@Override
	public boolean updateResReview(Map<String, String> map) {
		return sqlSessoin.update(namespace+"updateResReview", map)>0?true:false;
	}

	@Override
	public boolean delMyReview(Map<String, String> map) {
		return sqlSessoin.update(namespace+"delMyReview", map)>0?true:false;
	}

	@Override
	public int beforeInsertResReview(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"beforeInsertResReview", map);
	}

	@Override
	public boolean addLikey0(Map<String, String> map) {
		return sqlSessoin.update(namespace+"addLikey0", map)>0?true:false;
	}
	
	@Override
	public boolean addLikey(Map<String, String> map) {
		return sqlSessoin.update(namespace+"addLikey", map)>0?true:false;
	}

	@Override
	public boolean addDislikey0(Map<String, String> map) {
		return sqlSessoin.update(namespace+"addDislikey0", map)>0?true:false;
	}

	@Override
	public boolean addDislikey(Map<String, String> map) {
		return sqlSessoin.update(namespace+"addDislikey", map)>0?true:false;
	}

	@Override
	public boolean addReport0(Map<String, String> map) {
		return sqlSessoin.update(namespace+"addReport0", map)>0?true:false;
	}

	@Override
	public boolean addReport(Map<String, String> map) {
		return sqlSessoin.update(namespace+"addReport", map)>0?true:false;
	}

	@Override
	public List<ResReviewDto> getResBestLikeyReview(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"getResBestLikeyReview", map);
	}

	@Override
	public double getAvgStar(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"getAvgStar", map)==null?0.0:sqlSessoin.selectOne(namespace+"getAvgStar", map);//null처리하자
	}

	@Override
	public List<MenuzDto> realFood(Map<String, int[]> map) {
		return sqlSessoin.selectList(namespace+"realFood", map);
	}

	@Override
	public String[] getTypes() {
		return sqlSessoin.selectList(namespace+"getTypes").toArray(new String[0]);
	}

	@Override
	public List<AttrsDto> getMyTasteStarStats(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"getMyTasteStarStats", map);
	}
	
	@Override
	public List<MenuzDto> bubbleMenuList(Map<String, String> map) {
		return sqlSessoin.selectList(namespace+"bubbleMenuList", map);
	}

	@Override
	public LoginDto getMyInfo(Map<String, String> map) {
		return sqlSessoin.selectOne(namespace+"getMyInfo", map);
	}

	@Override
	public boolean updateMyInfo(Map<String, String> map) {
		return sqlSessoin.update(namespace+"updateMyInfo", map)>0?true:false;
	}

	@Override
	public boolean deleteAccount(Map<String, String> map) {
		return sqlSessoin.update(namespace+"deleteAccount", map)>0?true:false;
	}


}
