package com.pro.kkst.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pro.kkst.imp.I_OwnerDao;

@Repository
public class OwnerDao implements I_OwnerDao {
	@Autowired
	SqlSessionTemplate sqlSessoin;
	String namespace="com.pro.owner.";

}
