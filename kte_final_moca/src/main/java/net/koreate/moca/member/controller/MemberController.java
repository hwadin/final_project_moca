package net.koreate.moca.member.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.service.CafeService;
import net.koreate.moca.cafe.vo.CafeVO;
import net.koreate.moca.member.service.MemberService;
import net.koreate.moca.member.vo.MemberVO;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class MemberController {
   
   private final MemberService ms;
   private final CafeService cs;
   private final PasswordEncoder encoder;
   
   @Autowired
   ServletContext context;

   @RequestMapping("/logIn")
   public String logIn() {
      return "member/logIn";
   }
   
   @PostMapping("/logInPost")
   public String logInPost(MemberVO vo, RedirectAttributes rttr, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
	   System.out.println("vo : "+vo);
      MemberVO user = ms.logIn(vo);
      session.setAttribute("memberInfo", user);
      String useCookie = request.getParameter("useCookie");
	  if(useCookie != null) {
		  Cookie cookie = new Cookie("logInCookie", vo.getId());
		  cookie.setMaxAge(60 * 60 * 24);
		  cookie.setPath("/");
		  response.addCookie(cookie);
	  }
      if(user == null) {
    	  rttr.addFlashAttribute("msg","아이디와 비밀번호를 다시 확인해주세요.");
    	  return "redirect:/member/logIn";
      }else {
    	  rttr.addFlashAttribute("msg","로그인 성공!");
    	  return "redirect:/";
      }

   }
   
   @RequestMapping("/signUp")
   public String signUp() {
      return "member/signUp";
   }
   
   @RequestMapping("/signUpChoice")
   public String signUpChoice() {
      return "member/signUpChoice";
   }
   
   @RequestMapping("/update")
   public String update() {
      return "member/update";
   }
   
   @PostMapping("updatePost")
   public String updatePost(MemberVO vo, RedirectAttributes rttr, MultipartFile profileImage, HttpSession session, HttpServletRequest request) throws Exception{
	   request.setAttribute("sessionInfo", vo.getPw());
	   
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
	  session.removeAttribute("memberInfo");
      ms.memberUpdate(vo);
      session.setAttribute("memberInfo", ms.searchId(vo));
      rttr.addFlashAttribute("no",vo.getNo());
      
      return "redirect:/";
   }

   @PostMapping("signUpPost")
   public String signUpPost(MemberVO vo, MultipartFile profileImage, RedirectAttributes rttr) throws Exception {

      
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
      ms.signUp(vo);
      
      return "redirect:/member/logIn";
   }
   
   @RequestMapping("ownerSignUp")
   public String ownerSignUp(MemberVO vo) {
      return "member/ownerSignUp";
   }
   
   @PostMapping("ownerSignUpPost")
   public  String ownerSignUpPost(MemberVO vo, String c_name, String c_addr, String c_addr_detail) throws Exception{
      CafeVO cvo = new CafeVO();
      vo.setIsOwner(true);
      ms.signUp(vo);
      cvo.setOwner_no(vo.getNo());
      cvo.setName(c_name);
      cvo.setAddr(c_addr);
      cvo.setAddr_detail(c_addr_detail);
      cs.regist(cvo);
      return "redirect:/member/logIn";
   }
   
   @GetMapping("logOut")
   public String logOut(HttpSession session, HttpServletResponse response,
		   @CookieValue(name="logInCookie", required=false)Cookie logInCookie) {
      if(session.getAttribute("memberInfo") != null) {
         session.removeAttribute("memberInfo");
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
   public boolean isCheck(String id) throws Exception {
      boolean isCheck = false;
      MemberVO vo = new MemberVO();
      vo.setId(id);
      MemberVO searchVO = ms.searchId(vo);
      if (searchVO == null) {
    	  isCheck = true;
      }
      return isCheck;
   }
	 
   @RequestMapping("pwCheck")
   public String pwCheck(String pw) {
	   
	   
	   return "member/pwCheck";
   }
   
   @PostMapping("pwCheckPost")
   public String pwCheckPost(HttpServletRequest request, String pw, @SessionAttribute("memberInfo") MemberVO vo, Model model) throws Exception {
	      if(encoder.matches(pw,vo.getPw())) {
	    	  HttpSession session = request.getSession();
	    	  session.setAttribute("pw",pw);
	    	  return "member/update";
	      }else {
	         model.addAttribute("msg","비밀번호가 일치하지 않습니다");
	         return "member/pwCheck";
	      }

   }
   
   @RequestMapping("delete")
   public String delete() {
	   
	   return "member/delete";
   }
   
   @PostMapping("deletePost")
   public String delete(String pw, MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
	   
	  
	   MemberVO user = (MemberVO)session.getAttribute("memberInfo");
	   if(encoder.matches(pw, user.getPw())) {
		   ms.delete(vo);
		   session.invalidate();
		   rttr.addAttribute("msg","정상적으로 탈퇴 되었습니다.");
		   return "redirect:/";
	   }else {
		   rttr.addAttribute("msg","회원탈퇴에 실패했습니다.");
		   return "member/delete";
	   }


   }

}