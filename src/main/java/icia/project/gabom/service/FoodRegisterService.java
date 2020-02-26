package icia.project.gabom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.userClass.houseUploadFile;

public class FoodRegisterService {
	@Autowired
	//private IhouseDao hDao;
	
	private ModelAndView mav;
	
	@Autowired
	private houseUploadFile ul;
	

	public ModelAndView foodRegisterUpload(MultipartHttpServletRequest multi) {
		
		return null;
	}

}
