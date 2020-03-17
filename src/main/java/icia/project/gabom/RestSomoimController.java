package icia.project.gabom;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dto.Jungmoroom;
import icia.project.gabom.dto.Somoim;
import icia.project.gabom.dto.SomoimBoard;
import icia.project.gabom.dto.Somoim_photo_reple;
import icia.project.gabom.dto.Somoim_photoalbum;
import icia.project.gabom.dto.Somoimreple;
import icia.project.gabom.service.SomoimManagement;
import icia.project.gabom.userClass.SomoimAlbumfileUpload;

@RestController
@RequestMapping(value = "/somoim")
public class RestSomoimController {

	private ModelAndView mav;

	@Autowired
	private SomoimAlbumfileUpload album;
	
	@Autowired
	private SomoimManagement simm;

	@RequestMapping(value = "/jungmomoim", produces = "text/plain;charset=utf-8")
	public String jungmomoim(Principal pr, Jungmoroom jungmoroom) {
		mav = new ModelAndView();
		System.out.println("정모 만들기"); //
		System.out.println("정모에 담긴 데이터 확인 : " + jungmoroom.toString());
		String checkInsert = simm.insertSelecttMakeJunmoRoom(jungmoroom, pr.getName()); // 일단 인서트 성공
		// 일단 인서트 성공
		// 1. 공지 닮을내용부터 다 뽑기, (1)타이틀, 사진, 소개내용 (2)정모게시판 (3)회원맴버
		// (1),(3)은 지금 바로 가능
		// mav = simm.somoimRoomData(mav,roomnum, pr);
		System.out.println("jsonJungmoRooms : " + checkInsert);

		return checkInsert;
	}

	
	@RequestMapping(value = "/attendjungmo", produces = "text/plain;charset=utf-8")
	public String attendjungmo(Principal pr, @RequestParam HashMap<String, String> map, Jungmoroom jungmoroom) {
		mav = new ModelAndView();
		System.out.println("정모에 참석하기");
		String result = simm.attendjungmo(pr, map, jungmoroom);

		HashMap<String, String> resultmap = new HashMap<String, String>();
		resultmap.put("result", result);

		return new Gson().toJson(resultmap);
	}

	@RequestMapping(value = "/cancelAttendjunmo", produces = "text/plain;charset=utf-8")
	public String cancelAttendjunmo(@RequestParam HashMap<String, String> map, Principal pr, Jungmoroom jungmoroom) {
		mav = new ModelAndView();
		System.out.println("정모에 참석하기");
		String result = simm.cancelAttendjunmo(pr, map, jungmoroom);

		HashMap<String, String> resultmap = new HashMap<String, String>();
		resultmap.put("result", result);
		return new Gson().toJson(resultmap);
	}

	// 정모 참석 리스트 부르기
	@RequestMapping(value = "/jungmoattendlist", produces = "text/plain;charset=utf-8")
	public String jungmoattendlist(String JungmoNumber) {
		mav = new ModelAndView();
		System.out.println("정모리스트 부르기 // 정모방번호 : " + JungmoNumber); // 참석자를 확인할 정모의 고유번호

		// 셀렉트
		String result = simm.showAttendList(JungmoNumber);

		return result; // new Gson().toJson(resultmap);
	}

	// 소모임탈퇴
	@RequestMapping(value = "/dropoutsomoim", produces = "text/plain;charset=utf-8")
	public String dropoutsomoim(int somoimnum, String somoimmaker, Principal pr) {
		mav = new ModelAndView();
		System.out.println("정모삭제 // 소모임번호와 아이디 : " + somoimnum + " : " + pr.getName()); // 참석자를 확인할 정모의 고유번호
		System.out.println("방장 : " + somoimmaker);
		// 탈퇴하기
		String result = simm.deleteSomoim(somoimnum, somoimmaker, pr.getName());
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", result);
		return new Gson().toJson(map);
	}

	// 게시글 쓰고, 다시 가져오기
	@RequestMapping(value = "/boardwrite", produces = "text/plain;charset=utf-8")
	public String boardwrite(MultipartHttpServletRequest multi, Principal pr) {
		mav = new ModelAndView();
		System.out.println("글쓰기 // 아이디 : " + pr.getName()); // 참석자를 확인할 정모의 고유번호

		String result = simm.insertSomoimBoard(multi, pr.getName());
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", result);
		return new Gson().toJson(map);
	}

	// 게시글 자세히 보기 & 좋아요 & 댓글 긁어와야함.
	@RequestMapping(value = "/showsomoimboard", produces = "text/plain;charset=utf-8")
	public String showsomoimboard(Principal pr, SomoimBoard sb) {
		mav = new ModelAndView();
		System.out.println("해당 게시글 내용 가져오기 : " + pr.getName()); // 참석자를 확인할 정모의 고유번호
		System.out.println("게시물 번호 : " + sb.getBoard_number());

		String result = simm.selectBoardSomoim(sb.getBoard_number(), pr.getName());
		System.out.println(" B&L&R : " + result);

		return result;
		
	}

	// 라이크
	@RequestMapping(value = "/boardlike", produces = "text/plain;charset=utf-8")
	public String boardlike(Principal pr, SomoimBoard sb) {
		System.out.println("게시글에 좋아요 눌렀을 때!");
		mav = new ModelAndView();
		System.out.println("게시물 번호 : " + sb.getBoard_number());
		System.out.println("좋아요인지 취소인지 확인 : " + sb.getBoard_like());

		String result = simm.choiceBoardLike(sb, pr.getName());

		return result;
	}

	// 댓글입력 -> 댓글 다 불러오기
	@RequestMapping(value = "/inputboardreple", produces = "text/plain;charset=utf-8")
	public String inputboardreple(Principal pr, SomoimBoard sb) {
		System.out.println("댓글입력");
		mav = new ModelAndView();
		System.out.println("게시물 번호 : " + sb.getBoard_number());

		String result = simm.inputBoardReple(sb, pr.getName());

		return result;
	}

	
	
	// 페이징 버튼 눌렀을때
	@RequestMapping(value = "/replelist", produces = "text/plain;charset=utf-8")
	public String replelist(Principal pr, SomoimBoard sb) {
		System.out.println("페이징 접근 : " + sb.toString());
		// 페이지 번호에 해당하는 댓글 가져오기
		String result = simm.pagereplelist(sb);

		return result;
	}

	
	
	 //정모 클릭시 정보 보기
	   @PostMapping(value = "/jungmoinfo", produces="text/plain;charset=utf-8")
	   public String jungmoinfo(Jungmoroom jr, Principal pr) {
	      System.out.println("정모 정보 보여줘");
	      System.out.println(jr.toString());
	      
	      String json= simm.jungmoinfo(jr, pr);

	      return json;
	   }


	   //정모 삭제 
	   @PostMapping(value = "/deletejunmo", produces="text/plain;charset=utf-8")
	   public String deletejunmo(Jungmoroom jr, Principal pr) {
	      System.out.println("정모 삭제버튼 누를때");
	      System.out.println(jr.toString());
	      String json= simm.deletejunmo(jr, pr);

	      return json;
	   }
	   
	   //정모 수정
	   @PostMapping(value = "/modifyjungmomoim", produces="text/plain;charset=utf-8")
	   public String modifyjungmomoim(Jungmoroom jr, Principal pr) {
	      System.out.println("정모 업데이트 버튼 누를때");
	      System.out.println(jr.toString());
	      String json= simm.modifyjunmo(jr, pr);

	      return json;
	   }
	   
	   //게시글 삭제 
	   @PostMapping(value = "/deleteboard", produces="text/plain;charset=utf-8")
	   public String deleteboard(SomoimBoard sb, Principal pr) {
	      System.out.println("게시글 삭제버튼 누를때");
	      System.out.println(sb.toString());
	      String json= simm.deleteboard(sb, pr);

	      return json;
	   }
	
	
	   @RequestMapping(value = "/modifyboard", produces = "text/plain;charset=utf-8")
		public String modifyboard(MultipartHttpServletRequest multi, Principal pr) {
			mav = new ModelAndView();
			System.out.println("글수정 // 아이디 : " + pr.getName()); // 참석자를 확인할 정모의 고유번호
			System.out.println("글수정 // 글번호 : " + multi.getParameter("board_number")); // 참석자를 확인할 정모의 고유번호
			
			//insertSomoimBoard
			String result = simm.updateSomoimBoard(multi, pr.getName());
			Map<String, String> map = new HashMap<String, String>();
			map.put("result", result);
			return new Gson().toJson(map);
		}
	   
	   //게시글 댓글 삭제 
	   @RequestMapping(value = "/deleteboardreple", produces = "text/plain;charset=utf-8")
		public String deleteboardreple(Somoimreple sr, Principal pr) {
			mav = new ModelAndView();
			System.out.println("댓글삭제 // 아이디 : " + pr.getName()); // 참석자를 확인할 정모의 고유번호
			System.out.println("댓글삭제 // 글번호 : " + sr.toString()); 
			
			//insertSomoimBoard
			String result = simm.deleteSomoimBoardReple(sr, pr.getName());
			
			
			return result;
		}
	
	
	 //메인에서 소모임 검색!
	   @RequestMapping(value = "/searchSomoim", produces = "text/plain;charset=utf-8")
		public String searchSomoim(@RequestParam("address")String address,@RequestParam("hobby")String hobby, Principal pr) {
			mav = new ModelAndView();
			System.out.println("검색 // 아이디 : " + pr.getName()); // 참석자를 확인할 정모의 고유번호
			System.out.println("검색 키워드 // 글번호 : " + address +" : " + hobby); 
			System.out.println("검색키워드 주소 길이: " +address.length()); // 아무것도 검색 안할때는 길이가 0이다
			
			String result = simm.searchSomoim(pr,address, hobby);		
			System.out.println("소모임 검색 결과 : " + result);
			return result;
		}
	   
	 //소모임 가입 신청!
	   @RequestMapping(value = "/joinsomoim", produces = "text/plain;charset=utf-8")
		public String joinsomoim(@RequestParam("somoim_number")int somoim_number, Principal pr) {
			System.out.println("검색 // 아이디 : " + pr.getName()); // 참석자를 확인할 정모의 고유번호
			System.out.println("검색 키워드 // 글번호 : " + somoim_number ); 
			
			String result = simm.joinsomoim(pr,somoim_number);		
			
			return null;
		}
	   
	 //소모임 관리하기 (승인/거절 강퇴 
	   @RequestMapping(value = "/managementSomoim", produces = "text/plain;charset=utf-8")
		public String managementSomoim(@RequestParam("somoim_number")int somoim_number, Principal pr) {
			System.out.println(" // 아이디 : " + pr.getName()); // 참석자를 확인할 정모의 고유번호
			System.out.println("소모임관리 키워드 // 글번호 : " + somoim_number ); 
			String result = simm.managementSomoim(pr,somoim_number);		
			
			return result;
		}
	
	 //채팅 db insert
	   @RequestMapping(value = "/insertchatting", produces = "text/plain;charset=utf-8")
		public String insertchatting(
				@RequestParam("id")String id,
				@RequestParam("msg")String msg,
				@RequestParam("somoimNumber")int somoimNumber,
				Principal pr
			) {
		   
		    System.out.println("채팅 db 컨트롤러 접근");
		    System.out.println(" // id : " + id); 
		    System.out.println(" // msg : " + msg);
		    System.out.println(" // somoimNumber : " + somoimNumber);
		    
			String result = simm.insertchatting(id,msg,somoimNumber);		
			
			return null;
		}
	   
	   
	   //채팅 infinity db select
	   @RequestMapping(value = "/selectDateChatting", produces = "text/plain;charset=utf-8")
		public String selectDateChatting(
				@RequestParam("date")String date,
				@RequestParam("somoimNumber")int somoimNumber,
				Principal pr
			) {
		   
		    System.out.println("채팅 db 컨트롤러 접근");
		    System.out.println(" // date : " + date);
		    System.out.println(" // somoimNumber : " + somoimNumber);
		    
			String result = simm.selectDateChatting(date,somoimNumber);		
			
			return result;
		}
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

//--------------------------------------------------------------------------------이예상 
	
	// 사진 업로드 

	@PostMapping(value = "/somoimalbum", produces="text/plain;charset=utf-8")
	public String somoimalbum(MultipartHttpServletRequest multi) {
		System.out.println("소모임 사진 저장하자");
		System.out.println(multi.getParameter("somo_number"));
		
		int somo_number =Integer.parseInt( multi.getParameter("somo_number"));
		
		List<MultipartFile> files=multi.getFiles("somoimimg");
		System.out.println(files.size());
		System.out.println("files="+files.get(0).getOriginalFilename());
		
		boolean json = album.somoalbum(multi,somo_number);
		
		String json2 = simm.somopiclist(somo_number);
		
		return json2;
	}
	
	// 사진첩 메뉴 누를 때 
	   @PostMapping(value = "/showsomoimalbum", produces="text/plain;charset=utf-8")
	   public String showsomoimalbum(Somoim_photoalbum spa, Principal pr) {
	      System.out.println("소모임 사진 불러오자");
	      
	      int somo_number =spa.getSomoim_number();
	      
	      String json2 = simm.somopiclist(somo_number);
	      System.out.println("사진 불러 오기  : " + json2);
	      return json2;
	   }
	   
	   //사진관련 정보 가져오기 댓글, 좋아요
	   @PostMapping(value = "/showimginfo", produces="text/plain;charset=utf-8")
	   public String showimginfo(@RequestParam("num")String num, Principal pr) {
	      System.out.println("사진 관련 보여줘 ");
	      System.out.println(num);
	      
	      String json= simm.showimginfo(num);

	      return json;
	   }
	   

	   //사진에 댓글 삭제
	   @PostMapping(value = "/deletereple", produces="text/plain;charset=utf-8")
	   public String deletereple(Somoim_photo_reple spreple, Principal pr) {
	      System.out.println("댓글 번호  ");
	      System.out.println(spreple);
	    
		  String json= simm.deletereple(spreple);

	      return json;
	   }
	   
	   
	 //사진에 댓글 입력
	   @PostMapping(value = "/insertpicreple", produces="text/plain;charset=utf-8")
	   public String insertpicreple(Somoim_photo_reple spreple, Principal pr) {
	      System.out.println("댓글입력하러 가자 ");
	      System.out.println("사진번호"+spreple.getPhoto_number());
	      System.out.println("댓글 내용"+spreple.getReply_content());
	      System.out.println("작성자"+spreple.getReply_id());
	      System.out.println("소모임번호"+spreple.getSomoim_number());
	      
		  String json= simm.insertpicreple(spreple);

	      return json;
	   }
	   
	   
	 //사진에 댓글 입력
	   @PostMapping(value = "/modifypicreple", produces="text/plain;charset=utf-8")
	   public String modifypicreple(Somoim_photo_reple spreple, Principal pr) {
	      System.out.println("댓글수정하러 가자 ");
	      System.out.println("댓글 내용"+spreple.getReply_content());
	      System.out.println("댓글 내용"+spreple.getReply_number());
	      
		  String json= simm.modifypicreple(spreple);

	      return json;
	   }	   
	
}
