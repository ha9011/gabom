package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.dto.Snsposts;
import icia.project.gabom.service.SnsTimeLineService;

@RestController
public class RestSnsTimeLineController {
	
	@Autowired
	private SnsTimeLineService snsts;

	@GetMapping(value = "/sns/timeline", produces = "application/json;charset=UTF-8")
	public String snsTimeLine(Principal principal,@RequestParam("low") int low) {
		String json = snsts.snsTimeLine(principal,low);
		return json;
	}
	
	
	@GetMapping(value = "/sns/mytimeline", produces = "application/json;charset=UTF-8")
	public String mytimeline(Principal principal, Snsposts snsposts ) {
		
		String json = snsts.mytimeline(snsposts,principal);
		
		return json;
	}
	
	@GetMapping(value = "/sns/friendtimeline", produces = "application/json;charset=UTF-8")
	public String friendtimeline(Principal principal, Snsposts snsposts ) {
		
		String json = snsts.friendtimeline(snsposts,principal);
		
		return json;
	}
}
