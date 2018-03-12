package com.pro.kkst;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.imp.I_AccountService;
import com.pro.kkst.utils.Us_Utils;
import com.pro.kkst.utils.ac_MailUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AccountController {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private I_AccountService accountServ;
	
	
	ac_MailUtils utils=new ac_MailUtils();
	Us_Utils u_utils = new Us_Utils();

	
	//로그인 분기
	@RequestMapping(value = "/ac_beforeLogin.do")
	public String loginhome(Locale locale, Model model) {
		return "ac_beforeLogin";
	}
	
	//유저 로그인
	@RequestMapping(value = "/us_loginhome.do")
	public String us_loginhome(Locale locale, Model model) {
		return "ac_login";
	}
	
	//점주 로그인
	@RequestMapping(value = "/ow_loginhome.do")
	public String ow_loginhome(Locale locale, Model model) {
		return "ac_ownerlogin";
	}
	
	//점주 로그인_after
	@RequestMapping(value = "/ac_onwerLogin_after.do")
	public String onwerlogin_after(HttpSession session, String id, String pw) {
		logger.info("ac_onwerlogin_after");
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		Admin_OnwerDto AoDto= accountServ.getOnwerLogin(map);
		if(AoDto!=null){ //회원 정보가 존재한다면 -> 회원이 확인되면 
			session.setAttribute("AoDto", AoDto);
			session.setMaxInactiveInterval(60*600); 
			
			if(AoDto.getGrade().equals("A")) {
				return "redirect:ad_admin.do";
			}else {
				return "redirect:ow_owner.do";
			}
		}else {
			return "redirect:ow_loginhome.do";
			
		}
	}
	
	@RequestMapping(value = "/ad_admin.do")
	public String ownerlogin() {
		return "ad_admin";
	}
	
	
	
	//유저로그인 
	@RequestMapping(value = "/ac_login.do")
	public String login() {
		logger.info("ac_login");
		return "ac_login";
	}
	
	
	//유저로그인_after 
	@RequestMapping(value = "/ac_login_after.do")
	public String login_after(HttpSession session, String id, String pw) {
		logger.info("ac_login_after");
		LoginDto ldto= accountServ.getLogin(id, pw);
		if(ldto!=null){ //회원 정보가 존재한다면 -> 회원이 확인되면 
			session.setAttribute("ldto", ldto);
			session.setMaxInactiveInterval(60*600); 
			return "redirect:us_usermain.do";
		}else {
			return "redirect:ac_login.do";
		}
	}
	
	//로그아웃 
	@RequestMapping(value = "/ac_logout.do")
	public String logout(HttpSession session) {
		logger.info("ac_logout");
		session.removeAttribute("ldto");
		session.invalidate();
		return "redirect:ac_login.do";
	}
	
	
	//회원가입 분기
	@RequestMapping(value = "/ac_beforeRegist.do")
	public String beforeRegist() {
		return "ac_beforeRegist";
	}
	
	
	
	//회원가입 페이지 유저
	@RequestMapping(value = "/ac_registPage.do")
	public String registPage() {
		logger.info("ac_registPage");
		return "ac_regist";
	}
	
	//회원가입 페이지 점주
	@RequestMapping(value = "/ac_ownerRegistPage.do")
	public String ownerRegistPage() {
		return "ac_ownerRegist";
	}
	
	
	//회원가입 점주
	@RequestMapping(value = "/ac_onwerRegist_after.do")
	public String onwerRegist_after(Model model, String id, String pw, String name,String phone, String email) {
		logger.info("ac_regist_after");
//		boolean  (new Admin_OnwerDto(null,id, pw, name,null,phone,null,email));
		
		
		boolean isS = accountServ.onwerregist(new Admin_OnwerDto(0,id,pw,name,0,phone,null,null,email));
		
		if (isS) {
			if (isS) {
				logger.info("ac_onwerRegist_after: 성공");
				return "redirect:ow_loginhome.do";
			}else {
				logger.info("ac_onwerRegist_after: 회원가입은 성공했지만 taste00 insert는 실패");
				return "redirectow_loginhome.do";
			}
		}else {
			logger.info("regist자체 실패");
			return "redirect:ac_onwerRegist_after.do";
		}
	}
	
	
	//회원가입 유저
	@RequestMapping(value = "/ac_regist_after.do")
	public String regist_after(Model model, String id, String pw, String name, String nickName, String sex, String birth, String email) {
		logger.info("ac_regist_after");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		try {
			date = sdf.parse(birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		boolean isS=accountServ.regist(new LoginDto(id, pw, name, nickName, sex, date, email));
		
		
		if (isS) {
			isS=accountServ.regist_taste00(id);
			if (isS) {
				logger.info("ac_regist_after: 성공");
				return "redirect:ac_login.do";
			}else {
				logger.info("ac_regist_after: 회원가입은 성공했지만 taste00 insert는 실패");
				return "redirect:ac_login.do";
			}
		}else {
			logger.info("regist자체 실패");
			return "redirect:ac_registPage.do";
		}
	}
	
	//아이디 / 비밀번호 찾기 페이지
	@RequestMapping(value = "/ac_retrunAccPage.do")
	public String retrunAccPage(Locale locale, Model model) {
		return "ac_retrunAcc";
	}
	
	
	//아이디 찾기 유저
	@RequestMapping(value = "/ac_idRetrun.do",method = RequestMethod.POST)
	public String idRetrun(Locale locale, Model model,String name_id, String email_id,HttpServletRequest request,HttpServletResponse response) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name_id);
			map.put("email", email_id);
			List<LoginDto>lists=accountServ.id_return(map);
			utils.mail_acccount(lists.get(0).getId(),null,lists.get(0).getName(),lists.get(0).getEmail());
			
			String str ="";
			
			if(lists.size()!=0) {
			 str="아이디를 메일로 보내었습니다. 로그인페이지로 이동합니다";
			}
			if(lists.size()==0) {
			 str="실패. 로그인페이지로 이동합니다";
			}
			
			model.addAttribute("msg",str);
			
			System.out.println(str);
			
			return "ac_login";
	}
	
	
	//비밀번호 찾기 유저
	@RequestMapping(value = "/ac_pwRetrun.do",method = RequestMethod.POST)
	public String pwRetrun(Locale locale, Model model,String id_pw,String name_pw,String email_pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id_pw);
		map.put("name", name_pw);
		map.put("email", email_pw);
		List<LoginDto>lists=accountServ.pw_return(map);
		model.addAttribute("lists",lists);
		utils.mail_acccount(null,lists.get(0).getPw(),lists.get(0).getName(),lists.get(0).getEmail());
		return "ac_Mail";
	}
	
	
	
}
