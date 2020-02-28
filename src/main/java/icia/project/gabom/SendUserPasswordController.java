package icia.project.gabom;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import icia.project.gabom.dto.Member;

@Controller
public class SendUserPasswordController {

	
	@PostMapping(value = "/senduserpassword")
	public String sendUserPassword(Member member,RedirectAttributes rttr){
		//Map<String, String> sucessMessage=sendUserId.sendUserId(member.getMember_email());
		//rttr.addFlashAttribute("message", sucessMessage);
		//return "redirect:/login";
		System.out.println("패스워드 아이디"+member.getMember_id());
		System.out.println("패스워드 이메일"+member.getMember_email());
		return null;
	}
}
