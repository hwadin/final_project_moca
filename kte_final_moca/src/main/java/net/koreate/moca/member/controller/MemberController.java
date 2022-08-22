package net.koreate.moca.member.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.member.service.MemberService;
import net.koreate.moca.member.vo.MemberVO;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService ms;
	
	@Autowired
	ServletContext context;

	@RequestMapping("/logIn")
	public String logIn() {
		return "member/logIn";
	}
	
	@PostMapping("/logInPost")
	public String logInPost(MemberVO vo,RedirectAttributes rttr, HttpSession session) throws Exception{
		MemberVO user = ms.logIn(vo);
		session.setAttribute("memberInfo", ms.logIn(vo));
//		model.addAttribute("memberInfo", ms.logIn(vo));
		if(user == null) {
			return "member/logIn";
		}else {
			rttr.addFlashAttribute("memberInfo",user);
			return "redirect:/";
		}
	}
	
	@RequestMapping("/signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	@PostMapping("signUpPost")
	public String signUpPost(MemberVO vo, MultipartFile profileImage) throws Exception {
		
		ms.signUp(vo);
		if(!profileImage.isEmpty()) {
			String path = "upload"+File.separator + "profile"+File.separator+vo.getId();
			String realPath = context.getRealPath(path);
			File file = new File(realPath);
			if(!file.exists()) {
				file.mkdir();
			}
			file = new File(realPath,profileImage.getOriginalFilename());
			profileImage.transferTo(file);
			String profile_url = path+File.separator+profileImage.getOriginalFilename();
			vo.setProfile_url(profile_url);
			
		}

		return "redirect:/member/logIn";
	}
	
	@GetMapping("logOut")
	public String logOut(HttpSession session, HttpServletResponse response,
			@CookieValue(name="logInCookie", required=false)Cookie logInCookie
			) {
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
			session.removeAttribute("invalidate");
			if(logInCookie != null) {
				logInCookie.setMaxAge(0);
				logInCookie.setPath("/");
				response.addCookie(logInCookie);
			}
		}
		return "redirect:/";
	}
	
	@GetMapping("idCheck")
	@ResponseBody
	public boolean isCheck(String id) {
		boolean isCheck = false;
		if(id != null) {
			isCheck = true;
		}
		return isCheck;
	}
	
}
