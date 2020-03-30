package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsPostReport;

@RestController
public class RestSnsPostReportController {

	@Autowired
	SnsPostReport snsPostReport;
	
	
	@PostMapping(value = "/sns/post/report",produces = "application/json;charset=utf-8")	
	public String postReport(@RequestParam("postNumber") int postNumber) {
		String json=snsPostReport.report(postNumber);
		
		return json;
	}
	
}
