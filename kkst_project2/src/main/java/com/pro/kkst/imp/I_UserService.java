package com.pro.kkst.imp;

import java.util.List;
import java.util.Map;

import com.pro.kkst.dtos.MenuzDto;
import com.pro.kkst.dtos.TasteDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.WatchaDto;
import com.pro.kkst.dtos.menuDto;

public interface I_UserService {

	public List<menuDto> menuList();
	public List<menuDto> food(Map<String, int[]> map);
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
	
	
}
