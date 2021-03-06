package com.pro.kkst.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.AttrsDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
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

	
	
	// 식당 등록 after
	@Transactional
	@Override
	public boolean addAllRes(MultipartHttpServletRequest request,
			String res_seq,String name,String cate,String addr,String S_hour,String S_min,String E_hour,String E_min,String Rs_hour,String Rs_min,String Re_hour,String Re_min,
			String call,String parking,
			String[] menu_name,String[] cateCode,String[] cookCode,String[] spicyCode,String[] tempCode,
			String[] price,String comment) {
		
		boolean isS=false;
		
		// Selected된 시간의 값을 00:00의 형태로 조합해줌
		String Sdate = utils.isTwo(S_hour)+":"+utils.isTwo(S_min);
		String Edate = utils.isTwo(E_hour)+":"+utils.isTwo(E_min);
		String RsDate = utils.isTwo(Rs_hour)+":"+utils.isTwo(Rs_min);
		String ReDate = utils.isTwo(Re_hour)+":"+utils.isTwo(Re_min);
		
		
		// Menu의 갯수 만큼 배열 선언
		String code[]=new String[menu_name.length];

		// 등록된 메뉴에 대한 속성들을 받아 하나씩 조합해줌 
		for (int i = 0; i < menu_name.length; i++) {
			code[i]=utils.Resultcode(cate, cateCode[i], cookCode[i], spicyCode[i], tempCode[i]);			
		}
		
		
		//식당 Update 부분	
		Map<String, String> resmap = new HashMap<String,String>();
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
		
		isS=accountDao.addRes(resmap);
	
		//식당 등록에 성공 하였을 때 메뉴에 대한 insert와 파일에 대한 insert를 실행 
		if (isS) {
			
			Map<String,String> menumap = new HashMap<String,String>();
			Map<String,String> Searchmap = new HashMap<String,String>();
			
			//등록 후 등록한 메뉴에 대해서 seq를 Select하여 담아주기 위한 배열 선언
			String [] menulists=new String[menu_name.length];
			
			//메뉴를 등록 -> 등록한걸 select 
			for (int i = 0; i < menu_name.length; i++) {
				//메뉴 추가부분
				menumap.put("name", menu_name[i]);
				menumap.put("code", code[i]);
				menumap.put("res_seq", res_seq);
				menumap.put("price", price[i]);
				
				isS=accountDao.addMenu(menumap);
				
				
				//추가한 메뉴의 seq를 select 하는 부분
				Searchmap.put("name", menu_name[i]);
				Searchmap.put("res_seq", res_seq);
				
				//위에 선언한 배열에 담아준다.
				menulists[i]=accountDao.searchMenuSeq(Searchmap);
			}
			
			 //Multipart로 넘어온 File 객체를 List로 받아줌
			 List<MultipartFile> multifile=request.getFiles("uploadFile");
				
				String originName = "";
				String createUUid ="";
				String storeName ="";
				
				for (int j = 0; j < multifile.size(); j++) {
					//원본파일의 이름을 담아줌
					originName=multifile.get(j).getOriginalFilename();
					
					//파일 이름의 중복을 방지하기 위해 UUID를 생성하여 담아줌
					createUUid=UUID.randomUUID().toString().replaceAll("-", "");
					
					//UUID + 확장자 -> UUID.jpg
					storeName=createUUid+originName.substring(originName.lastIndexOf("."));
					
					//업로드 경로 설정
					File f = new File("C:/Users/Owner/git/kkst_project2/kkst_project2/src/main/webapp/resources/Resimg/"+storeName);
					
					try {
						//파일 업로드
						multifile.get(j).transferTo(f);
						
						
						//file 정보를 DB에 담아줌 (식당 메인 이미지)
						Map<String, String> filemap = new HashMap<String,String>();
						
						filemap.put("origin", originName);
						filemap.put("change", storeName);
						filemap.put("res_seq", res_seq);
						if(originName.equals(multifile.get(0).getOriginalFilename())) {
							accountDao.addPhoto2(filemap);
						
						//메뉴에 대한 이미지일때 
						}else {
								filemap.put("menu_seq",menulists[j-1]);
								accountDao.addPhoto(filemap);
						}
					
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
		}
		return isS;
	}

	@Override
	public ResDto chkRes(int seq) {
		return accountDao.chkRes(seq);
	}

	@Override
	public int IdChk_user(String id) {
		return accountDao.IdChk_user(id);
	}

	@Override
	public int IdChk_Onwer(String id) {
		return accountDao.IdChk_Onwer(id);
	}




}
