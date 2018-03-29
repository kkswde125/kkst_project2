package com.pro.kkst;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.kkst.dtos.AddrDto;
import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ResInfoDto;
import com.pro.kkst.dtos.Res_ReviewDto;
import com.pro.kkst.dtos.ReviewDto;
import com.pro.kkst.imp.I_AdminService;
import com.pro.kkst.utils.Ad_Utils;

@Controller
public class AdminController {
	
	@Autowired
	private I_AdminService adminServ;
	
	Ad_Utils utils = new Ad_Utils();
	
	@RequestMapping(value = "ad_memberList.do", method = RequestMethod.GET)
	public String memberList(Model model, String snum, String cnum, HttpSession session) {
		
		if(snum==null) {
		       snum=(String)session.getAttribute("snum");
		       cnum=(String)session.getAttribute("cnum");
		    }else {
		       session.setAttribute("snum", snum);
		       session.setAttribute("cnum", cnum);   
		    }
		    
		    double d_snum = (Integer.parseInt(snum)/100);
		    
		    int start = 0;
		    int end = 0;
		    
		    if(d_snum<1) {
		    	start = (int)d_snum+1;
		    	end = 11;
		    	
		    }else {
		    	start = Integer.parseInt((int)d_snum+"1");
		    	end = Integer.parseInt(((int)d_snum+1)+"0");
		    }
		    
			int count = adminServ.MemPaging();
			List<LoginDto> lists = adminServ.memberList(snum, cnum);
			
			model.addAttribute("lists", lists);
			model.addAttribute("count", count);
			model.addAttribute("start", start);
	    	model.addAttribute("end", end);
	    	
		return "ad_memberList";
	}
	
	@RequestMapping(value = "ad_memDel.do", method = RequestMethod.POST)
	public String memDel(Locale locale, HttpServletRequest request) {
		String[] seqs = request.getParameterValues("chk");
		
		boolean isS = adminServ.memberDel(seqs);
		
		if(isS) {
			return "redirect:ad_memberList.do";
		}else {
			
			return "ad_memberList.do";
		}
		
	}
	
	@RequestMapping(value = "ad_memDelCancle.do", method = RequestMethod.POST)
	public String ad_memDelCancle(Locale locale, HttpServletRequest request) {
		String[] seqs = request.getParameterValues("chk");
		
		boolean isS = adminServ.memberDelCancle(seqs);
		
		if(isS) {
			return "redirect:ad_memberList.do";
		}else {
			
			return "redirect:ad_memberList.do";
		}
		
	}
	
	@RequestMapping(value = "ad_reviewChoice.do", method = RequestMethod.GET)
	public String reviewChoice(Locale locale, Model model) {
		
		
		return "ad_reviewChoice";
	}
	
	@RequestMapping(value = "ad_allRevAreaChoice.do", method = RequestMethod.GET)
	public String ad_reviewChoice(Locale locale, HttpServletRequest request, String msg) {
		List<AddrDto> addrList = adminServ.addressList();
		request.setAttribute("addrList", addrList);
		if(msg!=null) {
			msg = "해당 지역에 등록된 식당 리뷰가 존재하지 않습니다.";
			request.setAttribute("msg", msg);
		}
		return "ad_allRevAreaChoice";
		
		
	}
	
	@RequestMapping(value = "ad_reviewDetail.do", method = RequestMethod.GET)
	public String reviewAll(Locale locale, HttpServletRequest request, String area, String msg,Model model) {
		if(area!=null) {
			request.getSession().setAttribute("area", area);
		}else {
			area = (String)request.getSession().getAttribute("area");
		}
		List<ResDto> resList = adminServ.areaResList(area);
		int[] seqs = null;
		if(resList.size()==0) {
			seqs = new int[1];
			seqs[0] = 0;
		}else {
			seqs = new int[resList.size()];
			for (int i = 0; i < resList.size(); i++) {
				seqs[i] = resList.get(i).getSeq();
			}
		}
		List<Res_ReviewDto> reviewList = adminServ.reviewAll(area, seqs);
		System.out.println(resList.size());
		System.out.println(reviewList.size());
		if(reviewList.size()==0) {
			return "redirect:ad_allRevAreaChoice.do?msg=no";
		}else {
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("resList", resList);
		return "ad_reviewDetail";
		}
		
	}
	
	@RequestMapping(value = "ad_reportRevAreaChoice.do", method = RequestMethod.GET)
	public String ad_reportRevAreaChoice(Locale locale, HttpServletRequest request, String msg) {
		List<AddrDto> addrList = adminServ.addressList();
		request.setAttribute("addrList", addrList);
		if(msg!=null) {
			msg = "해당 지역에 신고된 식당 리뷰가 존재하지 않습니다.";
			request.setAttribute("msg", msg);
		}
		return "ad_reportRevAreaChoice";
		
		
	}
	
	@RequestMapping(value = "ad_reviewDel.do", method = RequestMethod.POST)
	public String ad_reviewDel(Locale locale, HttpServletRequest request) {
		String area = (String)request.getSession().getAttribute("area");
		String[] seqs = request.getParameterValues("chk");
		for (int i = 0; i < seqs.length; i++) {
			System.out.println(seqs[i]);
		}
		boolean isS = adminServ.reviewDel(seqs);
		if(isS) {
			System.out.println("리뷰 삭제 성공");
			request.setAttribute("area", area);
			return "redirect:ad_reviewDetail.do";
		}else {
			System.out.println("리뷰 삭제 실패");
			request.setAttribute("area", area);	
			return "redirect:ad_reviewDetail.do";
		}
		
	}
	
	@RequestMapping(value = "ad_reviewDel_report.do", method = RequestMethod.POST)
	public String ad_reviewDel_report(Locale locale, HttpServletRequest request) {
		String area = (String)request.getSession().getAttribute("area");
		String[] seqs = request.getParameterValues("chk");
		for (int i = 0; i < seqs.length; i++) {
			System.out.println(seqs[i]);
		}
		boolean isS = adminServ.reviewDel(seqs);
		if(isS) {
			System.out.println("리뷰 삭제 성공");
			request.setAttribute("area", area);
			return "redirect:ad_reviewReport.do";
		}else {
			System.out.println("리뷰 삭제 실패");
			request.setAttribute("area", area);	
			return "redirect:ad_reviewReport.do";
		}
		
	}
	
	@RequestMapping(value = "ad_reviewReport.do", method = RequestMethod.GET)
	public String reportRevAreaChoice(Locale locale, HttpServletRequest request, String area) {
		
		if(area!=null) {
			request.getSession().setAttribute("area", area);
		}else {
			area = (String)request.getSession().getAttribute("area");
		}
		
		List<ResDto> lists = adminServ.areaResList(area);
		int size = 0;
		int[] seqs = null;
		if(lists.size()==0) {
			seqs = new int[1];
			seqs[0] = 0;
		}else {
			size = lists.size();
			seqs = new int[size];
			for (int i = 0; i < size; i++) {
				seqs[i] = lists.get(i).getSeq();
			}
			
		}
			List<Res_ReviewDto> reportList = adminServ.reviewReport(area, seqs);
			if(reportList.size()==0||reportList==null) {
				return "redirect:ad_reportRevAreaChoice.do?msg=no";
			}else {
				request.setAttribute("reportList", reportList);
				request.setAttribute("areaList", lists);
				System.out.println(reportList.toString());
				System.out.println(lists.toString());
				return "ad_reviewReport";
			}
		
	}
	

	
	@RequestMapping(value = "ad_restList.do", method = RequestMethod.GET)
	public String ad_reslist(Model model, String snum, String cnum, HttpSession session) {
	    
		
	    if(snum==null) {
	       snum=(String)session.getAttribute("snum");
	       cnum=(String)session.getAttribute("cnum");
	    }else {
	       session.setAttribute("snum", snum);
	       session.setAttribute("cnum", cnum);   
	    }
	    
	    double d_snum = (Integer.parseInt(snum)/100);
	    
	    int start = 0;
	    int end = 0;
	    
	    if(d_snum<1) {
	    	start = (int)d_snum+1;
	    	end = 11;
	    	
	    }else {
	    	start = Integer.parseInt((int)d_snum+"1");
	    	end = Integer.parseInt(((int)d_snum+1)+"0");
	    }
	    
		List<ResDto> lists = adminServ.restList(snum, cnum);
		int count = adminServ.RestPaging();
		
		System.out.println("Controller :"+lists.toString());
		
		model.addAttribute("lists", lists);
		model.addAttribute("count", count);
		model.addAttribute("start", start);
    	model.addAttribute("end", end);
		
		
		return "ad_restList";
	}
	
	@RequestMapping(value = "ad_restList_Chk.do", method = RequestMethod.GET)
	public String ad_restList_Chk(Locale locale, Model model, HttpServletRequest request) {
		System.out.println("Controller 입장");
		
		double x = Double.parseDouble(request.getParameter("x"));
		double y = Double.parseDouble(request.getParameter("y"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		Admin_OnwerDto dto = adminServ.sendEmail(seq);
		model.addAttribute("dto", dto);
		boolean isS = adminServ.restChk(seq, x, y);
		if(isS) {
			return "ad_restList_Chk";
		}else {
			return "redirect:ad_restList.do?snum=1&cnum=10";			
		}
	}
	
	@RequestMapping(value = "ad_restList_Del.do", method = RequestMethod.POST)
	public String ad_restList_Del(Locale locale, Model model, HttpServletRequest request) {
		
		String[] seqs = request.getParameterValues("chk");
		boolean isS = adminServ.restDel(seqs);
		if(isS) {
			return "redirect:ad_restList.do?snum=1&cnum=10";			
		}else {
			return "redirect:ad_restList.do?snum=1&cnum=10";
		}
	}
	
	@RequestMapping(value = "sendEmail.do", method = RequestMethod.POST)
	public String sendEmail(Locale locale, Model model, String email, String content, String seq) {
		Admin_OnwerDto dto = adminServ.send_Email(email, seq);
		utils.mail_acccount(dto.getName(), email, content);
		
		return "redirect:ad_restList.do?snum=1&cnum=10";
	}

	@RequestMapping(value = "ad_restList_detail.do", method = RequestMethod.GET)
	public String ad_restList_detail(Locale locale, Model model, HttpServletRequest request, int res_seq) {
		
		List<ResInfoDto> lists = adminServ.restList_detail(res_seq);
		
		model.addAttribute("list", lists);
		
		return "ad_restList_detail";
		
	}
	
}
