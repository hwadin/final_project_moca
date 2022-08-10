package net.koreate.moca.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {

	@RequestMapping("/logIn")
	public String logIn() {
		return "member/signIn";
	}
	
	@RequestMapping("/signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	// logIn 쿠키 등록후 마무리예정
	public String logOut(HttpSession session, HttpServletResponse response) {
		
		return "redirect:/";
	}
}
