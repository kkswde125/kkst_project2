package com.pro.kkst;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_AccountService;
import com.pro.kkst.imp.I_OwnerService;
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
	
	ac_Utils ac_util = new ac_Utils();
	
	@RequestMapping(value = "devMenu.do")
	public String devMenu(Locale locale, Model model,String seq) {
		
		 List<AttrJoinDto> menuAttr1 = ownerServ.menuAttr1();
		 List<AttrJoinDto> menuAttr2 = ownerServ.menuAttr2();
		 List<AttrJoinDto> menuAttr3 = ownerServ.menuAttr3();
		 List<AttrJoinDto> menuAttr4 = ownerServ.menuAttr4();
		
		 ResDto rDto=accountServ.chkRes(Integer.parseInt(seq));
		 
		 String cate = rDto.getCate();
	
		 String ResultCode=ac_util.Resultcode(cate, menuAttr1.get(0).getCode(),menuAttr2.get(0).getCode(), menuAttr3.get(0).getCode(), menuAttr4.get(0).getCode());
		
		 menuDto mDto=ownerServ.menuSearch(ResultCode);
		 
		 
		 
		 
		 
		return "ow_devMenu";
	}
	
}
