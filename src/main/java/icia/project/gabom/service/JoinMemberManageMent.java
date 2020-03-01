package icia.project.gabom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
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
	
	public ModelAndView joinmemberAction(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
		
		Member mb = new Member();
		String member_id = multi.getParameter("member_id");  //아이디 가져오고
		
		String member_passwordInit = multi.getParameter("member_password"); // 비밀번호 가져오고  (암호화하기)
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); //암호화 시작
		String member_password = pwdEncoder.encode(member_passwordInit); //암호화 입력
		System.out.println("암호화 : " + member_password);
		String member_name = multi.getParameter("member_name");//이름 가져오고
		String member_phone = multi.getParameter("member_phone");//전화번호 가져오고
		String member_email = multi.getParameter("member_email"); // 이메일가져오고
		String member_birth = multi.getParameter("member_birth"); // 생일 가져오고
		int member_type = Integer.parseInt(multi.getParameter("member_type")); // 타입 가져오고
		
		//파일 존재 유무 파악 // 없으면 -값도 다르게 해야하고 파일upload도 갈 필요없음.  //name "profillCheck"  0이면 파일 없고, 1이면 파일있고, 이 분기로 file 사용
		
		String profillCheck = multi.getParameter("profillCheck"); // 파일 유무 가져오기
		System.out.println("파일 유무 확인 : " + profillCheck);
		
		String member_profile_original =null;
		String member_profile_picture = null;
		if(profillCheck.equals("1")) {
			System.out.println("파일있음");
			member_profile_original = multi.getFile("member_profile_picture").getOriginalFilename();
			System.out.println("member_profile_original : "+member_profile_original); //member_profile_picture : loginpic.jpg
			
			 member_profile_picture=member_id+System.currentTimeMillis()+"."
		               +member_profile_original.substring(member_profile_original.lastIndexOf(".")+1);
		
		
		}else {
			System.out.println("파일없음");
			member_profile_original = "bagicProfile.jpg";
			System.out.println("member_profile_original : "+member_profile_original); //member_profile_picture : loginpic.jpg
			member_profile_picture=member_profile_original;
		
		}
		
		
		String member_profile_contents = multi.getParameter("member_profile_contents");  // 자기소개

		
		
		System.out.println("sysfile : " + member_profile_picture);
		
		//mb DTO에 담기
		mb.setMember_id(member_id).setMember_password(member_password).setMember_name(member_name);
		mb.setMember_phone(member_phone).setMember_email(member_email).setMember_birth(member_birth);
		mb.setMember_type(member_type).setMember_profile_original(member_profile_original).setMember_profile_contents(member_profile_contents);
		mb.setMember_profile_picture(member_profile_picture);
		
		System.out.println("mb 내용확인 : " +mb.toString());
		
		
		String securityGrade = null;
		if(member_type==1) { //여행자일 때
			securityGrade = "TRAVELER";
		}else { //사용자 일 때 
			securityGrade = "SERVICER";
			
		}
		
		
		//db에 데이터 넣기
		int resultJoinMember = ijDao.insertJoinMember(mb);  
		
		System.out.println("insert 성공여부 reulst = " + resultJoinMember);
		if(resultJoinMember == 1) { // 성공일 경우 파일 업로드 하고, 파일 업로드까지 성공 할 경우, 
			int resultJoinMemberSecurityGrade = ijDao.JoinMemberSecurityGrade(member_id,securityGrade); // 시큐리티 등급 
			int resultJoinMemberSecurityROLEUSER = ijDao.resultJoinMemberSecurityROLEUSER(member_id,"ROLE_USER"); // 시큐리티 등급 
			
			if(resultJoinMemberSecurityGrade==1 && resultJoinMemberSecurityROLEUSER==1) {
				if(profillCheck.equals("1") ) { // 파일도 있고, Security insert도 성공했을 경우
					//파일 업로드 하기
					System.out.println("파일업로드 도착함??");
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
		System.out.println("result : " + result);
		if( result == null) {
			System.out.println("아이디가 존재 하지 않습니다.");
		}else {
			System.out.println("아이디가 존재 합니다.");
		}
		
		return result;
	}

	public Member emailCheck(Member mb) {
		Member result = ijDao.emailCheck(mb);
		System.out.println("result : " + result);
		if( result == null) {
			System.out.println("이메일이 존재 하지 않습니다.");
		}else {
			System.out.println("이메일이 존재 합니다.");
		}
		
		return result;
	}

	
	
	
}
