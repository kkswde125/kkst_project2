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
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.PhotoDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_AccountDao;
import com.pro.kkst.imp.I_OwnerDao;
import com.pro.kkst.imp.I_OwnerService;
import com.pro.kkst.utils.ac_Utils;

@Service
public class OwnerService implements I_OwnerService {
	@Autowired
	private I_OwnerDao ownerDao;
	
	@Autowired
	private I_AccountDao accountDao;
	
	ac_Utils ac_util = new ac_Utils();

	@Override
	public List<AttrJoinDto> menuAttr1() {
		return ownerDao.menuAttr1();
	}

	@Override
	public List<AttrJoinDto> menuAttr2() {
		return ownerDao.menuAttr2();
	}

	@Override
	public List<AttrJoinDto> menuAttr3() {
		return ownerDao.menuAttr3();
	}

	@Override
	public List<AttrJoinDto> menuAttr4() {
		return ownerDao.menuAttr4();
	}

	@Override
	public List<menuDto> menuSearch(String code) {
		return ownerDao.menuSearch(code);
	}

	@Override
	public boolean ownerMyInfo(Map<String, String> map) {
		return ownerDao.ownerMyInfo(map);
	}

	@Override
	public List<PhotoDto> ResPhotoList(String res_seq) {
		return ownerDao.ResPhotoList(res_seq);
	}

	@Override
	public List<menuDto> ResMenuList(String res_seq) {
		return ownerDao.ResMenuList(res_seq);
	}

	@Transactional
	@Override
	public boolean delMenu(String seq) {
	
		boolean isS = false;
		
		 isS=ownerDao.delPhoto(seq);
		 isS=ownerDao.delMenu(seq);

		return isS; 
	}

	
	//식당 정보 업데이트
	@Override
	public boolean updateResInfo(Model model, String res_seq, String name, String cate, String addr, String S_hour,
			String S_min, String E_hour, String E_min, String Rs_hour, String Rs_min, String Re_hour, String Re_min,
			String call, String parking, String comment) {
		
		String Sdate = ac_util.isTwo(S_hour)+":"+ac_util.isTwo(S_min);
		String Edate = ac_util.isTwo(E_hour)+":"+ac_util.isTwo(E_min);
		String RsDate = ac_util.isTwo(Rs_hour)+":"+ac_util.isTwo(Rs_min);
		String ReDate = ac_util.isTwo(Re_hour)+":"+ac_util.isTwo(Re_min);
		
		
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
		
		boolean isS=accountDao.addRes(resmap);
			
		
		return isS;
	}

	
	
	//새로운 메뉴를 추가했을때
	@Transactional
	@Override
	public boolean insertMenu(MultipartHttpServletRequest request, String[] menu_name, String[] cateCode,
			String[] cookCode, String[] spicyCode, String[] tempCode, String[] price, Model model, String res_seq,String cate) {
		

		
		boolean isS=false;
		
		String code[]=new String[menu_name.length];
		
		
		for (int i = 0; i < code.length; i++) {
		code[i]=ac_util.Resultcode(cate, cateCode[i], cookCode[i], spicyCode[i], tempCode[i]);
			
		}
				
		
		Map<String,String> menumap = new HashMap<String,String>();
		
			
		Map<String,String> Searchmap = new HashMap<String,String>();

		String [] menulists=new String[menu_name.length];
		
		//메뉴를 등록 -> 등록한걸 select 
		for (int i = 0; i < menu_name.length; i++) {
			
			//메뉴 추가부분
			menumap.put("name", menu_name[i]);
			menumap.put("code", code[i]);
			menumap.put("res_seq", res_seq);
			menumap.put("price", price[i]);
			isS=ownerDao.insertMenu(menumap);
	
			Searchmap.put("name", menu_name[i]);
			Searchmap.put("res_seq", res_seq);
			Searchmap.put("price", price[i]);
//			menulists=accountDao.searchMenuSeq(Searchmap);
			menulists[i]=ownerDao.SearchMenuSeq(Searchmap);
		}
		
		
		
		if(isS=true) {
			
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
					filemap.put("menu_seq",menulists[j]);
					
					
					System.out.println("menulist ="+menulists.length);
					
					isS=ownerDao.insertPhoto(filemap);
					
					System.out.println("실행");
					System.out.println(filemap);
					
					
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		return isS;
	}

	
	//Update
	@Transactional 
	@Override
	public boolean updateMenu(MultipartHttpServletRequest request, String[] menu_name_d, String[] cateCode_d,
			String[] cookCode_d, String[] spicyCode_d, String[] tempCode_d, String[] price_d, Model model,
			String res_seq, String cate,String[] menu_seq,String [] Photo_seq,String[] fileOname,String[] fileSname) {
	
		System.out.println("Service 진입");
		
		boolean isS=false;
		
		String code[]=new String[menu_name_d.length];
		
		System.out.println("menuname 길이" + menu_name_d.length);
		
		for (int i = 0; i < code.length; i++) {
		code[i]=ac_util.Resultcode(cate, cateCode_d[i], cookCode_d[i], spicyCode_d[i], tempCode_d[i]);
		System.out.println("code["+i+"]번째에 값넣는중");
			
		}
		
		for (int i = 0; i < menu_name_d.length; i++) {
			
			Map<String, String> MenuMap = new HashMap<String,String>();
			
			MenuMap.put("name", menu_name_d[i]);
			MenuMap.put("code", code[i]);
			MenuMap.put("price", price_d[i]);
			MenuMap.put("seq", menu_seq[i]);
			
			
			isS=ownerDao.updateMenu(MenuMap);
			
		}
		
		List<MultipartFile> multifile=request.getFiles("uploadFile_d");
		
		
		List<MultipartFile> multifileA=request.getFiles("uploadFile_A");
		System.out.println(multifile.size());
		System.out.println(multifileA.size());
		
		String originName = "";
		String createUUid ="";
		String storeName ="";
		
		
		
		Map<String, String> filemap=new HashMap<String,String>();
		
			if(isS==true) {
				
				
				if(multifile.size()==1) {
				 System.out.println("multi="+multifile);
				for (int i = 0; i < multifile.size(); i++) {
					originName=multifile.get(i).getOriginalFilename();
					System.out.println(originName);
					createUUid=UUID.randomUUID().toString().replaceAll("-", "");
						System.out.println(originName.lastIndexOf("."));
						
						if(originName.lastIndexOf(".")!=-1) {
							storeName=createUUid+originName.substring(originName.lastIndexOf("."));
							File f = new File("C:/Users/Owner/git/kkst_project2/kkst_project2/src/main/webapp/resources/Resimg/"+storeName);
							try {
								multifile.get(i).transferTo(f);
							} catch (IllegalStateException e) {
								e.printStackTrace();
							} catch (IOException e) {
								e.printStackTrace();
							}	
							
							if(!multifile.get(0).getOriginalFilename().equals(fileOname[i])){
								System.out.println("식당 사진이 변했을때");
								filemap.put("origin",originName);
								filemap.put("change",storeName);
								filemap.put("res_seq", res_seq);
								filemap.put("seq", Photo_seq[0]);
								
								isS=ownerDao.updatePhoto2(filemap);
						
							}
							
							
						}else {
							System.out.println("식당 사진이 변하지 않았을때");
							filemap.put("origin", fileOname[0]);
							filemap.put("change",fileSname[0]);
							filemap.put("res_seq", res_seq);
							filemap.put("seq", Photo_seq[0]);
							
							isS=ownerDao.updatePhoto2(filemap);
						
						}
						
				}
				}

				
				
					
				
					if(multifileA.size()>1) {
					
						for (int i = 0; i < multifileA.size(); i++) {
							
						System.out.println("multiA"+multifileA);
						originName=multifileA.get(i).getOriginalFilename();
						System.out.println(originName);
						createUUid=UUID.randomUUID().toString().replaceAll("-", "");
							
						if(originName.lastIndexOf(".")!=-1) {
						System.out.println(originName.lastIndexOf("."));
							storeName=createUUid+originName.substring(originName.lastIndexOf("."));
							File f_A = new File("C:/Users/Owner/git/kkst_project2/kkst_project2/src/main/webapp/resources/Resimg/"+storeName);
							try {
								multifileA.get(i).transferTo(f_A);
							} catch (IllegalStateException e) {
								e.printStackTrace();
							} catch (IOException e) {
								e.printStackTrace();
							}	
					
					
							
							if(!multifileA.get(i).getOriginalFilename().equals(fileOname[i])) {
								System.out.println("나머지 메뉴의 사진이 변했을때");
								filemap.put("origin", originName);
								filemap.put("change",storeName);
								filemap.put("menu_seq", menu_seq[i]);
								
								isS=ownerDao.updatePhoto(filemap);
							}
							
						
						}
						
						
						else  {
							System.out.println("나머지 메뉴의 사진이 변하지 않았을때");
							filemap.put("origin", fileOname[i+1]);
							filemap.put("change",fileSname[i+1]);
							filemap.put("menu_seq", menu_seq[i]);
							
							isS=ownerDao.updatePhoto(filemap);
							
						}
						}
				}
						
						
					
				
				
				
				
			}
		
		
		
		return isS;
	}

	@Transactional
	@Override
	public boolean delOnwer(String seq) {
		
		boolean isS=false;
		isS=ownerDao.delOnwer(seq);
		isS=ownerDao.Photodel(seq);	
		isS=ownerDao.Menudel(seq);
		isS=ownerDao.Reviewdel(seq);
		isS=ownerDao.delRes(seq);
			

		
		return isS;
	}

	@Transactional
	@Override
	public boolean delOnwer2(String seq) {
		
		boolean isS=false;
	
		
		return isS;
	}



}
