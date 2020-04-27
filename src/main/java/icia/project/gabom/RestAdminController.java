package icia.project.gabom;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import icia.project.gabom.dao.IAdminDao;
import icia.project.gabom.dto.AdminSns;
import icia.project.gabom.dto.Adminfood;
import icia.project.gabom.dto.Adminhouse;
import icia.project.gabom.dto.Adminnotices;
import icia.project.gabom.dto.Qnaboard;
import icia.project.gabom.service.AdminjudgeManagement;
import icia.project.gabom.service.SnsCommentDelete;
import icia.project.gabom.service.SnsPostDelete;

@RestController
public class RestAdminController {

	@Autowired
	private IAdminDao aDao;
	
	@Autowired
	private AdminjudgeManagement am; // 관리자
	
	@Autowired
	SnsPostDelete snsDel;
	
	@Autowired
	SnsCommentDelete snsCommentDelete;
	

	// house 상세페이지 출력
	@GetMapping(value = "/housemodal", produces = "text/plain;charset=UTF-8")
	public String housemodal(@RequestParam("num") String num) {
		List<Adminhouse> jlist = aDao.gethousemodal(num);

		String json = new Gson().toJson(jlist);

		return json;
	}

	// food 상세페이지 출력
	@GetMapping(value = "/foodmodal", produces = "text/plain;charset=UTF-8")
	public String foodmodal(@RequestParam("num") String num) {
		List<Adminfood> jlist = aDao.getfoodmodal(num);

		String json = new Gson().toJson(jlist);

		return json;
	}
	// 서비스업체 등록심사 출력
	@PostMapping(value = "/judgelist", produces = "text/plain;charset=UTF-8")
	public String judgelist() {
		Map<String, Object> list = new HashMap<String, Object>();
		List<Adminhouse> hlist = aDao.getHouseList(); // house 등록타입0번인 리스트 담기
		List<Adminfood> flist = aDao.getFoodList(); // food 등록타입 0번인 리스트 담기
		
		list.put("hlist", hlist);
		list.put("flist", flist);

		String json = new Gson().toJson(list);
		
		return json;
		}
	
	// 심사 승인 컨트롤러
	@PostMapping(value = "/approved", produces = "text/plain;charset=UTF-8")
	public String judgeApproved (
			@RequestParam(value = "number", required = false) String number,
			@RequestParam(value = "type", required = false) String type, 
			Model md) {
		
		String result = am.judgeApproved(number, type);
		
		return result;
	}

	// 심사 거절 컨트롤러
	@PostMapping(value = "/refuse", produces = "text/plain;charset=UTF-8")
	public String judgerefuse (
			@RequestParam(value = "number", required = false) String number,
			@RequestParam(value = "type", required = false) String type, 
			Model md) {
		
		String result = am.judgerefuse(number, type);

		return result;
	}

	// 공지사항 디테일  출력
	@GetMapping(value = "/noticesmodal", produces = "text/plain;charset=UTF-8")
	public String noticesmodal(@RequestParam("num") String num) {
		boolean views = am.viewsUpdate(num); // 조회수 업데이트
		List<Adminnotices> nlist = aDao.getnoticesmodal(num);
		SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Adminnotices admin : nlist) {
			String wDate=format1.format(admin.getAll_notices_date());
			admin.setResultDate(wDate);
		}
		String json = new Gson().toJson(nlist);

		return json;
	}

	// 글등록
	@PostMapping(value = "/noticeswrite", produces = "text/plain;charset=UTF-8")
	public String noticeswrite(@RequestParam("title") String title, @RequestParam("content") String content) {
		boolean result = aDao.getnoticeswrite(title, content);

		List<Adminnotices> nlist = aDao.getadnotices(); // 전체공지 정보 출력
		
		SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Adminnotices admin : nlist) {
			String wDate=format1.format(admin.getAll_notices_date());
			admin.setResultDate(wDate);
		}

		String json = new Gson().toJson(nlist);

		return json;
	}

	// 전체공지사항 출력
	@PostMapping(value = "/allnotices", produces = "text/plain;charset=UTF-8")
	public String allnotices() {
		List<Adminnotices> nlist = aDao.getadnotices(); // 전체공지 정보 출력
		SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Adminnotices admin : nlist) {
			String wDate=format1.format(admin.getAll_notices_date());
			admin.setResultDate(wDate);
		}
		String json = new Gson().toJson(nlist);

		return json;
	}

	// 공지사항 삭제
	@PostMapping(value = "/noticedelete", produces = "text/plain;charset=UTF-8")
	public String noticedelete(@RequestParam("num") String num) {
		boolean result = aDao.getnoticedelete(num);
		List<Adminnotices> nlist = aDao.getadnotices(); // 전체공지 정보 출력
		SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Adminnotices admin : nlist) {
			String wDate=format1.format(admin.getAll_notices_date());
			admin.setResultDate(wDate);
		}
		String json = new Gson().toJson(nlist);
		return json;
	}

	// qna게시판 출력
	@PostMapping(value = "/qnaboard", produces = "text/plain;charset=UTF-8")
	public String qnaboard() {
		List<Qnaboard> qlist = aDao.getqnaboard(); // qna정보 출력
		SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Qnaboard qna : qlist) {
			String wDate=format1.format(qna.getQna_date());
			qna.setResultDate(wDate);
		}
		String json = new Gson().toJson(qlist);

		return json;
	}

	// QNA상세 출력
	@PostMapping(value = "/qnamodal", produces = "text/plain;charset=UTF-8")
	public String qnamodal(@RequestParam("num") String num) {
		Map<String, Object> list = new HashMap<String, Object>();

		List<Qnaboard> nlist = aDao.getqnamodal(num); // 선택질문 정보 출력

		List<Qnaboard> alist = aDao.getanswermodal(num); // 선택질문 답글 출력
		
		SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Qnaboard qna : nlist) {
			String wDate=format1.format(qna.getQna_date());
			qna.setResultDate(wDate);
		}

		list.put("nlist", nlist);
		list.put("alist", alist);

		String json = new Gson().toJson(list);

		return json;
	}

	// qna답글 작성 출력
	@PostMapping(value = "/qnaanswer", produces = "text/plain;charset=UTF-8")
	public String qnaanswer(@RequestParam("num") String num, @RequestParam("qnaanswer") String qnaanswer) {
		System.out.println("레스트컨트룰러 qna답글");

		System.out.println("글작성 번호 : " + num);
		System.out.println("댓글작성 내용 : " + qnaanswer);
		boolean result = aDao.getqnaanswer(num, qnaanswer);
		System.out.println("댓글작성 성공?" + result);
		List<Qnaboard> nlist = aDao.getqnaanswermodal(num); // 선택질문,답글 정보 출력
		System.out.println("댓글작성후 dao=" + nlist);
		String json = new Gson().toJson(nlist);
		System.out.println("댓글작성후 dao=" + json);

		return json;
	}

	// sns게시글 신고 출력
	@PostMapping(value = "/snspostsreport", produces = "text/plain;charset=UTF-8")
	public String snspostsreport() {
		List<AdminSns> slist = aDao.getsnspostsreport(); // sns게시글 신고 출력
		String json = new Gson().toJson(slist);

		return json;
	}

	// sns댓글 신고 출력
	@PostMapping(value = "/snscommentreport", produces = "text/plain;charset=UTF-8")
	public String snscommentreport() {
		List<AdminSns> slist = aDao.getsnscommentreport(); // sns댓글 신고 출력
		String json = new Gson().toJson(slist);

		return json;
	}
	
	//sns게시글 신고 삭제
	@PostMapping(value = "/snspostsdelete", produces = "text/plain;charset=UTF-8")
	public String snspostsdelete(@RequestParam("num")int num,Principal principal) {
		String json=snsDel.delete(num, principal);
		return json;
	}
	
	//sns댓글 신고 삭제
	@PostMapping(value = "/snscommentdelete", produces = "text/plain;charset=UTF-8")
	public String snscommentdelete(@RequestParam("num")int num) {
		String json=snsCommentDelete.delete(num, 0);
		
		return json;
	}
	
	//여행플랜 등록심사
	@PostMapping(value = "/tripshareplanlist", produces = "text/plain;charset=UTF-8")
	public String tripshareplanlist() {
		String json=am.selectTripSharePlanList();
		
		return json;
	}

	//관리자 여행 승인 거절
	@PostMapping(value = "/judgeplanshare",produces = "application/json;charset=utf-8")
	public String judgeplanshare(@RequestParam("judge")String judge,
								@RequestParam("tnum")int tnum ){
		String json=am.judgeplanshare(judge,tnum);
		
		return json;
	}
	
	
}
