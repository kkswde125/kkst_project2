package com.pro.kkst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.kkst.dtos.AddrDto;
import com.pro.kkst.dtos.Admin_OnwerDto;
import com.pro.kkst.dtos.LoginDto;
import com.pro.kkst.dtos.ResDto;
import com.pro.kkst.dtos.Res_ReviewDto;
import com.pro.kkst.dtos.ReviewDto;
import com.pro.kkst.imp.I_AdminDao;
import com.pro.kkst.imp.I_AdminService;

@Service
public class AdminService implements I_AdminService {
	@Autowired
	private I_AdminDao adminDao;

	@Override
	public List<LoginDto> memberList(String snum, String cnum) {
		return adminDao.memberList(snum, cnum);
	}

	@Override
	public List<Res_ReviewDto> reviewAll(String area, int[] seqs) {
		return adminDao.reviewAll(area, seqs);
	}
	
	@Override
	public List<AddrDto> addressList(){
		return adminDao.addressList();
	}

	@Override
	public List<ResDto> restList(String snum, String cnum) {
		return adminDao.restList(snum, cnum);
	}
	
	@Override
	public boolean reviewDel(String[] seq) {
		return adminDao.reviewDel(seq);
	}

	@Override
	public boolean memberDel(String[] seq) {
		return adminDao.memberDel(seq);
	}

	@Override
	public List<Res_ReviewDto> reviewReport(String area, int[] seqs) {
		return adminDao.reviewReport(area, seqs);
	}
	
	@Override
	public int RestPaging() {
		return adminDao.RestPaging();
	}

	@Override
	public boolean restChk(int seq, Double x, Double y) {
		return adminDao.restChk(seq, x, y);
	}
	
	@Override
	public boolean restDel(String[] seq) {
		return adminDao.restDel(seq);
	}

	@Override
	public Admin_OnwerDto sendEmail(int seq) {
		return adminDao.sendEmail(seq);
	}

	@Override
	public int MemPaging() {
		return adminDao.MemPaging();
	}

	@Override
	public Admin_OnwerDto send_Email(String email, String seq) {
		return adminDao.send_Email(email, seq);
	}
	
	@Override
	public List<ResDto> areaResList(String area){
		return adminDao.areaResList(area);
	}
	

}
