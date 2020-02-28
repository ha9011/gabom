package icia.project.gabom;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SearchUserInfoController {
	
	
	@PostMapping(value = "/searchuserid")
	public String searchUserId(Model model) {
		model.addAttribute("type", "id");
		return "searchUserInfo/searchUserInfo";
	}
	@PostMapping(value = "/searchuserpassword")
	public String searchUserPassword(Model model) {
		model.addAttribute("type", "password");
		return "searchUserInfo/searchUserInfo";
	}
	
}
