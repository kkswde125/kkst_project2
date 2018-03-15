package com.pro.kkst.utils;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Ad_Utils {



	public void mail_acccount(String name, String email, String content) {
		Properties props = System.getProperties();

		String host="smtp.naver.com";
		String id = "kkswde125";
		String pw = "rudtnwkdwkd77";
		String port = "587";
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");

		//		Session session = Session.getDefaultInstance(props,null);



		//		  MyAuthenticator auth = new MyAuthenticator(id,pw);

		Session session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pw);
			}
		});
		MimeMessage msg= new MimeMessage(session1);

		try {
			InternetAddress addressFrom = new InternetAddress("kkswde125@naver.com");
			try {
				msg.setFrom(addressFrom);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		} catch (AddressException e) {
			e.printStackTrace();
		}


		InternetAddress addressTo;
		try {
			addressTo = new InternetAddress(email);
			try {
				msg.setRecipient(Message.RecipientType.TO, addressTo);
				msg.setSubject(name+"님의 요청");
				
				msg.setText("안녕하세요 까탈리스트입니다 "+name+"님의 식당 정보 등록이 완료 되었습니다.","utf-8");
				
				Transport.send(msg);
			} catch (MessagingException e) {
				System.out.println("메일보내기 실패");
				e.printStackTrace();
			};
		} catch (AddressException e) {
			e.printStackTrace();
			System.out.println("받는사람 실패");
		}





	}


}
