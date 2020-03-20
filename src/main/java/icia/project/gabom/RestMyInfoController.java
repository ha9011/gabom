package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.Housereservation;
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
	
	@PostMapping(value = "/myreser", produces="text/plain;charset=utf-8")
	public String myreser(Principal pc) {
		System.out.println("마이페이지 숙박예약 가져오기 ");
		String json = MIMM.myreser(pc);
		
		return json;
	}
	
	@PostMapping(value = "/myfreser", produces="text/plain;charset=utf-8")
	public String myfreser(Principal pc) {
		System.out.println("마이페이지 내 맛집예약 가져오기 ");
		String json = MIMM.myfreser(pc);
		
		return json;
	}
	
	
	
	@PostMapping(value = "/deletehreser", produces="text/plain;charset=utf-8")
	public String deletehreser(Housereservation hr,Principal pc) {
		System.out.println("숙박예약취소  ");
		String json = MIMM.deletehreser(hr,pc);
		
		return json;
	}
	
	@PostMapping(value = "/deletefreser", produces="text/plain;charset=utf-8")
	public String deletefreser(Foodreservation fr,Principal pc) {
		System.out.println("맛집예약취소  ");
		String json = MIMM.deletefreser(fr,pc);
		
		return json;
	}
	
}
