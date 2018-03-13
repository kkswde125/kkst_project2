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

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ReviewDto;
import com.pro.kkst.imp.I_AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	@Autowired
	private I_AdminService adminServ;
	
	@RequestMapping(value = "ad_memberList.do", method = RequestMethod.GET)
	public String memberList(Model model) {
		
		List<LoginDto> lists = adminServ.memberList();
		
		model.addAttribute("lists", lists);
		
		return "ad_memberList";
	}
	
	@RequestMapping(value = "ad_reviewChoice.do", method = RequestMethod.GET)
	public String reviewChoice(Locale locale, Model model) {
		
		
		return "ad_reviewChoice";
	}
	
	@RequestMapping(value = "ad_reviewAll.do", method = RequestMethod.GET)
	public String reviewAll(Locale locale, Model model) {
		List<LoginDto> memberList = adminServ.memberList();
		List<ReviewDto> reviewList = adminServ.reviewAll();
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("memberList", memberList);
		
		System.out.println(memberList.toString());
		System.out.println(reviewList.toString());
		
		return "ad_reviewAll";
	}
	
	@RequestMapping(value = "ad_reviewReport.do", method = RequestMethod.GET)
	public String reviewReport(Locale locale, Model model) {
		
		List<ReviewDto> lists = adminServ.reviewAll();
		List<ReviewDto> reportList = new ArrayList<>();
		for (int i = 0; i < lists.size(); i++) {
			
			ReviewDto dto = adminServ.reviewReport(lists.get(i).getSeq());
			
			if (dto!=null) {
				reportList.add(dto);
			}
		}
		System.out.println(reportList.toString());
		model.addAttribute("reportList", reportList);
		return "ad_reviewReport";
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
		int count = adminServ.paging();
		
		model.addAttribute("lists", lists);
		model.addAttribute("count", count);
		model.addAttribute("START", start);
    	model.addAttribute("END", end);
		
		
		return "ad_restList";
	}
	
	@RequestMapping(value = "ad_restList_Chk.do", method = RequestMethod.GET)
	public String ad_restList_Chk(Locale locale, Model model, HttpServletRequest request) {
		
		String[] seqs = request.getParameterValues("chk");
//		List<Admin_OnwerDto> lists =  
//		model.addAttribute("");
		
		boolean isS = adminServ.restChk(seqs);
		if(isS) {
			return "redirect:ad_restList.do?snum=1&cnum=10";
		}else {
			
			return "redirect:ad_restList_Chk.do";
		}
	}
	

}
