package net.koreate.moca.manage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.moca.member.vo.MemberVO;

@Controller
@RequestMapping("/manage/*")
public class ManageController {

	@GetMapping("cafe")
	public String manageCafe(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		if (member != null && member.isIsOwner() == true) {
			return "/manage/cafeReserveManage";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping("admin")
	public String manageAdmin(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		if (member != null && member.isRole() == true) {
			return "/manage/admin";
		} else {
			return "redirect:/";
		}
	}

}
