package icia.project.gabom.service;

import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import icia.project.gabom.dao.SearchIdDao;
import icia.project.gabom.dto.Member;

@Service
public class SendUserId {

	@Autowired
	SearchIdDao searchIdDao;

	@Transactional
	public HashMap<String, String> sendUserId(String member_email) {

		Member member = searchIdDao.searchId(member_email);
		HashMap<String, String> message = new HashMap<String, String>();
		if (member == null) {
			message.put("message", "이메일 오류");
			return message;
		}
		// Mail Server 설정
		String host = "smtp.gmail.com";
		String username = "kohkss993";
		String password = "a1150311";
		int port = 465; // 포트번호

		// 보내는 사람 EMail, 제목, 내용
		String subject = "";
		String msg = "";
		// 회원가입 메일 내용
		subject = "Gabom 문의하신 회원 정보 입니다.";
		
		msg +="문의하신 회원 님의 정보는   "+ member.getMember_id() + "  입니다.";

		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // for debug
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
		try {
			mimeMessage.setFrom(new InternetAddress("kohkss993@gamil.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member_email)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
			mimeMessage.setSubject(subject); //제목셋팅 
			mimeMessage.setText(msg); //내용셋팅 
			Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.

		message.put("message", "요청하신 이메일로 전송 되었습니다.");

		return message;
	}

}
