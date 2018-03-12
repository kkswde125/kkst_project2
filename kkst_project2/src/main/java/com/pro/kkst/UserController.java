package com.pro.kkst;

import java.text.DateFormat;
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

import com.pro.kkst.dtos.WatchaDto;
import com.pro.kkst.dtos.MenuzDto;
import com.pro.kkst.dtos.TasteDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_UserService;

@Controller
public class UserController {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private I_UserService userServ;
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	@RequestMapping(value = "user.do")
	public String goUser() {
		return "us_user";
	}
	
	@RequestMapping(value = "account.do")
	public String goAccount() {
		return "ac_account";
	}
	
	@RequestMapping(value = "owner.do")
	public String goOwner() {
		return "ow_owner";
	}
	
	@RequestMapping(value = "admin.do")
	public String goAdmin() {
		return "ad_admin";
	}
	
	@RequestMapping(value = "us_reslist.do")
	public String reslist(Locale locale, Model model, String cate, String seq, String mName) {
		logger.info("us_reslist");
		List<ResDto> lists =userServ.ResList(cate);
		List<ResDto> lists2 = userServ.ResList2(seq);
		model.addAttribute("lists",lists);
		model.addAttribute("lists2",lists2);
		model.addAttribute("cate",cate);
		model.addAttribute("mName",mName);
		model.addAttribute("seq",seq);
		return "us_resMap";
	}
	
	@RequestMapping(value="us_olympic.do")
	public String olympic(Locale locale, Model model) {
		logger.info("us_olympic");
		List<menuDto> lists1=userServ.menuList();
		List<menuDto> lists2=null;
		int[]seqs=new int[32];
		int num=0;
		boolean chk=true;
		for (int i = 0; i <seqs.length; i++) {
				chk=true;
			while (chk) {
				num = (int)(Math.random()*lists1.size()+1);
				if (i>0) {
					for (int j = 0; j < seqs.length; j++) {
						if (seqs[j]==num) {
							chk=true;
							break;
						}else {
							chk=false;
						}
					}
				}else {
					break;
				}
				System.out.println(num);
			}
			seqs[i]= num;
		}
		Map<String,int[]>map =new HashMap<String,int[]>();
		map.put("Rseq", seqs);
		lists2=userServ.food(map);
		model.addAttribute("lists",lists2);
		return "us_olympic";
	}
	
/*	@RequestMapping(value="randomFood.do")
	public String randomFood(Locale locale, Model model,String seq) {
		int[] seqs = new int[2];
		List<menuDto> lists1= menuservice.menuList();
			seqs[0]=(int)(Math.random()*lists1.size()+1);
			seqs[1]=Integer.parseInt(seq);
		Map<String,int[]>map =new HashMap<String,int[]>();
		map.put("Rseq", seqs);
		List<menuDto> lists2=menuservice.food(map);
		model.addAttribute("lists", lists2);
		return "food";
	}*/
	
	@RequestMapping(value="us_winner.do")
	public String winner(Locale locale, Model model,String seq) {
		logger.info("us_winner");
		int[] seqs = new int[1]; 
		seqs[0]=Integer.parseInt(seq);
		Map<String,int[]>map =new HashMap<String,int[]>();
		map.put("Rseq", seqs);
		List<menuDto> lists = userServ.food(map);
		model.addAttribute("lists1", lists);
		return "us_winner";
	}
	
	
	@RequestMapping(value="us_nextOlympic.do")
	public String test(Locale locale, Model model,String[] choiceSeq) {
		logger.info("us_nextOlympic");
		int [] seqs= new int[16];
		for (int i = 0; i < choiceSeq.length; i++) {
			seqs[i] = Integer.parseInt(choiceSeq[i]);
		}	
		Map<String,int[]>map = new HashMap<String,int[]>();
		map.put("Rseq",seqs);
		List<menuDto> lists = userServ.food(map);
		model.addAttribute("lists",lists);
		return "us_olympic";
	}
	
	
	@RequestMapping(value = "us_usermain.do")
	public String us_UserMain(Model model, HttpSession session) {
		logger.info("us_usermain");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			
			if (userServ.hasTaste(ldto.getSeq())) {
				model.addAttribute("hasTaste", "yes");
			}else {
				model.addAttribute("hasTaste", "no");
			}
			return "us_usermain";
		}
	}
	
	@RequestMapping(value = "us_regist_taste_watcha.do")
	public String us_Regist_Taste(Model model, HttpSession session) {
		logger.info("us_regist_taste_watcha");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
				
			List<WatchaDto> list = userServ.watchaBox();
			model.addAttribute("list", list);
			return "us_regist_taste";
		}
	}
	
	@RequestMapping(value = "us_getstars.do")
	public String us_GetStars(Model model, HttpSession session, String[] stars, String[] codes) {
		logger.info("us_getstars");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
		
			boolean isS=false;
			for (int i = 0; i < stars.length; i++) {
				isS=userServ.setStars(Integer.parseInt(stars[i]), ldto.getSeq(), codes[i]);
				if (!isS) {
					break;
				}
			}
			if (isS) {
				if (userServ.hasZero(ldto.getSeq())) {
					return "redirect:us_getmorestars.do";
				}else {
					return "redirect:us_usermain.do";
				}
			}else {
				return "redirect:us_usermain.do";
			}
		
		}
	}
	
	@RequestMapping(value = "us_getmorestars.do")
	public String us_GetMoreStars(Model model, HttpSession session) {
		logger.info("us_getmorestars");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			List<WatchaDto> list = userServ.watchaMoreBox(ldto.getSeq());
			model.addAttribute("list", list);
			return "us_regist_taste";
		}
	}
	
	@RequestMapping(value = "us_recommend_menu.do")
	public String us_Recommend_Menu(Model model, HttpSession session, String start, String end, String seqs) {
		logger.info("us_recommend_menu");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			String[] seq=seqs.split("_");
			List<MenuzDto> list = userServ.recommendMenuList(ldto.getSeq(), start, end);
			model.addAttribute("list", list);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			model.addAttribute("seqs",seq);
			return "us_recommend_menu";
		}
	}
	
	@RequestMapping(value = "us_show_taste.do")
	public String us_ShowTaste(Model model, HttpSession session) {
		logger.info("us_show_taste");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			List<TasteDto> list= userServ.getMyTaste(ldto.getSeq());
			model.addAttribute("list", list);
			return "us_show_taste";
		}
	}
	
	@RequestMapping(value = "us_regist_moreTaste.do")
	public String us_Regist_MoreTaste(Model model, HttpSession session) {
		logger.info("us_regist_moreTaste");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			List<WatchaDto> list= userServ.watchaMoreMoreBox(); 
			model.addAttribute("list", list);
			return "us_regist_moretaste";
		}
	}
	
	@RequestMapping(value = "us_keeplist.do")
	public String us_KeepList(Model model, HttpSession session, String seqs) {
		logger.info("us_keeplist");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			String[] seq=seqs.split("_");
			List<MenuzDto> list = userServ.getKeepList(seq);
			model.addAttribute("list", list);
			return "us_keeplist";
		}
	}
	
	@RequestMapping(value = "us_res_detail.do")
	public String us_Res_Detail(Model model, HttpSession session, String name, String cate, String mName, String seq) {
		logger.info("us_res_detail");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			ResDto dto = userServ.getResDetail(name);
			model.addAttribute("dto", dto);
			model.addAttribute("seq", seq);
			model.addAttribute("mName", mName);
			model.addAttribute("cate", cate);
			return "us_res_detail";
		}
	}
	
}
