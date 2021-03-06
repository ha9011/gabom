package icia.project.gabom.advice;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import icia.project.gabom.exception.NoTouristSpotException;



@RestControllerAdvice
public class ControllerAdviceRest {
   //한글 깨짐 방지
public HttpHeaders getHeaders() {
      HttpHeaders headers = new HttpHeaders();
      headers.add("Content-Type", "text/plain;charset=utf-8");
      return headers;
   }
   
//   @ExceptionHandler(PageException.class)
//   public ResponseEntity<?> replyExceptionHandler(){
//      System.out.println("RestController Advice");
//      return ResponseEntity.status(HttpStatus.CONFLICT).body("noGetReply");
//   }
  

  //IdCheckException
   
   @ExceptionHandler(NoTouristSpotException.class )
   public ResponseEntity<String> NoTourisExceptionHandler(NoTouristSpotException ex) {
	   System.out.println("익셉션 도착함요 NoTouristSpotException");
      return new ResponseEntity<String>(ex.getMessage(), getHeaders(),HttpStatus.EXPECTATION_FAILED);
   }
   
}