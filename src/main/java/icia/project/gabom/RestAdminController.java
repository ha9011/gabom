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
import icia.project.gabom.dto.Adminnotices;
import icia.project.gabom.dto.Qnaboard;
import icia.project.gabom.service.AdminjudgeManagement;

@RestController
public class RestAdminController {

	@Autowired
	private IAdminDao aDao;
	@Autowired
	private AdminjudgeManagement am; // 관리자

	// house 모달창 출력 ajax
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

	// food 모달창 출력 ajax
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
		System.out.println("승인md=" + md.toString());
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
		System.out.println("거절md=" + md.toString());
		System.out.println("거절 컨트룰러");
		System.out.println("넘버" + number);
		System.out.println("타입" + type);
		String result = am.judgerefuse(number, type);

		return result;
	}

	// 게시판 디테일 모달 출력
	@GetMapping(value = "/noticesmodal", produces = "text/plain;charset=UTF-8")
	public String noticesmodal(@RequestParam("num") String num) {
		System.out.println("레스트컨트룰러 노티스모달");
		System.out.println("게시판번호 : " + num);

		boolean views = am.viewsUpdate(num); // 조회수 업데이트
		System.out.println("조회수업데이트 다녀왔니?");
		System.out.println("views=" + views);
		List<Adminnotices> nlist = aDao.getnoticesmodal(num);
		System.out.println("레스트컨트룰러 노티스모달" + nlist);

		String json = new Gson().toJson(nlist);
		System.out.println(json);

		return json;
	}

	// 글등록
	@PostMapping(value = "/noticeswrite", produces = "text/plain;charset=UTF-8")
	public String noticeswrite(@RequestParam("title") String title, @RequestParam("content") String content) {
		System.out.println("레스트컨트룰러 글작성모달");
		System.out.println("글작성 제목 : " + title);
		System.out.println("글작성 내용 : " + content);
		boolean result = aDao.getnoticeswrite(title, content);
		System.out.println("글작성 성공?" + result);

		return null;
	}

	// 전체공지사항 출력
	@PostMapping(value = "/allnotices", produces = "text/plain;charset=UTF-8")
	public String allnotices() {
		System.out.println("레스트컨트룰러 notices");

		List<Adminnotices> nlist = aDao.getadnotices(); // 전체공지 정보 출력
		System.out.println("noticeslist=" + nlist);

		String json = new Gson().toJson(nlist);
		System.out.println(json);

		return json;
	}

	// qna게시판 출력
	@PostMapping(value = "/qnaboard", produces = "text/plain;charset=UTF-8")
	public String qnaboard() {
		System.out.println("레스트컨트룰러 Qna");

		List<Qnaboard> qlist = aDao.getqnaboard(); // qna정보 출력
		System.out.println("qnalist=" + qlist);

		String json = new Gson().toJson(qlist);
		System.out.println(json);

		return json;
	}

	// qna모달 디테일 출력
	@PostMapping(value = "/qnamodal", produces = "text/plain;charset=UTF-8")
	public String qnamodal(@RequestParam("num") String num) {
		System.out.println("레스트컨트룰러 qna");
		
		List<Qnaboard> nlist = aDao.getqnamodal(num); // 선택질문,답글 정보 출력
		System.out.println("qnamodal=" + nlist);
		
		//List<Qnaboard> alist = aDao.getqnaanswer(num); //질문 답글 출력
		//System.out.println("qnaanswer="+alist);
		//String ason = new Gson().toJson(alist);
		//System.out.println(ason);
		
		String json = new Gson().toJson(nlist);
		System.out.println(json);
		
		return json;
	}
	// qna답글 작성 출력
	@PostMapping(value = "/qnaanswer", produces = "text/plain;charset=UTF-8")
	public String qnaanswer(@RequestParam("number") String number, @RequestParam("qnaanswer") String qnaanswer) {
		System.out.println("레스트컨트룰러 qna답글");
		
		System.out.println("글작성 번호 : " + number);
		System.out.println("글작성 내용 : " + qnaanswer);
		boolean result = aDao.getqnaanswer(number, qnaanswer);
		System.out.println("글작성 성공?" + result);
		
		return null;
	}

}
