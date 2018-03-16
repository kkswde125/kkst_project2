package com.pro.kkst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.kkst.dtos.AttrJoinDto;
import com.pro.kkst.dtos.menuDto;
import com.pro.kkst.imp.I_OwnerDao;
import com.pro.kkst.imp.I_OwnerService;

@Service
public class OwnerService implements I_OwnerService {
	@Autowired
	private I_OwnerDao ownerDao;

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
	public menuDto menuSearch(String code) {
		return ownerDao.menuSearch(code);
	}

}
