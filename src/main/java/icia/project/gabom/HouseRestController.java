package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.service.Houseservice;

@RestController
@RequestMapping(value = "/rest")
public class HouseRestController {

	private ModelAndView mav;
	
	@Autowired
	private Houseservice hs;

	@Autowired
	private IhouseDao hDao;

	@GetMapping(value = "/housechangesearch" ,produces = "application/json;charset=utf-8")// ajax로 재검색 
	public String housechangesearch(@RequestParam("data")String house_address) {
		System.out.println(house_address);
		System.out.println("집재검색화면 가줘 ");
		
		String json = hs.housechangesearch(house_address);
		
		return json;
	}
}
