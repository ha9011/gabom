package icia.project.gabom;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import icia.project.gabom.dto.Member;
import icia.project.gabom.service.SendUserId;

@Controller
public class SendUseridController {
	
	@Autowired
	SendUserId sendUserId;
	
	
	@PostMapping(value = "/senduserid") //유저 아이디 전송
	public String sendUserId(Member member,RedirectAttributes rttr){
		Map<String, String> sucessMessage=sendUserId.sendUserId(member.getMember_email());
		rttr.addFlashAttribute("message", sucessMessage);
		return "redirect:/login";
	}
	
}
