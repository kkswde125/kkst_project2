package com.pro.kkst.utils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.pro.kkst.imp.I_AccountDao;
import com.pro.kkst.imp.I_AccountService;

public class ac_Utils {
	
	@Autowired
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
	
	public boolean imageUpload(MultipartHttpServletRequest request,HttpServletRequest request2,String filename,String res_seq,String menu_seq) {
		
		boolean isS= true;
		
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		MultipartFile multifile = multi.getFile(filename);
		
		String originName=multifile.getOriginalFilename();
		
		System.out.println(originName);
		
		String createUUid=UUID.randomUUID().toString().replaceAll("-", "");
		String storeName=createUUid+originName.substring(originName.indexOf("."));
		
		File f = new File("C:/Users/Owner/git/kkst_project2/kkst_project2/src/main/webapp/Resimg/"+storeName);
		
		try {
			multifile.transferTo(f);
			Map<String, String> filemap = new HashMap<String,String>();
			
			filemap.put("origin", originName);
			filemap.put("change", storeName);
			filemap.put("res_seq", res_seq);
			
			if(menu_seq==null) {
				filemap.put("menu_seq", null);
			}else {
				filemap.put("menu_seq", menu_seq);
			}
			
			accountDao.addPhoto(filemap);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return isS;
		
	}

}
