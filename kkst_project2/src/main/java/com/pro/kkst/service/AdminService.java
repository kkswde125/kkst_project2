package com.pro.kkst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.ReviewDto;
import com.pro.kkst.imp.I_AdminDao;
import com.pro.kkst.imp.I_AdminService;

@Service
public class AdminService implements I_AdminService {
	@Autowired
	private I_AdminDao adminDao;

	@Override
	public List<LoginDto> memberList() {
		return adminDao.memberList();
	}

	@Override
	public List<ReviewDto> reviewAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ResDto> restList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean memberDel(String[] seq) {
		return adminDao.memberDel(seq);
	}

	@Override
	public List<ReviewDto> reviewReport(int seq) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
