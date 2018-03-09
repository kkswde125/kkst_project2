package com.pro.kkst.utils;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ac_MailUtils {
	
	
	
	public void mail_acccount() {
		Properties props = System.getProperties();
		
		String host = "smtp.naver.com";
		
		props.setProperty("mail.smtp.host",host);
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setFrom(new InternetAddress("aaa@bbb.co.kr", "김유신"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("kkswde125@naver.com", "김경수"));
			msg.setSubject("javamail test");
			msg.setContent("test", "text/plain; charset=utf-8");
			
			Transport.send(msg);
			
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}
		
		
		
	}
	

}
