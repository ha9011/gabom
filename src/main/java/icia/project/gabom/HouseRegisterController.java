package icia.project.gabom;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
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
	private ModelAndView mav;
	
	@Autowired
	private HouseRegisterService hrs;
	
	
	@PostMapping(value ="/houseregisterupload")
	public ModelAndView houseRegisterUpload(MultipartHttpServletRequest multi,
			Principal principal,HttpServletRequest req) {
		
		String member_hostid=principal.getName();
		System.out.println("호스트 아이디"+principal.getName());
		System.out.println("집등록 컨트롤러");
		System.out.println(multi.getParameter("house_name"));
		System.out.println(multi.getParameter("house_address"));
		System.out.println(multi.getParameter("house_xpoint"));
		System.out.println(multi.getParameter("house_ypoint"));
		
		
		List<MultipartFile> files=multi.getFiles("house_detailImage");
		System.out.println(files.size());
		System.out.println("files="+files.get(0).getOriginalFilename());
		
		mav= hrs.houseRegisterUpload(multi,principal,req);
		System.out.println("완료되면 뷰로 보여줘");
		return mav;
	}
	
}
