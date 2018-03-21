package com.pro.kkst.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.kkst.dtos.AddrDto;
import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.Res_ReviewDto;
import com.pro.kkst.dtos.ReviewDto;
import com.pro.kkst.imp.I_AdminDao;

@Repository
public class AdminDao implements I_AdminDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	String namespace="com.pro.admin.";
	
	@Override	// 회원 관리
	public List<LoginDto> memberList(String snum, String cnum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("snum", snum);
		map.put("cnum", cnum);
		List<LoginDto> lists = sqlSession.selectList(namespace+"memberList", map);
		return lists;
	}
	
	@Override
	public List<ResDto> areaResList(String area){
		List<ResDto> lists = sqlSession.selectList(namespace+"areaResList", area);
		return lists;
		
	}
	
	@Override	// 리뷰 관리
	public List<Res_ReviewDto> reviewAll(String area, int[] seqs) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("area", area);
		map.put("seqs", seqs);
		List<Res_ReviewDto> lists = sqlSession.selectList(namespace+"reviewAll", map);
		return lists;
	}
	
	@Override	// 식당 관리
	public List<ResDto> restList(String snum, String cnum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("snum", snum);
		map.put("cnum", cnum);
		return sqlSession.selectList(namespace+"restList", map);
	}
	@Override
	public boolean memberDel(String[] seq) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", seq);
		int count = sqlSession.update(namespace+"memberDel", map);
		return count > 0 ? true : false;
	}
	@Override
	public ReviewDto reviewReport(int seq) {
		ReviewDto dto = sqlSession.selectOne(namespace+"reviewReport", seq);
		String report = dto.getReport();
		if(report==null) {
			return null;
		}else {
		String[] reportArray = report.split(",");
		int count = reportArray.length;
		System.out.println(count);
		if(count > 5) {
			return dto;
		}else {
			return null;
		}
		}

	}
	
	
	
	@Override
	public List<AddrDto> addressList(){
		List<AddrDto> lists = sqlSession.selectList(namespace+"addrList");
		
		return lists;
	}
	
	@Override
	public int RestPaging() {
		int count = sqlSession.selectOne(namespace+"pageCntRest");
		
		return count;	
	}
	
	@Override
	public int MemPaging() {
		int count = sqlSession.selectOne(namespace+"pageCntMem");
		
		return count;	
	}
	
	@Override
	public boolean restChk(int seq, Double x, Double y) {
		System.out.println("Dao 입장");
		System.out.println("seq="+seq);
		System.out.println("x="+x);
		System.out.println("y="+y);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("x", x);
		map.put("y", y);
		int count = sqlSession.update(namespace+"restChk", map);
		return count > 0 ? true : false;
	}
	
	@Override
	public boolean restDel(String[] seq) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", seq);
		int count = sqlSession.update(namespace+"restDel", map);
		return count > 0 ? true : false;
	}
	@Override
	public Admin_OnwerDto sendEmail(int seq) {
		Admin_OnwerDto dto = sqlSession.selectOne(namespace+"restChkEmail", seq);
		return dto;
	}
	@Override
	public Admin_OnwerDto send_Email(String email, String seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("seq", Integer.parseInt(seq));
		Admin_OnwerDto dto = sqlSession.selectOne(namespace+"sendEmail", map);
		return dto;
	}
	
	
}
