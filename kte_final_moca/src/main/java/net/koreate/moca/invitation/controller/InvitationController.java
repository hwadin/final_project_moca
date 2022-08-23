package net.koreate.moca.invitation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/invitation/*")

public class InvitationController {

	@GetMapping("invitationMain")
	public String invitationMain(HttpSession session) {
		if (session.getAttribute("memberInfo") != null) {
			return "invitation/invitationMain";
		} else {
			return "redirect:/member/logIn";
		}

	}

}
