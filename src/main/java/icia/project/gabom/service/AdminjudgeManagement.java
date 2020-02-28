package icia.project.gabom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IAdminDao;
import icia.project.gabom.dto.Adminhouse;

@Service
public class AdminjudgeManagement {
	@Autowired
	private IAdminDao aDao;
	private ModelAndView mav;
	
	public ModelAndView housejudgelist() {
		mav = new ModelAndView();
		List<Adminhouse> hlist = aDao.getHouseList();
		System.out.println("List="+hlist);
		System.out.println("List="+hlist.get(0));
		System.out.println("hlist="+hlist.size());
		//int i = 0;
		//for(i=0;i<hlist.size();i++) {
			//System.out.println(hlist.get(i).toString());
		//	System.out.println(hlist.get(i).get("HOUSE_NAME"));
		//}
		
//		List<Map<String, String>> testj = new ArrayList<Map<String,String>>();
//		Map<String, String> mapj = new HashMap<String, String>();
//		mapj.put("이름", "하동원");
//		mapj.put("나이", "31");
//		testj.add(mapj);
		
		
		
		
		String json=new Gson().toJson(hlist);
		
		
		
		
		System.out.println("json12="+json);
		mav.addObject("housejudge", json);
		mav.setViewName("adminmenu");
		return mav;
	} //housejudgelist End
	
	
}//class End
