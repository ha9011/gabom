package icia.project.gabom.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

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

import icia.project.gabom.dao.TemporaryPasswordDao;
import icia.project.gabom.dto.Member;
@Service
public class SendUserPassword {
	
	@Autowired
	TemporaryPasswordDao temporaryPasswordDao;
	
	@Transactional
	public Map<String, String> sendUserpassword(Member member) {
		HashMap<String, String> message = new HashMap<String, String>();
		Random random= new Random();
		int temporaryPassword= random.nextInt(5);//4자리수로 바꿀것
		//4자리수를 bctype인코더로 바꿀것
		System.out.println("임시 비밀번호="+temporaryPassword);
		boolean result=temporaryPasswordDao.temporaryPasswordDao(member,temporaryPassword);
		if(result==true) {
			System.out.println("가따온 다음 패스워스"+member.getMember_password());
			// Mail Server 설정
			String host = "smtp.gmail.com";
			String username = "kohkss993";
			String password = "a1150311";
			int port = 465; // 포트번호

			// 보내는 사람 EMail, 제목, 내용
			String subject = "";
			String msg = "";
			// 회원가입 메일 내용
			subject = "Gabom 임시 비밀번호 발송";
			
			msg +="회원 님의 임시 비밀번호는   "+ member.getMember_password() + " 마이페이지에 수정 해주세요.";

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
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMember_email())); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
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
			
		}else {
			
		}
		return message;
	}

}
