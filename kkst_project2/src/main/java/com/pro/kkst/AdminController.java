package com.pro.kkst;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ReviewDto;
import com.pro.kkst.imp.I_AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
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
		
		List<ReviewDto> lists = adminServ.reviewAll();
		model.addAttribute("lists", lists);
		
		return "ad_reviewAll";
	}
	
	@RequestMapping(value = "ad_reviewReport.do", method = RequestMethod.GET)
	public String reviewReport(Locale locale, Model model) {
		
		
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

}
