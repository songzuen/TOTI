package com.yal.toti.yu.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mailSenderService")
public class MailSenderService {

	@Autowired
	private JavaMailSender sender; // 이거하나만 해도 메일센더도 다 사용가능 상속받았기에

	/*
	 * // 회원가입메일 public int send(String m_email) {
	 * 
	 * MimeMessage message = sender.createMimeMessage();
	 * 
	 * try { message.setSubject("[안내] 회원가입을  축하합니다!!", "utf-8"); String htmlMsg =
	 * "<h1>회원 가입을 축하합니다!</h1>"; message.setText(htmlMsg, "utf-8", "html");
	 * message.setFrom(new InternetAddress("ehdwns1193@gmail.com")); // 어차피 지메일은 이래도
	 * 안 됨 정책변경으로 message.addRecipient(RecipientType.TO, new
	 * InternetAddress(m_email, "합정동꿀주먹", "UTF-8")); sender.send(message); } catch
	 * (MessagingException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (UnsupportedEncodingException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }
	 * 
	 * return 1; // 정상처리되면 1 보내주자 이메일 하나니까. 물론 뒤에서 cnt 세고 할수도있는데일단 }
	 */

	//  회원가입 인증메일 메서드 추가
	public void send(String m_id, String m_email, String m_name, String m_code) {

		MimeMessage message = sender.createMimeMessage();

		try {

			message.setSubject("[안내] 회원가입을 축하합니다.", "UTF-8");
			String htmlMsg = "<h1>회원가입을 축하합니다.</h1>";

			htmlMsg += "<h3>인증을 위해 아래 링크를 클릭해주세요.</h3>";
			htmlMsg += "<h3><a href=\"http://localhost:8080/toti/member/m_codeVer?m_id=" + m_id + "&m_code=" + m_code
					+ "\" >인증하기</a></h3>";

			message.setText(htmlMsg, "UTF-8", "html");
			message.setFrom(new InternetAddress("ehdwns1193@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(m_email, m_name, "utf-8"));

			sender.send(message);

		} catch (MessagingException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
//아이디 잃어버린
	public void sendId(String m_id, String m_email, String m_name) {

		MimeMessage message = sender.createMimeMessage();

		try {
			message.setSubject("[안내] " + m_name + "님께서 요청하신 아이디정보입니ㅏ다", "UTF-8");
			String htmlMsg = "<h1>" + m_id + "</h1>";

			message.setText(htmlMsg, "UTF-8", "html");
			message.setFrom(new InternetAddress("ehdwns1193@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(m_email, m_name, "UTF-8"));

			sender.send(message);

		} catch (MessagingException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	// 비번찾기
	public void sendPw(String m_id, String m_email, String m_name, String m_pw) {

		MimeMessage message = sender.createMimeMessage();

		try {
			message.setSubject("[안내] " + m_name + "님의 임시비밀번호 발송 정보입니다.", "UTF-8");
			String htmlMsg = "<h1>" + m_pw + "</h1>";
			htmlMsg += "<h3>임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.</h3>";

			message.setText(htmlMsg, "UTF-8", "html");
			message.setFrom(new InternetAddress("ehdwns1193@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(m_email, m_name, "UTF-8"));

			sender.send(message);

		} catch (MessagingException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
