package icia.project.gabom;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import icia.project.gabom.dto.Member;
import icia.project.gabom.service.SendUserPassword;

@Controller
public class SendUserPasswordController {
	@Autowired
	SendUserPassword sendUserPassword;
	
	
	
	@PostMapping(value = "/senduserpassword")
	public String sendUserPassword(Member member,RedirectAttributes rttr){
		Map<String, String> sucessMessage=sendUserPassword.sendUserpassword(member);
		rttr.addFlashAttribute("message", sucessMessage);
		return "redirect:/login";
	}
	
	
	
}
