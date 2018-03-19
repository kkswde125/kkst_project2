package com.pro.kkst;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.WatchaDto;
import com.pro.kkst.dtos.MenuzDto;
import com.pro.kkst.dtos.TasteDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ResReviewDto;
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
	@RequestMapping(value = "us_menu_photo_upload.do")
	public String goOwner2() {
		logger.info("메뉴사진업로드");
		return "us_menu_photo_upload";
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
	public String reslist(Model model, String cate, String seq, String mName) {
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
	
	@Transactional
	@RequestMapping(value="us_olympic.do")
	public String olympic(Model model) {
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
	public String winner(Model model,String seq) {
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
	public String test(Model model,String[] choiceSeq) {
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
	public String us_Recommend_Menu(Model model, HttpSession session, String start, String end, String[] seqs, String[] hateRs) {
		logger.info("us_recommend_menu");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			if (seqs!=null) {
				model.addAttribute("seqs",seqs);
			}
			if (hateRs!=null) {
				model.addAttribute("hateRs",hateRs);
			}
			List<MenuzDto> list = userServ.recommendMenuList(ldto.getSeq(), start, end);
			
			model.addAttribute("list", list);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			return "us_recommend_menu";
		}
	}
	
	@RequestMapping(value = "us_keeplist.do")
	public String us_KeepList(Model model, HttpSession session, String[] seqs, String[] hateRs) {
		logger.info("us_keeplist");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			if (seqs!=null) {
				model.addAttribute("seqs",seqs);
			}
			if (hateRs!=null) {
				model.addAttribute("hateRs",hateRs);
			}
			List<MenuzDto> list = userServ.getKeepList(seqs);
			model.addAttribute("list", list);
			return "us_keeplist";
		}
	}
	
	@RequestMapping(value = "us_customize_taste.do")
	public String us_Customize_Taste(Model model, HttpSession session , String cate, String seq, String mName, String[] hateRs) {
		logger.info("us_customize_taste");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			boolean isS=false;
			if (hateRs==null) {
				isS = userServ.customizeTaste(ldto.getSeq(), mName);
			}else {
				isS = userServ.customizeTaste(ldto.getSeq(), mName, hateRs);
			}
			
			model.addAttribute("cate", cate);
			model.addAttribute("seq", seq);
			model.addAttribute("mName", mName);
			if (isS) {
				logger.info("us_customize_taste:성공");
				return "redirect:us_reslist.do";
//				return "redirect:us_reslist.do?cate="+cate+"&seq="+seq+"&mName="+mName;
			}else {
				logger.info("us_customize_taste:실패");
				return "redirect:us_reslist.do";
//				return "redirect:us_reslist.do?cate="+cate+"&seq="+seq+"&mName="+mName;
			}
			
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
	
	
	@RequestMapping(value = "/us_menu_photo_uploads.do")
	public String fileuploads(Model model, MultipartHttpServletRequest request) {
		logger.info("파일업로드실행");
		
		for (int i = 0; i < request.getFiles("uploadFile").size(); i++) {
			System.out.println(request.getFiles("uploadFile").get(i).getOriginalFilename());
		}
		
		boolean isS=userServ.fileUploads(request);
		if (isS) {
			logger.info("파일업로드 성공");
			return "us_user";
		} else {
			logger.info("파일업로드 실패");
			return "us_menu_photo_upload";
		}
	}
	
	
	@Transactional
	@RequestMapping(value = "us_res_detail.do")
	public String us_Res_Detail(Model model, HttpSession session, String name, String cate, String mName, String seq, String start, String end) {
		logger.info("us_res_detail");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		if (ldto==null) {
			return "ac_login";
		}else {
			if (seq==null||mName==null||cate==null||name==null) {
				name= (String)session.getAttribute("name");
				seq= (String)session.getAttribute("seq");
				mName= (String)session.getAttribute("mName");
				cate= (String)session.getAttribute("cate");
				
			}else {
				session.setAttribute("name", name);
				session.setAttribute("seq", seq);
				session.setAttribute("mName", mName);
				session.setAttribute("cate", cate);
			}
			ResDto dto = userServ.getResDetail(name);
			model.addAttribute("dto", dto);
			String res_Seq = String.valueOf(dto.getSeq());
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
			return "us_res_detail";
		}
	}
	
	@RequestMapping(value = "/us_write_review.do")
	public String writeReview(Model model, HttpSession session, String id, String res_Seq, String content, String[] star) {
		logger.info("us_write_review");
		int count=userServ.beforeInsertResReview(id, res_Seq);
		if (count==0) {
			String starCount= star[star.length-1];
			boolean isS = userServ.insertResReview(new ResReviewDto(id, content, starCount, res_Seq));
			if (isS) {
				logger.info("리뷰쓰기 성공");
				return "redirect:us_res_detail.do";
			}else {
				logger.info("리뷰쓰기 실패");
				return "redirect:us_res_detail.do";
			}
		}else {
			logger.info("리뷰쓰기 예외처리:이미 리뷰가 등록되어있음");
			return "redirect:us_res_detail.do";
		}
		
		
	}
	@RequestMapping(value = "us_addLikey.do")
	public String us_addLikey(Model model, HttpSession session, String id, String review_seq, String likey) {
		logger.info("us_addLikey");
			boolean isS = false;
			isS = userServ.addLikey(likey, id, review_seq);
			if (isS) {
				logger.info("us_addLikey:성공");
			}else {
				logger.info("us_addLikey:실패");
			}
			return "redirect:us_res_detail.do";
	}
	
	
//	@RequestMapping(value = "us_addLikeyAjax.do", method = RequestMethod.POST)
//	public @ResponseBody Map<String, String> us_addLikey_Ajax(Model model, HttpSession session, @RequestParam String id, @RequestParam String review_seq, @RequestParam String likey) {
//		logger.info("us_addLikeyAjax");
//			boolean isS = false;
//			isS = userServ.addLikey(likey, id, review_seq);
//			Map<String, String> map = new HashMap<>();
//			if (isS) {
//				logger.info("us_addLikeyAjax:성공");
//				map.put("isS", "yes");
//			}else {
//				logger.info("us_addLikeyAjax:실패");
//				map.put("isS", "no");
//			}
//			return map;
//	}
	
	@RequestMapping(value = "us_addDislikey.do")
	public String us_addDislikey(Model model, HttpSession session, String id, String review_seq, String dislikey) {
		logger.info("us_addLikey");
			boolean isS = false;
			isS = userServ.addDislikey(dislikey, id, review_seq);
			if (isS) {
				logger.info("us_addDislikey:성공");
			}else {
				logger.info("us_addDislikey:실패");
			}
			return "redirect:us_res_detail.do";
	}
	
	@RequestMapping(value = "us_addReport.do")
	public String us_addReport(Model model, HttpSession session, String id, String review_seq, String report) {
		logger.info("us_addReport");
		boolean isS = false;
		isS = userServ.addReport(report, id, review_seq);
		if (isS) {
			logger.info("us_addReport:성공");
		}else {
			logger.info("us_addReport:실패");
		}
		return "redirect:us_res_detail.do";
	}
	
	@Transactional
	@RequestMapping(value = "us_reply.do")
	public String us_reply(Model model, HttpSession session, String seq, String content) {
		logger.info("us_reply");
		LoginDto ldto=(LoginDto)session.getAttribute("ldto");
		String res_Seq= (String)session.getAttribute("res_Seq");
		boolean isS = false;
		isS= userServ.insertAnsResReview(new ResReviewDto(seq, String.valueOf(ldto.getSeq()), content, res_Seq, null));
		if (isS) {
			logger.info("us_reply:성공");
		}else {
			logger.info("us_reply:실패");
		}
		return "redirect:us_res_detail.do";
	}
}
