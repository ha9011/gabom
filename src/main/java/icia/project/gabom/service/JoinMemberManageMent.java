package icia.project.gabom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IJoinmemberDao;
import icia.project.gabom.dto.Member;

@Service
public class JoinMemberManageMent {

	@Autowired
	private IJoinmemberDao ijDao;
		
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
		
		String member_profile_picture = multi.getFile("member_profile_picture").getOriginalFilename();
		System.out.println("member_profile_picture : "+member_profile_picture);
		
		String member_profile_contents = multi.getParameter("member_profile_contents");
		
		mb.setMember_id(member_id).setMember_password(member_password).setMember_name(member_name);
		mb.setMember_phone(member_phone).setMember_email(member_email).setMember_birth(member_birth);
		mb.setMember_type(member_type).setMember_profile_picture(member_profile_picture).setMember_profile_contents(member_profile_contents);
		
		System.out.println("mb 내용확인 : " +mb.toString());
		
		
		int result = ijDao.insertJoinMember(mb);
		
		System.out.println("insert 성공여부 reulst = " + result);
		if(result == 1) { // 성공일 경우 파일 업로드 하고, 파일 업로드까지 성공 할 경우, 
			
		}else { // 실패 일경우
			
		}
		
		return null;
	}

	
	
	
}
