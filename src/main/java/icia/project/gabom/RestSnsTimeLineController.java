package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.dto.Snsposts;
import icia.project.gabom.service.SnsTimeLineService;

@RestController
public class RestSnsTimeLineController {
	
	@Autowired
	private SnsTimeLineService snsts;

	@GetMapping(value = "/sns/timeline", produces = "application/json;charset=UTF-8")
	public String snsTimeLine(Principal principal, Snsposts snsposts ) {
		System.out.println("타임라인 들어옴");
		System.out.println("탐라 주인 아이디="+principal.getName());
		System.out.println("전체 게시물="+snsposts);
		
		String json = snsts.snsTimeLine(snsposts,principal);
		System.out.println("전체 게시물 먼저 보여줘="+json);
		
		return json;
	}
	
	
	@GetMapping(value = "/sns/mytimeline", produces = "application/json;charset=UTF-8")
	public String mytimeline(Principal principal, Snsposts snsposts ) {
		System.out.println("내타임라인 들어옴");
		
		String json = snsts.mytimeline(snsposts,principal);
		System.out.println("탐라 주인 아이디="+principal.getName());
		
		System.out.println("전체 게시물 먼저 보여줘="+json);
		
		return json;
	}
	
	@GetMapping(value = "/sns/friendtimeline", produces = "application/json;charset=UTF-8")
	public String friendtimeline(Principal principal, Snsposts snsposts ) {
		System.out.println("친구타임라인 들어옴");
		
		String json = snsts.friendtimeline(snsposts,principal);
		System.out.println("전체 게시물 먼저 보여줘="+json);
		
		return json;
	}
}
