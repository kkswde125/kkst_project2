package com.pro.kkst.utils;

import java.util.Properties;

import javax.mail.Session;

public class ac_MailUtils {
	
	
	
	public void mail_acccount() {
		Properties props = System.getProperties();
		
		String host = "smtp.naver.com";
		
		props.setProperty("mail.smtp.host",host);
		Session session = Session.getDefaultInstance(props);
	}
	

}
