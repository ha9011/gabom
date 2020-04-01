package icia.project.gabom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IServiceDao;
import icia.project.gabom.dto.Adminnotices;
import icia.project.gabom.dto.Qnaboard;


@Service
public class ServiceCenterManagement {

	@Autowired
	private IServiceDao sDao;
	private ModelAndView mav;
	
	
	// 고객센터 클릭시 공지사항,qna 출력
	public ModelAndView servicecenter() {
		System.out.println("서비스 서비스");
		mav = new ModelAndView();
		
		List<Adminnotices> nlist = sDao.getNoticeList(); //전체공지 불러오기
		List<Qnaboard> qlist = sDao.getQnaList(); //Qna 불러오기
		
		System.out.println("전체공지사항"+nlist);
		System.out.println("질문리스트"+qlist);
		
		String nson = new Gson().toJson(nlist);
		String qson = new Gson().toJson(qlist);
		
		mav.addObject("noticelist", nson);
		mav.addObject("qnalist", qson);
		
		System.out.println("nson=" + nson);
		System.out.println("qson=" + qson);
		
		mav.setViewName("servicecenter");
		
		return mav;
	}
}
