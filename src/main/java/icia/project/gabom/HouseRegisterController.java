package icia.project.gabom;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.service.HouseRegisterService;

@Controller
public class HouseRegisterController {
	private static final Logger logger = LoggerFactory.getLogger(HouseRegisterController.class);
	private ModelAndView mav;
	
	@Autowired
	private HouseRegisterService hrs;
	
	
	@PostMapping(value = "/houseRegisterUpload")
	public ModelAndView houseRegisterUpload(MultipartHttpServletRequest multi ) {
		System.out.println("집등록 컨트롤러");
		System.out.println(multi.getParameter("house_name"));
		System.out.println(multi.getParameter("house_address"));
		
		List<MultipartFile> files=multi.getFiles("house_detailImage");
		System.out.println(files.size());
		System.out.println("files="+files.get(0).getOriginalFilename());
		
		mav= hrs.houseRegisterUpload(multi);
		System.out.println("완료되면 뷰로 보여줘");
		return mav;
	}
	
}
