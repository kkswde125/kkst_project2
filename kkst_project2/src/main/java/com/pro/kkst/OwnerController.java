package com.pro.kkst;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.kkst.imp.I_OwnerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class OwnerController {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(OwnerController.class);
	
	@Autowired
	private I_OwnerService ownerServ;
	
	@RequestMapping(value = "home1.do", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home1";
	}
	
}
