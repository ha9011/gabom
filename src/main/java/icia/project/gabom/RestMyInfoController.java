package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.service.MyInfoManagement;

@RestController
@RequestMapping(value = "/myinfo")
public class RestMyInfoController {

	@Autowired // service 부르기
	private MyInfoManagement MIMM ; 
	
	ModelAndView mav ;
	
	@PostMapping(value = "/chargemoney", produces="text/plain;charset=utf-8")
	public String chargemoney(String ChargeMoney, Principal pc) {
		System.out.println("ChargeMoney : " +  ChargeMoney);
		
		String result = MIMM.restChargeMoney(ChargeMoney, pc.getName());
		
		return result;
	}


}
