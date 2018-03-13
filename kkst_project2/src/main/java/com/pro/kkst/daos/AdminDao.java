package com.pro.kkst.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ReviewDto;
import com.pro.kkst.imp.I_AdminDao;

@Repository
public class AdminDao implements I_AdminDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	String namespace="com.pro.admin.";
	
	@Override	// 회원 관리
	public List<LoginDto> memberList() {
		return sqlSession.selectList(namespace+"memberList");
	}
	@Override	// 리뷰 관리
	public List<ReviewDto> reviewAll() {
		return sqlSession.selectList(namespace+"reviewAll");
	}
	@Override	// 식당 관리
	public List<ResDto> restList(String snum, String cnum) {
		System.out.println("Dao 진입");
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
		String[] reportArray = report.split(",");
		int count = reportArray.length;
		if(count > 5) {
			return dto;
		}else {
			return null;
		}

	}
	
	
	@Override
	public int paging() {
		int count = sqlSession.selectOne(namespace+"pageCnt");
		
		return count;	
	}
	@Override
	public boolean restChk(String[] seqs) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", seqs);
		int count = sqlSession.update(namespace+"restChk", map);
		return count > 0 ? true : false;
	}
	
	@Override
	public List<Admin_OnwerDto> a_o_list(String[] seqs){
		
		return null;
	}
	
}
