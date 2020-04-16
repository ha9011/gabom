package icia.project.gabom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IJoinmemberDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.userClass.JoinmemberUploadFile;

@Service
public class JoinMemberManageMent {

	@Autowired
	private IJoinmemberDao ijDao;
	
	@Autowired 
	private JoinmemberUploadFile JULF ;
	
	ModelAndView mav ;
	
	@Transactional // 회원가입 insert, 시큐리티 롤 insert
	public ModelAndView joinmemberAction(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
		
		Member mb = new Member();
		String member_id = multi.getParameter("member_id");  //아이디 가져오고
		String member_passwordInit = multi.getParameter("member_password"); // 비밀번호 가져오고  (암호화하기)
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); //암호화 시작
		String member_password = pwdEncoder.encode(member_passwordInit); //암호화 입력
		String member_name = multi.getParameter("member_name");//이름 가져오고
		String member_phone = multi.getParameter("member_phone");//전화번호 가져오고
		String member_email = multi.getParameter("member_email"); // 이메일가져오고
		String member_birth = multi.getParameter("member_birth"); // 생일 가져오고
		String member_address = multi.getParameter("member_address"); // 주소 가져오고
		String member_hobby = multi.getParameter("member_hobby"); // 취미 가져오고
		int member_type = Integer.parseInt(multi.getParameter("member_type")); // 타입 가져오고
		//파일 존재 유무 파악 // 없으면 -값도 다르게 해야하고 파일upload도 갈 필요없음.  
		//name "profillCheck"  0이면 파일 없고, 1이면 파일있고, 이 분기로 file 사용
		String profillCheck = multi.getParameter("profillCheck"); // 파일 유무 가져오기
		String member_profile_original =null;
		String member_profile_picture = null;
		String filepath = "/upload/userprofileimage/upload/";
		long fileTimeStamp = System.currentTimeMillis();
		if(profillCheck.equals("1")) {  // 사진이 있는 경우
			member_profile_original = multi.getFile("member_profile_picture").getOriginalFilename();
			 member_profile_picture = filepath+member_id+ fileTimeStamp+"."
		               +member_profile_original.substring(member_profile_original.lastIndexOf(".")+1);
		}else { // 사진이 없는 경우
			member_profile_original = "basicprofile.jpg";
			member_profile_picture= "/upload/userprofileimage/upload/"+member_profile_original;
		}
		String member_profile_contents = multi.getParameter("member_profile_contents");  // 자기소개

		//mb DTO에 담기
		mb.setMember_id(member_id).setMember_password(member_password).setMember_name(member_name);
		mb.setMember_phone(member_phone).setMember_email(member_email).setMember_birth(member_birth);
		mb.setMember_type(member_type).setMember_profile_original(member_profile_original).setMember_profile_contents(member_profile_contents);
		mb.setMember_profile_picture(member_profile_picture);
		mb.setMember_hobby(member_hobby).setMember_address(member_address);
		
		String securityGrade = null;
		// 시큐리티에 롤을 부여하기 위해서 작성
		if(member_type==1) { //여행자일 때
			securityGrade = "ROLE_TRAVELER";
		}else { //사용자 일 때 
			securityGrade = "ROLE_SERVICER";
			
		}
		//db에 데이터 넣기
		int resultJoinMember = ijDao.insertJoinMember(mb);  
		
		
		//파일전용으로 바꾸기
		if(profillCheck.equals("1")) {
			member_profile_original = multi.getFile("member_profile_picture").getOriginalFilename();
			member_profile_picture = member_id+fileTimeStamp+"."
		               +member_profile_original.substring(member_profile_original.lastIndexOf(".")+1);
		}else {
			member_profile_original = "basicprofile.jpg";
			member_profile_picture= member_profile_original;
		}
		
		if(resultJoinMember == 1) { // 성공일 경우 파일 업로드 하고, 파일 업로드까지 성공 할 경우, 
			int resultJoinMemberSecurityGrade = ijDao.JoinMemberSecurityGrade(member_id,securityGrade); // 시큐리티 등급 
			int resultJoinMemberSecurityROLEUSER = ijDao.resultJoinMemberSecurityROLEUSER(member_id,"ROLE_USER"); // 시큐리티 등급 
			if(resultJoinMemberSecurityGrade==1 && resultJoinMemberSecurityROLEUSER==1) {
				if(profillCheck.equals("1") ) { // 파일도 있고, Security insert도 성공했을 경우
					//파일 업로드 하기
					JULF.fileUpProfilePic(multi,member_profile_picture);
				}else {
					//파일 없으니 걍 진행하기
				}
				mav.setViewName("home");  // 성공했으니 메인페이지로
			}else {// 실패 일경우
				mav.setViewName("joinmember");  //실패 
			}
		}else { // 실패 일경우
			mav.setViewName("joinmember");  //실패 
		}
		return mav;
	}

	
	
	public Member idCheck(Member mb) {
		Member result = ijDao.idCheck(mb);
		return result;
	}

	public Member emailCheck(Member mb) {
		Member result = ijDao.emailCheck(mb);
		return result;
	}

	
	
	
}
