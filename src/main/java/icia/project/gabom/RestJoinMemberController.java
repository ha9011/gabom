package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.dto.Member;
import icia.project.gabom.service.JoinMemberManageMent;

@RestController
@RequestMapping(value = "/join")
public class RestJoinMemberController {

	@Autowired
	private JoinMemberManageMent JMMM;
	
	@RequestMapping(value = "/userid", produces="text/plain;charset=utf-8")
	public String idCheck(Member mb){
		System.out.println("ajax 접근");
		System.out.println("id="+mb.getMember_id());
		
		Member resultMember_id = JMMM.idCheck(mb);
		String result = null;
		if( resultMember_id == null) {
			result="0";  //없을 경우
		}else {
			result="1"; // 있을 경우
		}
		return result;
		
	}
	
}
