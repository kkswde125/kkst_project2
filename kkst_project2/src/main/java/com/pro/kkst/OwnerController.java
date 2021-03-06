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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.MenuzDto;
import com.pro.kkst.dtos.PhotoDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ResReviewDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_AccountService;
import com.pro.kkst.imp.I_OwnerService;
import com.pro.kkst.imp.I_UserService;
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
	
	@Autowired
	private I_UserService userServ;
	
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
		 List<AttrJoinDto> tast1=ownerServ.TastStar1();
		 List<AttrJoinDto> tast2=ownerServ.TastStar2();
		 List<AttrJoinDto> tast3=ownerServ.TastStar3();
		 List<AttrJoinDto> tast4=ownerServ.TastStar4();
		 List<AttrJoinDto> tast5=ownerServ.TastStar5();
		  model.addAttribute("tast1",tast1);
		  model.addAttribute("tast2",tast2);
		  model.addAttribute("tast3",tast3);
		  model.addAttribute("tast4",tast4);
		  model.addAttribute("tast5",tast5);
		 
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
	
	
	
	//오너 탈퇴 페이지
	@RequestMapping(value = "ow_ownerDelpage.do")
	public String ow_ownerDelpage(Locale locale, Model model) {
	 return"OwnerDelpage";
	}
	
	
	
	//오너 탈퇴_after
	@RequestMapping(value = "ow_ownerDel.do")
	public String ow_ownerDel(Locale locale, Model model,String res_seq) {
		
		boolean isS=false;
		
		
		
			isS=ownerServ.delOnwer(res_seq);
			System.out.println(isS);
			
		
		
		if(isS=true) {
			return "ac_ownerlogin";
		}else {
			return "ow_ownerDelpage.do";
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
		
		
		List<PhotoDto> pDto = ownerServ.ResPhotoList(res_seq);
		List<menuDto> mDto = ownerServ.ResMenuList(res_seq);
		
		model.addAttribute("pDto", pDto);
		model.addAttribute("mDto", mDto);
		model.addAttribute("lists2", lists2);
		model.addAttribute("lists3", lists3);
		model.addAttribute("lists4", lists4);
		model.addAttribute("lists5", lists5);
		
		
		
	 return"ow_ResUpdatePage";
	}
	
	//내 식당 상세보기 페이지
		@RequestMapping(value = "ResInfoPage.do")
		public String ResMoreInsertPage(Locale locale, Model model,String res_seq) {
			List<AttrsDto> lists2=accountServ.ATTRS2();
			List<AttrsDto> lists3=accountServ.ATTRS3();
			List<AttrsDto> lists4=accountServ.ATTRS4();
			List<AttrsDto> lists5=accountServ.ATTRS5();
			
			List<PhotoDto> pDto = ownerServ.ResPhotoList(res_seq);
			List<menuDto> mDto = ownerServ.ResMenuList(res_seq);
			
			model.addAttribute("pDto", pDto);
			model.addAttribute("mDto", mDto);
			
			System.out.println(mDto);
			model.addAttribute("lists2", lists2);
			model.addAttribute("lists3", lists3);
			model.addAttribute("lists4", lists4);
			model.addAttribute("lists5", lists5);
			
			
			return"ow_ResInfo";
		}
		
	
	//식당 수정 affter
	@RequestMapping(value = "ResUpdate.do")
	public String ResUpdate(Model model, MultipartHttpServletRequest request, String res_seq, String name,
			String cate, String addr, String S_hour, String S_min, String E_hour, String E_min, String Rs_hour,
			String Rs_min, String Re_hour, String Re_min, String call, String parking, String[] menu_name,
			String[] cateCode, String[] cookCode, String[] spicyCode, String[] tempCode, String[] price,
			String comment,String[] menu_name_d, String[] cateCode_d,
			String[] cookCode_d, String[] spicyCode_d, String[] tempCode_d, String[] price_d,String [] menu_seq,String [] Photo_seq,String[] fileOname,String[] fileSname) {
		
		boolean isS=false;
		
		
		isS=ownerServ.updateResInfo(model, res_seq, name, cate, addr, S_hour, S_min, E_hour, E_min, Rs_hour, Rs_min, Re_hour, Re_min, call, parking, comment);
		
		if(isS=true) {
			
			if(menu_name!=null&&cateCode!=null&&cookCode!=null&&spicyCode!=null&& tempCode!=null&& price!=null&&cate!=null) {
				isS=ownerServ.insertMenu(request, menu_name, cateCode, cookCode, spicyCode, tempCode, price, model, res_seq,cate);
			}
			
			isS=ownerServ.updateMenu(request, menu_name_d, cateCode_d, cookCode_d, spicyCode_d, tempCode_d, price_d, model, res_seq, cate,menu_seq,Photo_seq,fileOname,fileSname);
		
			if(isS=true) {
				return"ow_owner";
			}else {
				return"ResUpdatePage.do?res_seq="+res_seq;
			}

		}else {
			return"ResUpdatePage.do?res_seq="+res_seq;
		}
		
		
		
		
	}
	
	//메뉴삭제
	@RequestMapping(value = "deleteMenu.do")
	public @ResponseBody Map<String,Boolean> deleteMenu(Locale locale, Model model,@RequestParam String seq) {
	 
	    boolean isS=ownerServ.delMenu(seq);
	    
	    Map<String, Boolean>map = new HashMap<String,Boolean>();
	    map.put("isS", isS);
	    return map;
	}
	
	
	
	//리뷰
	
	@Transactional
	@RequestMapping(value = "ow_Res_Review.do")
	public String us_Res_Detail(Model model, HttpSession session, String name, String cate, String mName, String seq, String start, String end) {
		logger.info("ow_res_detail");
				
			ResDto dto = userServ.getResDetail(name);
			model.addAttribute("dto", dto);
			String res_Seq = String.valueOf(dto.getSeq());
			double avgStar = userServ.getAvgStar(res_Seq);
			model.addAttribute("avgStar", String.valueOf(avgStar));
			
			if (start==null||end==null||res_Seq==null) {
				start= (String)session.getAttribute("start");
				end= (String)session.getAttribute("end");
				res_Seq= (String)session.getAttribute("res_Seq");
			}else {
				session.setAttribute("start", start);
				session.setAttribute("end", end);
				session.setAttribute("res_Seq", res_Seq);
			}
			
			String count = String.valueOf(userServ.selectGetResReviewCount(res_Seq));
			model.addAttribute("count", count);
			
			String resPhoto =userServ.getResPhoto(res_Seq);
			model.addAttribute("resPhoto", resPhoto);
			List<MenuzDto> menuList = userServ.getResMenuPhoto(res_Seq);
			model.addAttribute("menuList", menuList);
			List<ResReviewDto> list = userServ.selectGetResReview(res_Seq, start, end);
			model.addAttribute("list", list);
			List<ResReviewDto> list2 = userServ.getResBestLikeyReview(res_Seq);
			model.addAttribute("list2", list2);
			return "ow_myResReview";
	}

	
	

	
	
	
}
	
	
