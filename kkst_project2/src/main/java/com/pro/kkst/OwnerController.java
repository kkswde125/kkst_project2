package com.pro.kkst;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_AccountService;
import com.pro.kkst.imp.I_OwnerService;
import com.pro.kkst.utils.ac_Utils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class OwnerController {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(OwnerController.class);
	
	@Autowired
	private I_OwnerService ownerServ;
	
	@Autowired
	private I_AccountService accountServ;
	
	ac_Utils ac_util = new ac_Utils();
	
	
	//개발 메뉴 추천 --> 진행중
	@RequestMapping(value = "devMenu.do")
	public String devMenu(Locale locale, Model model,String seq) {
		
		 List<AttrJoinDto> menuAttr1 = ownerServ.menuAttr1();
		 List<AttrJoinDto> menuAttr2 = ownerServ.menuAttr2();
		 List<AttrJoinDto> menuAttr3 = ownerServ.menuAttr3();
		 List<AttrJoinDto> menuAttr4 = ownerServ.menuAttr4();
		
		 ResDto rDto=accountServ.chkRes(Integer.parseInt(seq));
		 
		 String cate = rDto.getCate();
	
		 String ResultCode=ac_util.Resultcode(cate, menuAttr1.get(0).getCode(),menuAttr2.get(0).getCode(), menuAttr3.get(0).getCode(), menuAttr4.get(0).getCode());
		
		 System.out.println(ResultCode);
		 
		 List<menuDto> mDto=ownerServ.menuSearch(ResultCode);
		 
		 System.out.println(mDto);
		 
		if(mDto.size()==0) {
		 String msg="저희가 제공하는 메뉴에 포함되지 않은 메뉴입니다. 아래의 특성을 이용하여 새로운 요리를 개발해보세요!";
		  model.addAttribute("msg",msg);
		  model.addAttribute("Attr1", menuAttr1);
		  model.addAttribute("Attr2", menuAttr2);
		  model.addAttribute("Attr3", menuAttr3);
		  model.addAttribute("Attr4", menuAttr4);
		  return "ow_devMenu";
		}else {
			  model.addAttribute("Attr1", menuAttr1);
			  model.addAttribute("Attr2", menuAttr2);
			  model.addAttribute("Attr3", menuAttr3);
			  model.addAttribute("Attr4", menuAttr4);
			  model.addAttribute("mDto",mDto);
			return "ow_devMenu";
		}
		 
		 
	}
	
	//내 정보 페이지
	
	@RequestMapping(value = "InfoView.do")
	public String InfoView(Locale locale, Model model,String id,String seq,HttpSession session) {
		
	 return"ow_InfoView";
	}
	//내정보 수정 페이지
	@RequestMapping(value = "ownerMyInfopage.do")
	public String ownerMyInfopage(Locale locale, Model model,String id,String seq,HttpSession session) {
		
	 return"ow_MyInfo";
	}
	
	//내정보 수정
	@RequestMapping(value = "ownerMyInfo.do")
	public String ownerMyInfo(Locale locale, Model model,String seq,String id,String pw_chk,String phone,String email,HttpSession session) {
		
		Map<String, String> map = new HashMap<String,String>();
		
		map.put("seq", seq);
		map.put("pw", pw_chk);
		map.put("phone", phone);
		map.put("email", email);
	
		boolean isS= ownerServ.ownerMyInfo(map);
		
		if(isS) {
			System.out.println("수정 성공");
			
			Map<String, String> map2 = new HashMap<String,String>();
			map2.put("id", id);
			map2.put("pw", pw_chk);
			Admin_OnwerDto AoDto= accountServ.getOnwerLogin(map2);
			ResDto rDto = accountServ.chkRes(AoDto.getRes_seq());
			session.setAttribute("rDto", rDto);
			session.setAttribute("AoDto", AoDto);
			return "ow_owner";
		}else {
			System.out.println("수정 실패");
			return"redirect:ownerMyInfopage.do";
		}
		
		
	}
	
	//내 가게 관리 페이지
	@RequestMapping(value = "myRes.do")
	public String myRes(Locale locale, Model model) {
	 return"ow_myRes";
	}
	//내 식당 수정 페이지
	@RequestMapping(value = "ResUpdatePage.do")
	public String ResUpdatePage(Locale locale, Model model,String res_seq) {
		List<AttrsDto> lists2=accountServ.ATTRS2();
		List<AttrsDto> lists3=accountServ.ATTRS3();
		List<AttrsDto> lists4=accountServ.ATTRS4();
		List<AttrsDto> lists5=accountServ.ATTRS5();
		
		model.addAttribute("lists2", lists2);
		model.addAttribute("lists3", lists3);
		model.addAttribute("lists4", lists4);
		model.addAttribute("lists5", lists5);
		
		
		
		
	 return"ow_ResUpdatePage";
	}
	
	//내 식당 추가 페이지
	@RequestMapping(value = "ResMoreInsertPage.do")
	public String ResMoreInsertPage(Locale locale, Model model) {
	 return"ow_ResMoreInsertPage";
	}
	
}
	
	
