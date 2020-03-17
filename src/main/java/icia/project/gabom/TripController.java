package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.ITripplanDao;
import icia.project.gabom.service.TripService;

@Controller
public class TripController {
   
   private ModelAndView mav;
   
//   @Autowired
//   private ITripplanDao tpDao;
   
   @Autowired
   private TripService trs;
   
   
   @RequestMapping(value = "/trip", method = RequestMethod.GET)
   public String trip() {
      System.out.println("여행계획");
      
      return "Trip/Tripplan";
   }
   
   @RequestMapping(value = "/myplan", method = RequestMethod.GET)
   public ModelAndView myplan(Principal ppl) {
      System.out.println("내여행 목록");
      
      System.out.println("로그인 아이디"+ppl.getName());
      
      mav=trs.myplan(ppl);
      //System.out.println(mav);
      return mav;
   }
   

}