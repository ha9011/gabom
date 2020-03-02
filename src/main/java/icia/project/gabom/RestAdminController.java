package icia.project.gabom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IAdminDao;
import icia.project.gabom.dto.House;


@RestController
public class RestAdminController {
	
	
	@Autowired
	private IAdminDao aDao;
	
	
	
	@GetMapping(value = "/judgemodal", produces = "text/plain;charset=UTF-8")
	public String judgemodal(@RequestParam("num") String num){
		System.out.println("레스트컨트룰러");
		System.out.println("zjsdnzjxc : "+ num);
				
		List<House> jlist = aDao.getjudgemodal(num);
		System.out.println("레스트컨트룰러j"+jlist);
		
		String json = new Gson().toJson(jlist);
		System.out.println(json);
		
		
		
		
		return json;
	}
	
}
