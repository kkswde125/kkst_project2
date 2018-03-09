package com.pro.kkst.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<ResDto> restList() {
		return sqlSession.selectList(namespace+"restList");
	}
	@Override
	public boolean memberDel(String[] seq) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", seq);
		int count = sqlSession.update(namespace+"memberDel", map);
		return count > 0 ? true : false;
	}
	@Override
	public List<ReviewDto> reviewReport(int seq) {
		
		String report = sqlSession.selectOne(namespace+"reviewReport");
		String[] reportArray = report.split(",");
		int count = reportArray.length;
		
		System.out.println(count);
		
		return sqlSession.selectList(namespace+"reviewReport");
	}
	

}
