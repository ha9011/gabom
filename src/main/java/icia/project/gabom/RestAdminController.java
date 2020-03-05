package icia.project.gabom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import icia.project.gabom.dao.IAdminDao;
import icia.project.gabom.dto.Adminfood;
import icia.project.gabom.dto.Adminhouse;
import icia.project.gabom.service.AdminjudgeManagement;

@RestController
public class RestAdminController {

	@Autowired
	private IAdminDao aDao;
	@Autowired
	private AdminjudgeManagement am; // 관리자
	
	//house 모달창 출력 ajax
	@GetMapping(value = "/housemodal", produces = "text/plain;charset=UTF-8")
	public String housemodal(@RequestParam("num") String num) {
		System.out.println("레스트컨트룰러 하우스");
		System.out.println("zjsdnzjxc : " + num);

		List<Adminhouse> jlist = aDao.gethousemodal(num);
		System.out.println("레스트컨트룰러 하우스" + jlist);

		String json = new Gson().toJson(jlist);
		System.out.println(json);

		return json;
	}

	//food 모달창 출력 ajax
	@GetMapping(value = "/foodmodal", produces = "text/plain;charset=UTF-8")
	public String foodmodal(@RequestParam("num") String num) {
		System.out.println("레스트컨트룰러 푸드");
		System.out.println("zjsdnzjxc : " + num);

		List<Adminfood> jlist = aDao.getfoodmodal(num);
		System.out.println("레스트컨트룰러 푸드" + jlist);

		String json = new Gson().toJson(jlist);
		System.out.println(json);

		return json;
	}

	// 심사 승인 컨트롤러
	@PostMapping(value = "/approved", produces = "text/plain;charset=UTF-8")
	public String judgeApproved(@RequestParam(value = "number", required = false) String number,
			@RequestParam(value = "type", required = false) String type, Model md) {
		System.out.println("승인md="+md.toString());
		System.out.println("승인 컨트룰러");
		System.out.println("넘버" + number);
		System.out.println("타입" + type);
		String result = am.judgeApproved(number, type);
		System.out.println("result" + result);

		return result;
	}

	// 심사 거절 컨트롤러
	@PostMapping(value = "/refuse", produces = "text/plain;charset=UTF-8")
	public String judgerefuse(@RequestParam(value = "number", required = false) String number,
			@RequestParam(value = "type", required = false) String type, Model md) {
		System.out.println("거절md="+md.toString());
		System.out.println("거절 컨트룰러");
		System.out.println("넘버" + number);
		System.out.println("타입" + type);
		String result = am.judgerefuse(number, type);
		
		return result;
	}
}
