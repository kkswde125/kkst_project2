package com.pro.kkst;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.imp.I_AccountService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AccountController {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private I_AccountService accountServ;
	
	@RequestMapping(value = "/ac_loginhome.do")
	public String loginhome(Locale locale, Model model) {
		return "ac_login";
	}
	
	//로그인 
	@RequestMapping(value = "/ac_login.do")
	public String login(Locale locale, Model model) {
		return "ac_login";
	}
	
	//회원가입 페이지
	@RequestMapping(value = "/ac_registPage.do")
	public String registPage(Locale locale, Model model) {
		return "ac_regist";
	}
	
	//아이디 / 비밀번호 찾기 페이지
	@RequestMapping(value = "/ac_retrunAccPage.do")
	public String retrunAccPage(Locale locale, Model model) {
		return "ac_retrunAcc";
	}
	
	@RequestMapping(value = "/ac_idRetrun.do",method = RequestMethod.POST)
	public String idRetrun(Locale locale, Model model,String name_id, String email_id) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name_id);
			map.put("email", email_id);
			List<LoginDto>lists=accountServ.id_return(map);
			
			System.out.println(lists);
			model.addAttribute("lists",lists);
			
			return "ac_Mail";
	}
	
	@RequestMapping(value = "/ac_pwRetrun.do",method = RequestMethod.POST)
	public String pwRetrun(Locale locale, Model model,String id_pw,String name_pw,String email_pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id_pw);
		map.put("name", name_pw);
		map.put("email", email_pw);
		List<LoginDto>lists=accountServ.pw_return(map);
		model.addAttribute("lists",lists);
		return "ac_Mail";
	}
	
	
	
}
