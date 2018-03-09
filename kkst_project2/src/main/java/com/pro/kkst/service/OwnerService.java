package com.pro.kkst.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.kkst.imp.I_OwnerDao;
import com.pro.kkst.imp.I_OwnerService;

@Service
public class OwnerService implements I_OwnerService {
	@Autowired
	private I_OwnerDao ownerDao;

}
