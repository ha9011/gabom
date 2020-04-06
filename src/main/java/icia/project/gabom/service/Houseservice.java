package icia.project.gabom.service;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IfoodDao;
import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.dto.Food;
import icia.project.gabom.dto.House;
import icia.project.gabom.dto.House_reple;
import icia.project.gabom.dto.House_review;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;

@Service
public class Houseservice {
	
	private ModelAndView mav;
	
	@Autowired
	private IhouseDao hDao;
	
	@Autowired
	private IfoodDao fDao;

	public String gethouselist() { // home에서 집목록, 음식 목록 보여줌
		String json = null;
		
		Map<String,Object> list = new HashMap<String, Object>();
		
		List<House> hlist =hDao.getreserdate();
		List<Food> flist =fDao.getfreserdate();
		
		list.put("hlist", hlist);
		list.put("flist", flist);
		
		System.out.println(list);
		
		json = new Gson().toJson(list);
		return json;
	}
	
	

	public ModelAndView getHouseList(House house) {//메인에 출력하는 집 리스트 (전체 보유 리스트)
		//System.out.println("여기 오니?");
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<House> houselist = hDao.getHouseList();
		//System.out.println("houselist"+houselist.size());
		//System.out.println(houselist);
		view="house/housemain";
		json = new Gson().toJson(houselist);
		mav.addObject("houselist", json); // key,value
		
		System.out.println("집목록 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public ModelAndView searchhouse(String house_address,House house) {//검색했을 때 출력되는 리스트
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<House> searchhouse = hDao.searchhouse(house_address);
		//System.out.println("searchhouse="+searchhouse);
		//System.out.println(house_address);
		view="house/houseSearchDetail";
		
		
		
		json = new Gson().toJson(searchhouse);
		//System.out.println("json="+json);
		mav.addObject("searchhouse",json);
		System.out.println("검색결과 보여줘 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public String housechangesearch(String house_address) {
		String json = null;
		System.out.println("재검색 하러 오고있니?");
		
		List<House> changesearch = hDao.changesearch(house_address);
		//System.out.println("changesearch="+changesearch);
		//System.out.println(house_address);
		
		json = new Gson().toJson(changesearch);
		//System.out.println("json="+json);
		System.out.println("검색결과 보여줘 ");
		
		return json;
	}


	public ModelAndView housedetail(int house_number, Housereservation reserlist, Principal principal) {
		mav = new ModelAndView();
		String view = null;
		String json = null;
		String json2 = null;
		String json3 = null;
		String json4 = null;
		String json5 = null;
		
		List<House> detailhouse = hDao.detailhouse(house_number);
		
		List<Housereservation> detailreser = hDao.detailreser(house_number);
		
		List<House_reple> reple_list = hDao.replelist(house_number);
		
		List<House_review> review_list =hDao.reviewlist(house_number);
		
		String member_id=principal.getName();
		
		List<Member> memberinfo=hDao.memberinfo(member_id);
		System.out.println("로그인 아이디"+member_id);
		
		view="house/housedetail";
		
		
		
		json = new Gson().toJson(detailhouse);
		json2 = new Gson().toJson(detailreser);
		json3 = new Gson().toJson(reple_list);
		json4 = new Gson().toJson(memberinfo);
		json5 = new Gson().toJson(review_list);
		//System.out.println("json="+json);
		System.out.println("json2="+json2);
		mav.addObject("detailhouse",json);
		mav.addObject("detailreser",json2);
		mav.addObject("reple_list",json3);
		mav.addObject("memberinfo",json4);
		mav.addObject("review_list",json5);
		
		System.out.println("해당 방 정보 보여줘");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public String housereservation(Principal principal, Housereservation hreservation) {
		String json = null;
		System.out.println("예약하러  오니?");
		String member_guestid=principal.getName();
		int house_number= hreservation.getHouse_number();
		String house_hostid= hreservation.getHouse_hostid();
		int reservation_totalprice=hreservation.getReservation_totalprice();
		int reservation_person=hreservation.getReservation_person();
		String reservation_checkin=hreservation.getReservation_checkin();
		String reservation_checkout=hreservation.getReservation_checkout();		
		
		hreservation.setHouse_hostid(house_hostid).setHouse_number(house_number).setMember_guestid(member_guestid);
		hreservation.setReservation_checkin(reservation_checkin).setReservation_checkout(reservation_checkout);
		hreservation.setReservation_person(reservation_person).setReservation_totalprice(reservation_totalprice);
		
		int reservation_number = hDao.housereservation(hreservation);
		
		json = new Gson().toJson(hreservation);
		System.out.println("json="+json);
		System.out.println("예약했니?");
		
		return json;
	}


	public String insertreple(House_reple h_reple, Principal ppl) {
		String json = null;
		
		int house_number = h_reple.getHouse_number();
		String member_guestid = ppl.getName();
		String house_reple_content = h_reple.getHouse_reple_content();
		
		House_reple hreple = new House_reple();
		
		hreple.setHouse_number(house_number).setHouse_reple_content(house_reple_content).setMember_guestid(member_guestid);
		hDao.insertreple(hreple);//댓글 넣고 
		
		List<House_reple> reple_list = hDao.replelist(house_number);//다시 불러옴
		
		json = new Gson().toJson(reple_list);
		return json;
	}


	public String hdreview(int house_review_number) {
		String json =null;
		System.out.println(house_review_number);
		
		List<House_review> detail = hDao.showhreview(house_review_number);
		
		json = new Gson().toJson(detail);
		return json;
	}


	public String repledel(House_reple h_reple) {
		String json =null;
		int house_reple_number =h_reple.getHouse_reple_number();
		int house_number = h_reple.getHouse_number();
		hDao.repledel(house_reple_number);
		
		List<House_reple> reple_list = hDao.replelist(house_number);//다시 불러옴
		
		json = new Gson().toJson(reple_list);
		return json;
	}



	public String searchHotel(String address, String checkin, String checkout) {
		System.out.println("address : " + address);
		System.out.println("checkin : " + checkin);
		System.out.println("checkout : " + checkout);
		
		String resultHtml ;
		try {
			String URL = "https://www.hotelscombined.co.kr/Search?search="+address+"&checkin="+checkin+"&checkout="+checkout+"&languageCode=KO&currencyCode=KRW";
			System.out.println("url : " + URL);
			Document doc = Jsoup.connect(URL).get();
			//System.out.println("doc : " + doc.toString());
			// id="hc_usr"
			
			Elements elem = doc.select("div.hc_usi");  //
			int idx = 0;
			Iterator<Element> iter = elem.iterator();
			while (iter.hasNext()) {
			    Element s = iter.next();
			    System.out.println(s.child(0).attr("href"));
				if(s.child(0).attr("href").contains("Hotels")) {
					System.out.println("포함 : " +  idx);
					iter.remove();
				
				}else {
					String href = "//www.hotelscombined.co.kr"+s.child(0).attr("href");
					System.out.println("href : " + href );
					s.child(0).attr("href", href);
					s.child(1).child(0).attr("href",href);
					String hotelImg = s.child(0).toString();
					String hotelTitle = s.child(1).toString();
					
					s.prepend("<div class='hotelTitle'>"+hotelTitle+"</div>");
					s.prepend("<div class='hotelImg'>"+hotelImg+"</div>");

					s.child(6).remove();
					s.child(5).remove();
					s.child(4).remove();
					s.child(3).remove();
					s.child(2).remove();
				}
			    
			    //iter.remove();		
						
				idx++;
			}
			
			System.out.println("=========elem===========");
			System.out.println(elem.toString());
			System.out.println("size : " + elem.size());
			resultHtml = elem.toString();
			return elem.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

}
