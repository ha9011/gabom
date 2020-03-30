package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsCommentReport;

@RestController
public class RestSnsCommentReportController {

	@Autowired
	SnsCommentReport snsCommentReport;
	
	
	@PostMapping(value = "sns/comment/report", produces = "application/json;charset=UTF-8")
	public String commentReport(@RequestParam("commentNumber") int commentNumber) {
				
		String json=snsCommentReport.report(commentNumber);
		
		
		return json;
	}
}
