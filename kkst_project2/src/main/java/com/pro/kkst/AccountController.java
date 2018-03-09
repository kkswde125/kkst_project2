package com.pro.kkst;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.imp.I_AccountService;
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
	
	@RequestMapping(value = "/ac_loginhome.do")
	public String loginhome(Locale locale, Model model) {
		return "ac_login";
	}
	
	//로그인 
	@RequestMapping(value = "/ac_login.do")
	public String login() {
		logger.info("ac_login");
		return "ac_login";
	}
	
	//로그인_after 
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
	
	//회원가입 페이지
	@RequestMapping(value = "/ac_registPage.do")
	public String registPage() {
		logger.info("ac_registPage");
		return "ac_regist";
	}
	
	//회원가입 페이지
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
	
	@RequestMapping(value = "/ac_idRetrun.do",method = RequestMethod.POST)
	public String idRetrun(Locale locale, Model model,String name_id, String email_id) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name_id);
			map.put("email", email_id);
			List<LoginDto>lists=accountServ.id_return(map);
			utils.mail_acccount(lists.get(0).getId(),null,lists.get(0).getName(),lists.get(0).getEmail());
			return "redirect:ac_login";
	}
	
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
