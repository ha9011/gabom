package icia.project.gabom.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import icia.project.gabom.exception.PageException;
import lombok.extern.log4j.Log4j;

@ControllerAdvice   // 에러발생하면 이놈이 이 예외컨트롤러로 해준다
public class ControllerAdviceMVC {
	
	
	
	@ExceptionHandler(PageException.class)  // 예외 구별해주는 친구.
	public String PageException(PageException ex, RedirectAttributes attr){
		attr.addFlashAttribute("msg",ex.getMessage());  // getMessage() 문제 불러오는 것
		return "redirect:/boardlist";
	}
	
//	@ExceptionHandler(IdCheckException.class)  // 예외 구별해주는 친구.
//	public String IdCheckException(PageException ex, RedirectAttributes attr){
//		attr.addFlashAttribute("msg",ex.getMessage());  // getMessage() 문제 불러오는 것
//		return "redirect:/boardlist";
//	}
}
