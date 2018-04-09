package com.pro.kkst.utils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.pro.kkst.imp.I_AccountDao;
import com.pro.kkst.imp.I_AccountService;

public class ac_Utils {
	
	
	
	// 시간이 한자리로 들어왔을때 0 -> 00으ㅜ
	public String isTwo(String date) {
		
		if(date.length()==1) {
			
		date="0"+date;
			
		}
			
		return date;
	}
	
	
	public String Resultcode(String cate,String cateCode,String cookCode,String spicyCode,String tempCode) {
		
		
		String code = null;
		
		if(cate.equals("한식")) {
		
		 code="a"+cateCode+cookCode+spicyCode+tempCode;
			
		}
		if(cate.equals("중식")) {
			
			 code="b"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("일식")) {
			
			 code="c"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("양식")) {
			
			 code="d"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("횟집")) {
			
			 code="k"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("분식")) {
			
			 code="e"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("냉면집")) {
			
			 code="i"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("인도,태국")) {
			
			 code="f"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("치킨")) {
			
			 code="g"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("식육(숯불구이)")) {
			
			 code="h"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		if(cate.equals("보신용")) {
			
			 code="j"+cateCode+cookCode+spicyCode+tempCode;
				
			}
		
		return code;
	}
	

}
