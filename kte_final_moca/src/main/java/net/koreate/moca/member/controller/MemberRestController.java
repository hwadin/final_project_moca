package net.koreate.moca.member.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.koreate.moca.member.vo.MemberVO;

@RestController
@RequestMapping("/member/api/*")
public class MemberRestController {
	
	
	 @PostMapping("idCheck") public ResponseEntity<MemberVO> idCheck() {
	 ResponseEntity<MemberVO> entity = null;
	  
	  
	 return entity; 
	 	
	 }
	
}
