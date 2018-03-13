package com.pro.kkst.utils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.pro.kkst.imp.I_AccountDao;
import com.pro.kkst.imp.I_AccountService;

public class ac_Utils {
	
	
	private I_AccountDao accountDao;
	
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
		
		return code;
	}
	
	public boolean imageUpload(HttpServletRequest request,String filename,String res_seq,String menu_seq) {
		
		boolean isS= true;
		
		MultipartRequest multi=(MultipartRequest)request;
		MultipartFile multifile = multi.getFile(filename);
		
		String originName=multifile.getOriginalFilename();
		String createUUid=UUID.randomUUID().toString().replaceAll("-", "");
		String storeName=createUUid+originName.substring(originName.indexOf("."));
		
		File f = new File("C:/Users/Owner/git/kkst_project2/kkst_project2/src/main/webapp/Resimg"+storeName);
		
		try {
			multifile.transferTo(f);
			Map<String, String> filemap = new HashMap<String,String>();
			
			filemap.put("origin", originName);
			filemap.put("change", storeName);
			filemap.put("res_seq", res_seq);
			filemap.put("menu_seq", menu_seq);
			
			accountDao.addPhoto(filemap);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return isS;
		
	}

}
