package icia.project.gabom.service;

import java.security.Principal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;



import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.userClass.houseUploadFile;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IfoodDao;
import icia.project.gabom.dto.Food;
import icia.project.gabom.userClass.FoodUploadFile;

@Service
public class FoodRegisterService {
	
	@Autowired
	private IfoodDao fDao;
	
	private ModelAndView mav;
	
	@Autowired
	private FoodUploadFile ful;
	





	public ModelAndView foodRegisterUpload(MultipartHttpServletRequest multi,Principal principal) {
		mav=new ModelAndView();
		String view=null;
		
		String food_hostid=principal.getName();
		String food_name = multi.getParameter("food_name"); //이름
		int food_type =Integer.parseInt(multi.getParameter("food_type"));//타입
		int food_parkable =Integer.parseInt(multi.getParameter("food_parkable"));//주차
		String food_mindate = multi.getParameter("food_mindate");//영업일
		String food_maxdate = multi.getParameter("food_maxdate");//영업종료?
		int food_person =Integer.parseInt(multi.getParameter("food_person")); //인원수
		String food_address = multi.getParameter("food_address");//주소
		String food_xpoint = multi.getParameter("food_xpoint"); //위도 
		String food_ypoint = multi.getParameter("food_ypoint");//경도
		
		/*final String OLD_FORMAT = "yyyy-MM-dd";
		final String NEW_FORMAT = "yyyy-MM-dd";
		String oldDateString;
		String newDateString;

		DateFormat formatter = new SimpleDateFormat(OLD_FORMAT);
		Date d = formatter.parse(oldDateString);
		((SimpleDateFormat) formatter).applyPattern(NEW_FORMAT);
		newDateString = formatter.format(d);
		System.out.println(newDateString);*/

		String ts = multi.getParameter("food_mintime");
		String ts2 =multi.getParameter("food_maxtime");
		System.out.println(ts);
		String food_mintime = ts;//오픈시간
		String food_maxtime = ts2;//오픈시간
		
		MultipartFile house_mainImage = multi.getFile("food_mainImage");//메인
		List<MultipartFile> house_detailImages = multi.getFiles("food_menuImages");//디테일
		
		Food food=new Food();
		
		food.setFood_address(food_address).setFood_name(food_name).setFood_parkable(food_parkable).setFood_type(food_type);
		food.setFood_xpoint(food_xpoint).setFood_ypoint(food_ypoint).setFood_person(food_person);
		food.setFood_maxdate(food_maxdate).setFood_mindate(food_mindate).setFood_maxtime(food_maxtime).setFood_mintime(food_mintime);
		food.setFood_hostid(food_hostid);
		
		int food_number = fDao.foodRegisterUpload(food);
		
		System.out.println("currval값="+food.getFood_number()); 
		
		if(true) {//insert 성공
			view="home";
		}else {// insert 실패
			view="foodshopRegister"; //jsp
		}
		
		boolean f1= false;
		boolean f2= false;
		if(true) { //한번더 파일 있는지 체크 업로드
			f1=ful.fileUpmain(multi, food.getFood_number());
			f2=ful.fileUpdetail(multi,food.getFood_number());
			if(f1) {
				view="home";
			}else {
				view="foodshopRegister"; //jsp
			}
	}	
		System.out.println("뷰 어디로 갈거니..");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}

}
