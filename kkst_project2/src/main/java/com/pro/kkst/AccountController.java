package com.pro.kkst;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_AccountService;
import com.pro.kkst.utils.Us_Utils;
import com.pro.kkst.utils.ac_MailUtils;
import com.pro.kkst.utils.ac_Utils;

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
	ac_Utils ac_utils=new ac_Utils();

	
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
	public String onwerlogin_after(Model model,HttpSession session, String id, String pw) {
		logger.info("ac_onwerlogin_after");
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		Admin_OnwerDto AoDto= accountServ.getOnwerLogin(map);
		ResDto rDto = accountServ.chkRes(AoDto.getRes_seq());
		String msg="";
		if(AoDto!=null&&AoDto.getId().equals(id)&&AoDto.getPw().equals(pw)){ //회원 정보가 존재한다면 -> 회원이 확인되면 
			session.setAttribute("AoDto", AoDto);
			session.setMaxInactiveInterval(60*600);
			if(AoDto.getGrade().equals("A")) {
				msg="Admin 로그인";
				model.addAttribute("msg",msg);
				return "ad_admin";
			}else {

				if(rDto.getName().equals("DEFAULT")) {
					msg="점주 로그인";
					model.addAttribute("Chk", "No");
					model.addAttribute("msg",msg);
					return "ow_owner";
				}else {
					msg="점주 로그인";
					model.addAttribute("Chk", "Yes");
					model.addAttribute("msg",msg);
					model.addAttribute("rDto",rDto);
					return "ow_owner";
				}
			}
		}else {
			msg="아이디가 틀렸거나 존재하는 회원이 아닙니다.";
			model.addAttribute("msg",msg);
			return "ac_ownerlogin";
			
		}
	}
	
	
	//점주로그아웃 
	@RequestMapping(value = "/ac_ownerlogout.do")
	public String ownerlogout(HttpSession session) {
		logger.info("ac_logout");
		session.removeAttribute("AoDto");
		session.invalidate();
		return "ow_loginhome.do";
	}
	
	@RequestMapping(value="/ow_owner.do")
	public String ownerlogin() {
		return "ow_owner";
		
	}
	
	@RequestMapping(value = "/ad_admin.do")
	public String adminlogin() {
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
	public String login_after(Model model,HttpSession session, String id, String pw) {
		logger.info("ac_login_after");
		LoginDto ldto= accountServ.getLogin(id, pw);
		String msg="";
		if(ldto!=null&&ldto.getId().equals(id)&&ldto.getPw().equals(pw)){ //회원 정보가 존재한다면 -> 회원이 확인되면 
			session.setAttribute("ldto", ldto);
			session.setMaxInactiveInterval(60*600); 
			return "redirect:us_usermain.do";
		}else {
			msg="아이디가 틀렸거나 존재하는 회원이 아닙니다.";
			model.addAttribute("msg",msg);
			return "ac_login";
		}
	}
	
	//유저로그아웃 
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
	@RequestMapping(value = "/ac_onwerRegist_after.do",method = RequestMethod.POST)
	public String onwerRegist_after(Model model, String id, String pw, String name,String phone, String email) {
		logger.info("ac_onwerRegist_after");
		
		Map<String, String>map = new HashMap<String,String>();
		
		map.put("id", id);
		map.put("pw", pw);
		map.put("name", name);
		map.put("phone", phone);
		map.put("email", email);
		
		boolean isS = accountServ.onwerregist(map);
			if (isS) {
				logger.info("ac_onwerRegist_after: 성공");
				
				Map<String, String>map2=new HashMap<String,String>();
				map2.put("id", id);
				map2.put("pw", pw);

				Admin_OnwerDto AoDto=accountServ.getOnwerLogin(map2);
				System.out.println(AoDto);
				model.addAttribute("res_seq",AoDto.getRes_seq());
				
				return "redirect:ac_ResListAddPage.do";
	
			}else {
				logger.info("ac_onwerRegist_after: insert 실패");
				return "redirect:ac_ownerRegistPage.do";
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
	
	//아이디 / 비밀번호 찾기 페이지 유저
	@RequestMapping(value = "/ac_retrunAccPage.do")
	public String retrunAccPage(Locale locale, Model model) {
		return "ac_retrunAcc";
	}
	
	
	//아이디 / 비밀번호 찾기 페이지 점주
	@RequestMapping(value = "/ac_retrunAccPage_ow.do")
	public String retrunAccPage_ow(Locale locale, Model model) {
		return "ac_retrunAcc_ow";
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
			 str="존재하지 않는 회원입니다. 로그인페이지로 이동합니다";
			}
			
			model.addAttribute("msg",str);
			
			
			return "ac_login.do";
	}
	
	
	//비밀번호 찾기 유저
	@RequestMapping(value = "/ac_pwRetrun.do",method = RequestMethod.POST)
	public String pwRetrun(Locale locale, Model model,String id_pw,String name_pw,String email_pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id_pw);
		map.put("name", name_pw);
		map.put("email", email_pw);
		List<LoginDto>lists=accountServ.pw_return(map);
		utils.mail_acccount(null,lists.get(0).getPw(),lists.get(0).getName(),lists.get(0).getEmail());
		
		
		String str = "";
		if(lists.size()!=0) {
			 str="비밀번호를 메일로 보내었습니다. 로그인페이지로 이동합니다";
			}
			if(lists.size()==0) {
			 str="존재하지 않는 회원입니다. 로그인페이지로 이동합니다";
			}
			
			model.addAttribute("msg",str);
			
		
		return "ac_login.do";
	}
	
	
	//아이디 찾기 점주
	@RequestMapping(value = "/ac_idRetrun_ow.do",method = RequestMethod.POST)
	public String idRetrun_ow(Locale locale, Model model,String name_id, String email_id,HttpServletRequest request,HttpServletResponse response) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name_id);
			map.put("email", email_id);
			List<Admin_OnwerDto>lists=accountServ.id_return_ow(map);
			utils.mail_acccount(lists.get(0).getId(),null,lists.get(0).getName(),lists.get(0).getEmail());
			
			String str ="";
			
			if(lists.size()!=0) {
			 str="아이디를 메일로 보내었습니다. 로그인페이지로 이동합니다";
			}
			if(lists.size()==0) {
			 str="존재하지 않는 회원입니다. 로그인페이지로 이동합니다";
			}
			
			model.addAttribute("msg",str);
			
			
			return "ac_ownerlogin";
	}
	
	
	//비밀번호 찾기 점주
	@RequestMapping(value = "/ac_pwRetrun_ow.do",method = RequestMethod.POST)
	public String pwRetrun_ow(Locale locale, Model model,String id_pw,String name_pw,String email_pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id_pw);
		map.put("name", name_pw);
		map.put("email", email_pw);
		List<Admin_OnwerDto>lists=accountServ.pw_return_ow(map);
		utils.mail_acccount(null,lists.get(0).getPw(),lists.get(0).getName(),lists.get(0).getEmail());
		
		String str ="";
		
		if(lists.size()!=0) {
		 str="비밀번호를 메일로 보내었습니다. 로그인페이지로 이동합니다";
		}
		if(lists.size()==0) {
		 str="존재하지 않는 회원입니다. 로그인페이지로 이동합니다";
		}
		
		model.addAttribute("msg",str);
		
		
		return "ac_ownerlogin";
	}
	
	
	
	
	
	
	//식당 등록 페이지 이동
	@RequestMapping(value = "/ac_ResListAddPage.do")
	public String ResListAddPage(Locale locale, Model model,String res_seq) {
		
		List<AttrsDto> lists2=accountServ.ATTRS2();
		List<AttrsDto> lists3=accountServ.ATTRS3();
		List<AttrsDto> lists4=accountServ.ATTRS4();
		List<AttrsDto> lists5=accountServ.ATTRS5();
		
		System.out.println(res_seq);
		model.addAttribute("lists2", lists2);
		model.addAttribute("lists3", lists3);
		model.addAttribute("lists4", lists4);
		model.addAttribute("lists5", lists5);
		model.addAttribute("res_seq",res_seq);
		
		return "ac_ResListAddPage";
	}
	
	
	//식당 등록
	@RequestMapping(value = "/ac_ResListAdd.do")
	public String ResListAdd(Model model,MultipartHttpServletRequest request,String res_seq,String name,String cate,String addr,
			String S_hour,String S_min,String E_hour,String E_min,String Rs_hour,String Rs_min,String Re_hour,String Re_min,
			String call,String parking,String[] menu_name,String[] cateCode,String[] cookCode,String[] spicyCode,String[] tempCode,
			String[] price,String comment,HttpSession session) {
		
//		String upload,String[] menuUpload
			
		 boolean isS=accountServ.addAllRes(request,res_seq, name, cate, addr, S_hour, S_min, E_hour, E_min, 
					Rs_hour, Rs_min, Re_hour, Re_min, call, parking, menu_name, cateCode, cookCode, 
					spicyCode, tempCode, price, comment);
		
		 
		 Admin_OnwerDto AoDto =(Admin_OnwerDto)session.getAttribute("AoDto");
		 
		 
		 
		 String msg="";
		
		 if(isS==true) {
			
			if(AoDto==null) {
				msg="식당 등록성공!메인페이지로 이동합니다.";
				model.addAttribute("msg", msg);
				model.addAttribute("AoDto", AoDto);
				model.addAttribute("Chk","Yes");
				return "ow_owner";
			} else {
				msg="식당 등록성공! 로그인페이지로 이동합니다.";
				model.addAttribute("msg", msg);
				return "redirect:ow_loginhome.do";
			}
			 
		 }else {
			 
			msg="식당 등록에 실패하였습니다.다시 등록해주세요";
			model.addAttribute("msg", msg);
			return "redirect:ac_ResListAddPage.do";
			
		 }
		 
	}
	
	
}
