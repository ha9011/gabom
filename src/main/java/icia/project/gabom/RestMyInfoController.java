package icia.project.gabom;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sun.mail.handlers.multipart_mixed;

import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.House_review;
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
	
	@PostMapping(value = "/myhreview", produces="text/plain;charset=utf-8")
	public String myhreview(Principal pc) {
		System.out.println("리뷰 목록");
		String json = MIMM.myhreview(pc);
		
		return json;
	}
	
	
	@PostMapping(value = "/inserthreview", produces="text/plain;charset=utf-8")
	public String inserthreview(Principal pc,MultipartHttpServletRequest multi) {
		System.out.println("집 리뷰등록");
		//System.out.println("사진"+multi.getFile("house_review_orifile").getOriginalFilename());
		
		List<MultipartFile> files=multi.getFiles("house_review_orifile");
		System.out.println("files="+files.get(0).getOriginalFilename());
		
		String json = MIMM.inserthreview(pc,multi);
		
		return json;
	}
	
	@PostMapping(value = "/showhreview", produces="text/plain;charset=utf-8")
	public String showhreview(@RequestParam("house_review_number")int house_review_number) {
		System.out.println("집 리뷰 상세보기 ");
		
		System.out.println("리뷰번호"+house_review_number);
		
		String json = MIMM.showhreview(house_review_number);
		
		return json;
	}
	
	
	
	@PostMapping(value = "/insertfreview", produces="text/plain;charset=utf-8")
	public String insertfreview(Principal pc,MultipartHttpServletRequest multi) {
		System.out.println("맛집 리뷰등록");
		//System.out.println("사진"+multi.getFile("house_review_orifile").getOriginalFilename());
		
		List<MultipartFile> files=multi.getFiles("food_review_orifile");
		System.out.println("files="+files.get(0).getOriginalFilename());
		
		String json = MIMM.insertfreview(pc,multi);
		
		return json;
	}
	
	//-----------------------------------위에는 리뷰랑 예약 리스트 -----------------------------------------------
	
	@PostMapping(value = "/writelist", produces="text/plain;charset=utf-8")
	public String writelist(Principal pc) {
		System.out.println("마이페이지 내가 작성한 게시물 가져오기 ");
		String json = MIMM.writelist(pc);
		
		return json;
	}
	
	
	
	@PostMapping(value = "/showcontent", produces="text/plain;charset=utf-8")
	public String showcontent(Principal pc, int qna_number) {
		System.out.println("마이페이지 내가 작성한 게시물  상세보기  ");
		System.out.println(qna_number);
		String json = MIMM.showcontent(qna_number);
		
		return json;
	}

	@PostMapping(value = "/delqna", produces="text/plain;charset=utf-8")
	public String delqna(Principal pc, int qna_number) {
		System.out.println("마이페이지 내가 작성한 게시물 삭제   ");
		System.out.println(qna_number);
		String json = MIMM.delqna(qna_number,pc);
		
		return json;
	}
	
	
	@PostMapping(value = "/showcontentsomo", produces="text/plain;charset=utf-8")
	public String showcontentsomo(Principal pc, int board_number) {
		System.out.println("마이페이지 내가 작성한 게시물  상세보기  ");
		System.out.println(board_number);
		String json = MIMM.showcontentsomo(board_number);
		
		return json;
	}
	

	@PostMapping(value = "/delsomo", produces="text/plain;charset=utf-8")
	public String delsomo(Principal pc, int board_number) {
		System.out.println("마이페이지 내가 작성한 게시물 삭제   ");
		System.out.println(board_number);
		String json = MIMM.delsomo(board_number,pc);
		
		return json;
	}
}
