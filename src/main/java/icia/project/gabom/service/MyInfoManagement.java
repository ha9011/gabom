package icia.project.gabom.service;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IMyInfoDao;
import icia.project.gabom.dto.Food_reple;
import icia.project.gabom.dto.Food_review;
import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.House;
import icia.project.gabom.dto.House_reple;
import icia.project.gabom.dto.House_review;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.Qnaboard;
import icia.project.gabom.dto.SnsCommentDto;
import icia.project.gabom.dto.Snsposts;
import icia.project.gabom.dto.SomoimBoard;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.userClass.Food_reviewfile;
import icia.project.gabom.userClass.House_reviewFlie;

@Service
public class MyInfoManagement {
	
	private Member mb ;
	private ModelAndView mav;
	@Autowired
	private IMyInfoDao minfDao;
	
	@Autowired
	private House_reviewFlie hrf;
	
	@Autowired
	private Food_reviewfile frf;

	public ModelAndView showMyInfo(Principal principal) {
		mav = new ModelAndView();
		
		mb = minfDao.selectshowMyInfo(principal.getName());
		System.out.println("mb데이터 : " + mb.toString());
		// TODO Auto-generated method stub
		mav.addObject("myinfodata", mb);
		mav.setViewName("myinfo");
		return mav;
	}
	
	
	//용돈 충전 AJAX
	public String restChargeMoney(String chargeMoney, String name) {
		
		mb = new Member();
		int result = minfDao.restChargeMoney(chargeMoney, name);
		System.out.println("result : " + result);
		if(result == 1 ) {
			mb = minfDao.selectshowMyInfo(name);
		}
		
		Gson gs = new Gson();
		String json = gs.toJson(mb);
		System.out.println( "json  : " + json );
		
		return json;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//=================================================================================================== 이예상
	public String myreser(Principal pc) {
		String json =null;
		System.out.println("여행 목록 가져와라");
		
		String member_guestid = pc.getName();
		
		List<Housereservation> Hlist = minfDao.getmyreser(member_guestid);
		
		json = new Gson().toJson(Hlist);
		System.out.println(json);
		return json;
	}

	
	public String myfreser(Principal pc) {
		String json =null;
		System.out.println("여행 목록 가져와라");
		
		String member_guestid = pc.getName();
		
		List<Foodreservation> flist = minfDao.getmyfreser(member_guestid);
		
		json = new Gson().toJson(flist);
		System.out.println(json);
		return json;
	}


	public String deletehreser(Housereservation hr,Principal pc ) {
		String json =null;
		
		int reservation_number= hr.getReservation_number();
		String member_guestid = pc.getName();
		
		minfDao.deletehreser(reservation_number);//삭제하고 
		
		List<Housereservation> Hlist = minfDao.getmyreser(member_guestid);//다시 불러옴 
		
		json = new Gson().toJson(Hlist);
		System.out.println(json);
		
		return json;
	}


	public String deletefreser(Foodreservation fr, Principal pc) {
		String json =null;
		
		int foodreservation_number= fr.getFoodreservation_number();
		String member_guestid = pc.getName();
		
		minfDao.deletefreser(foodreservation_number);//삭제하고 
		
		List<Foodreservation> flist = minfDao.getmyfreser(member_guestid);//다시 불러옴 
		
		json = new Gson().toJson(flist);
		System.out.println(json);
		
		return json;
	}


	public String myhreview(Principal pc) {
		String json =null;
		
		String member_guestid = pc.getName();
		
		Map<String,Object> list = new HashMap<String, Object>();
		
		List<Housereservation> hlist = minfDao.getreviewmyreser(member_guestid);//작성할 리뷰
		List<Foodreservation> flist = minfDao.getreviewmyfreser(member_guestid);//작성할 리뷰
		
		List<House_review> hrel = minfDao.getmyhrevie(member_guestid);//작성한 리뷰
		List<Food_review> frel = minfDao.getmyfrevie(member_guestid);//작성한 리뷰
		
		list.put("hlist", hlist);
		list.put("flist", flist);
		list.put("hrel", hrel);
		list.put("frel", frel);
		//작성한 리뷰 목록 같이 불러오기 
		
		json = new Gson().toJson(list);
		return json;
	}


	public String inserthreview(Principal pc, MultipartHttpServletRequest multi) {//집 리뷰등록 
		String json =null;
		
		int house_number = Integer.parseInt(multi.getParameter("house_number"));
		String member_guestid = pc.getName();
		String house_review_content = multi.getParameter("house_review_content");
		int reservation_number=Integer.parseInt(multi.getParameter("reservation_number"));
		
		System.out.println(member_guestid);
		System.out.println(house_number);
		System.out.println(house_review_content);
		
		List<MultipartFile> house_review_img = multi.getFiles("house_review_orifile");//사진목록 
		
		House_review hrv =new House_review();
		
		hrv.setHouse_number(house_number).setHouse_review_content(house_review_content).setMember_guestid(member_guestid);
		hrv.setReservation_number(reservation_number);
		
		minfDao.inserthreview(hrv);//라뷰 내용넣고 
		minfDao.updatereser(reservation_number);//예약상태를 리뷰 작성한걸로 바꾸고 
		
		System.out.println("currval값="+hrv.getHouse_review_number()); 
		boolean f1= false;
		
		//파일 따로 없로드
		if(true) { //한번더 파일 있는지 체크 업로드
			f1=hrf.fileUpreview(multi,hrv.getHouse_review_number());
			
				}
		
		Map<String,Object> list = new HashMap<String, Object>();//map에 담아서 두개 리턴 
		List<House_review> hrel = minfDao.getmyhrevie(member_guestid);//작성한 리뷰 다시 불러오고 
		List<Housereservation> hlist = minfDao.getreviewmyreser(member_guestid);//작성할 리뷰
		
		list.put("hrel", hrel);
		list.put("hlist", hlist);
		
		
		json = new Gson().toJson(list);
		
		System.out.println(json);
		return json;
	}


	public String showhreview(int house_review_number) {
		String json =null;
		System.out.println(house_review_number);
		
		List<House_review> detail = minfDao.showhreview(house_review_number);
		
		json = new Gson().toJson(detail);
		return json;
	}
	
	public String insertfreview(Principal pc, MultipartHttpServletRequest multi) {// 맛집 리뷰등록
		String json =null;
		
		int food_number = Integer.parseInt(multi.getParameter("food_number"));
		String member_guestid = pc.getName();
		String food_review_content = multi.getParameter("food_review_content");
		int foodreservation_number=Integer.parseInt(multi.getParameter("freservation_number"));
		
		System.out.println(member_guestid);
		System.out.println(food_number);
		System.out.println(food_review_content);
		
		List<MultipartFile> food_review_img = multi.getFiles("food_review_orifile");//사진목록 
		
		Food_review frv =new Food_review();
		
		frv.setFood_number(food_number).setFood_review_content(food_review_content).setMember_guestid(member_guestid);
		frv.setFoodreservation_number(foodreservation_number);
		
		
	
		
		minfDao.insertfreview(frv);//라뷰 내용넣고 
		minfDao.updatefreser(foodreservation_number);//예약상태를 리뷰 작성한걸로 바꾸고 
		
		System.out.println("currval값="+frv.getFood_review_number()); 
		boolean f1= false;
		
		//파일 따로 없로드
		if(true) { //한번더 파일 있는지 체크 업로드
			f1=frf.fileUpfreview(multi,frv.getFood_review_number());
			
				}
		
		Map<String,Object> list = new HashMap<String, Object>();//map에 담아서 두개 리턴 
		
		List<Food_review> frel = minfDao.getmyfrevie(member_guestid);//작성한 리뷰 다시 불러오고 
		List<Foodreservation> flist = minfDao.getreviewmyfreser(member_guestid);//작성할 리뷰
		
		list.put("frel",frel);
		list.put("flist",flist);
		
		
		json = new Gson().toJson(list);
		
		System.out.println(json);
		return json;
	}


	public String writelist(Principal pc) {//내가 작성한 게시판 게시글 가져오기 
		String json =null;
		System.out.println("내가 쓴글 불러오기 ");
		
		String member_guestid = pc.getName();
		
		Map<String,Object> list = new HashMap<String, Object>(); // 더 늘어날 경우 map에 담아서 리턴 
		List<Qnaboard> qnal = minfDao.getmywrite(member_guestid);//qna 게시판
		List<SomoimBoard> soml =minfDao.getmysomowrite(member_guestid);//소모임 게시판
		List<Snsposts> snslikel = minfDao.getmylike(member_guestid);//sns 좋아요
		List<SomoimBoard> somolikel = minfDao.getmysomolike(member_guestid);//소모임 좋아요 
		List<Food_reple> freple = minfDao.getfoodreple(member_guestid);//맛집 댓글 
		List<House_reple> hreple = minfDao.gethousereple(member_guestid);//집 댓글
		List<SnsCommentDto> snsreple = minfDao.getsnsreple(member_guestid);//sns 댓글 
		
		System.out.println(snsreple);
		
		list.put("qnal", qnal);
		list.put("soml", soml);
		list.put("snslikel", snslikel);
		list.put("somolikel", somolikel);
		list.put("freple", freple);
		list.put("hreple", hreple);
		list.put("snsreple", snsreple);
		
		json = new Gson().toJson(list);
		//System.out.println(json);
		return json;
	}


	public String showcontent(int qna_number) {
		String json =null;
		System.out.println("내가 쓴글 상세보기 ");
		
		List<Qnaboard> qnal = minfDao.detailqna(qna_number);
		
		json = new Gson().toJson(qnal);
		//System.out.println(json);
		return json;
	}


	public String delqna(int qna_number, Principal pc) {
		String json =null;
		System.out.println("내가 쓴글 삭제 ");
		String member_guestid = pc.getName();
		
		minfDao.delqna(qna_number);
		
		List<Qnaboard> qnal = minfDao.getmywrite(member_guestid);
		
		json = new Gson().toJson(qnal);
		return json;
	}


	public String showcontentsomo(int board_number) {
		String json =null;
		System.out.println("내가 쓴글 상세보기 ");
		
		List<SomoimBoard> somol= minfDao.detailsomow(board_number);
		
		json = new Gson().toJson(somol);
		//System.out.println(json);
		return json;
	}


	public String delsomo(int board_number, Principal pc) {
		String json =null;
		System.out.println("내가 쓴글 삭제 ");
		String member_guestid = pc.getName();
		
		minfDao.delsomo(board_number);
		
		List<SomoimBoard> soml =minfDao.getmysomowrite(member_guestid);
		
		json = new Gson().toJson(soml);
		return json;
	}
	
}
