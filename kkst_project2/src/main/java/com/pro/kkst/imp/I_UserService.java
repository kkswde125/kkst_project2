package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.MenuzDto;
import com.pro.kkst.dtos.TasteDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ResReviewDto;
import com.pro.kkst.dtos.WatchaDto;
import com.pro.kkst.dtos.menuDto;

public interface I_UserService {

	public int menuList();
	public List<MenuzDto> food(Map<String, int[]> map);
	public List<MenuzDto> realFood(Map<String, int[]> map);
	public List<ResDto> ResList(String cate);
	public List<WatchaDto> watchaBox();
	public boolean setStars(int stars, int user_seq, String codes);
	public boolean hasZero(int user_seq);
	public List<WatchaDto> watchaMoreBox(int user_seq);
	public List<TasteDto> getMyTaste(int user_seq);
	public List<MenuzDto> recommendMenuList(int user_seq, String start, String end);
	public boolean hasTaste(int user_seq);
	public List<WatchaDto> watchaMoreMoreBox();
	public List<MenuzDto> getKeepList(String[] seqs);
	public ResDto getResDetail(String name);
	public boolean customizeTaste(int user_seq, String mName, String[] codes);
	public boolean customizeTaste(int user_seq, String mName);
	public boolean fileUploads(MultipartHttpServletRequest request);
	public List<ResDto> ResList2(String seq);
	public String getResPhoto(String res_Seq);
	public List<MenuzDto> getResMenuPhoto(String res_Seq);
	public int selectGetResReviewCount(String res_Seq);
	public List<ResReviewDto> selectGetResReview(String res_Seq, String start, String end);
	public int beforeInsertResReview(String user_seq, String res_Seq);
	public boolean insertResReview(ResReviewDto dto);
	public boolean insertAnsResReview(ResReviewDto dto);
	public boolean updateResReview(String seq, String content);
	public boolean delMyReview(String seq);
	public boolean addLikey(String likey, String id, String seq);
	public boolean addDislikey(String dislikey, String id, String review_seq);
	public boolean addReport(String report, String id, String review_seq);
	public List<ResReviewDto> getResBestLikeyReview(String res_Seq);
	public double getAvgStar(String res_Seq);
	public String[] getTypes();
	public List<AttrsDto> getMyTasteStarStats(String user_seq);
	public List<MenuzDto> bubbleMenuList(int user_seq);
	public LoginDto getMyInfo(String seq);
	public boolean updateMyInfo(String seq, String pw, String nickName, String email);
	public boolean deleteAccount(String seq);
}
