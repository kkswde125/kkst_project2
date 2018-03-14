package com.pro.kkst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.kkst.dtos.Admin_OnwerDto;
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
		return adminDao.reviewAll();
	}

	@Override
	public List<ResDto> restList(String snum, String cnum) {
		System.out.println("service snum :"+snum);
		System.out.println("service cnum :"+cnum);
		return adminDao.restList(snum, cnum);
	}

	@Override
	public boolean memberDel(String[] seq) {
		return adminDao.memberDel(seq);
	}

	@Override
	public ReviewDto reviewReport(int seq) {
		return adminDao.reviewReport(seq);
	}
	
	@Override
	public int paging() {
		return adminDao.paging();
	}

	@Override
	public boolean restChk(int seq, Double x, Double y) {
		return adminDao.restChk(seq, x, y);
	}
	
	@Override
	public List<Admin_OnwerDto> a_o_list(String[] seqs){
		
		return null;
	}

	@Override
	public boolean restDel(String[] seq) {
		return adminDao.restDel(seq);
	}

	@Override
	public Admin_OnwerDto sendEmail(int seq) {
		return adminDao.sendEmail(seq);
	}
	

}
