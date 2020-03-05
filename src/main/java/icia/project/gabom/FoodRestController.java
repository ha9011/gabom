package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IfoodDao;
import icia.project.gabom.service.Foodservice;

@RestController
@RequestMapping(value = "/rest")
public class FoodRestController {

private ModelAndView mav;
	
	@Autowired
	private Foodservice fs;

	@Autowired
	private IfoodDao fDao;

	@GetMapping(value = "/foodchangesearch" ,produces = "application/json;charset=utf-8")// ajax로 재검색 
	public String foodchangesearch(@RequestParam("data")String house_address) {
		System.out.println(house_address);
		System.out.println("재검색화면 가줘 ");
		
		String json = fs.foodchangesearch(house_address);
		
		return json;
	}
}
