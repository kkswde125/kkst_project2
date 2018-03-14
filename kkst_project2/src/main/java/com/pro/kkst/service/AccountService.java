package com.pro.kkst.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_AccountDao;
import com.pro.kkst.imp.I_AccountService;
import com.pro.kkst.utils.ac_Utils;

@Service
public class AccountService implements I_AccountService {
	@Autowired
	private I_AccountDao accountDao;
	
	private ac_Utils utils= new ac_Utils();

	@Override
	public List<LoginDto> userList() {
		return null;
	}

	@Override
	public List<LoginDto> id_return(Map<String, String> map) {
		return accountDao.id_return(map);
	}

	@Override
	public List<LoginDto> pw_return(Map<String, String> map) {
		return accountDao.pw_return(map);
	}

	@Override
	public LoginDto getLogin(String id, String pw) {
		LoginDto dto = new LoginDto();
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		dto=accountDao.selectLogin(map);
		return dto;
	}

	@Override
	public boolean regist(LoginDto dto) {
		int count=0;
		count=accountDao.insertRegist(dto);
		return count>0?true:false;
	}

	@Transactional
	@Override
	public boolean regist_taste00(String id) {
		int count=0;
		int attrCount=0;
		int seq=0;
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		seq=accountDao.selectSearchSeq(map);
		map.put("user_seq", seq+"");
		attrCount=accountDao.selectGetAttrCount();
		for (int i = 0; i < attrCount; i++) {
			map.put("index", i+1+"");
			count=accountDao.insertRegist_taste(map);
		}
		return count>0?true:false;
	}

	@Override
	public Admin_OnwerDto getOnwerLogin(Map<String, String> map) {
		return accountDao.getOnwerLogin(map);
	}

	@Override
	public boolean onwerregist(Map<String,String> map) {
		
		 return accountDao.onwerregist(map);
	}

	@Override
	public List<Admin_OnwerDto> id_return_ow(Map<String, String> map) {
		return accountDao.id_return_ow(map);
	}

	@Override
	public List<Admin_OnwerDto> pw_return_ow(Map<String, String> map) {
		return accountDao.pw_return_ow(map);
	}

	@Override
	public List<AttrsDto> ATTRS2() {
		return accountDao.ATTRS2();
	}

	@Override
	public List<AttrsDto> ATTRS3() {
		return accountDao.ATTRS3();
	}

	@Override
	public List<AttrsDto> ATTRS4() {
		return accountDao.ATTRS4();
	}

	@Override
	public List<AttrsDto> ATTRS5() {
		return accountDao.ATTRS5();
	}

	
	@Transactional
	@Override
	public boolean addAllRes(MultipartHttpServletRequest request,String res_seq,String name,String cate,String addr,
			String S_hour,String S_min,String E_hour,String E_min,String Rs_hour,String Rs_min,String Re_hour,String Re_min,
			String call,String parking,String[] menu_name,String[] cateCode,String[] cookCode,String[] spicyCode,String[] tempCode,
			String[] price,String comment) {
		
		boolean isS=false;
		
		
		String Sdate = utils.isTwo(S_hour)+":"+utils.isTwo(S_min);
		String Edate = utils.isTwo(E_hour)+":"+utils.isTwo(E_min);
		String RsDate = utils.isTwo(Rs_hour)+":"+utils.isTwo(Rs_min);
		String ReDate = utils.isTwo(Re_hour)+":"+utils.isTwo(Re_min);
		
		String code[]=new String[menu_name.length];

		for (int i = 0; i < menu_name.length; i++) {
			code[i]=utils.Resultcode(cate, cateCode[i], cookCode[i], spicyCode[i], tempCode[i]);
			System.out.println(i+":"+code[i]);
			
		}
		
		
		Map<String, String> resmap = new HashMap<String,String>();
		//식당 추가 부분	
		resmap.put("name",name);
		resmap.put("cate", cate);
		resmap.put("addr", addr);
		resmap.put("call",call);
		resmap.put("start", Sdate);
		resmap.put("end", Edate);
		resmap.put("rest_start", RsDate);
		resmap.put("rest_end", ReDate);
		resmap.put("parking", parking);
		resmap.put("comment",comment);
		resmap.put("seq", res_seq);	
		
		System.out.println(resmap);
		
		isS=accountDao.addRes(resmap);
		
		if (isS==true) {
			Map<String,String> menumap = new HashMap<String,String>();
			
//		boolean checkz2 = false;
			
			Map<String,String> Searchmap = new HashMap<String,String>();
			List<menuDto> menulists = null;
			for (int i = 0; i < menu_name.length; i++) {
				
				//메뉴 추가부분
				menumap.put("name", menu_name[i]);
				menumap.put("code", code[i]);
				menumap.put("res_seq", res_seq);
				menumap.put("price", price[i]);
				isS=accountDao.addMenu(menumap);
		
				Searchmap.put("name", menu_name[0]);
				Searchmap.put("res_seq", res_seq);
				menulists=accountDao.searchMenuSeq(Searchmap);
				
			}
				
				
				
				
			 List<MultipartFile> multifile=request.getFiles("uploadFile");
				
			 	System.out.println(multifile.size());
			 
				String originName = "";
				String createUUid ="";
				String storeName ="";
				
				
				
				for (int j = 0; j < multifile.size(); j++) {
				
					
					originName=multifile.get(j).getOriginalFilename();
					System.out.println(originName);
					createUUid=UUID.randomUUID().toString().replaceAll("-", "");
					System.out.println(originName.lastIndexOf("."));
					storeName=createUUid+originName.substring(originName.lastIndexOf("."));
					File f = new File("C:/Users/Owner/git/kkst_project2/kkst_project2/src/main/webapp/resources/Resimg/"+storeName);
					
					try {
						
						multifile.get(j).transferTo(f);
						
						Map<String, String> filemap = new HashMap<String,String>();
						
						filemap.put("origin", originName);
						filemap.put("change", storeName);
						filemap.put("res_seq", res_seq);
						filemap.put("menu_seq",menulists.get(0).getSeq()+"");
					
						System.out.println(filemap);
						
						accountDao.addPhoto(filemap);
						
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

		}
		
		
		return isS;
	}
//
//	@Override
//	public boolean addMenu(Map<String, String> map) {
//		return accountDao.addMenu(map);
//	}
//	@Override
//	public boolean addPhoto(Map<String, String> map) {
//		return accountDao.addPhoto(map);
//	}
//	
//	@Override
//	public List<menuDto> searchMenuSeq(Map<String, String>map) {
//		return accountDao.searchMenuSeq(map);
//	}


}
