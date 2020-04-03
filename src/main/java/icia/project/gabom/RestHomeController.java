package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.Houseservice;

@RestController
@RequestMapping(value = "/hmrest")
public class RestHomeController {
	
	@Autowired
	private Houseservice hs;
	
	@RequestMapping(value = "/housefood", produces="text/plain;charset=utf-8")//시작할때 불러오는거 
	public String housechoice() {
		System.out.println("목록 불러와라 ");
		
		String json =hs.gethouselist();
		return json;
	}

}
