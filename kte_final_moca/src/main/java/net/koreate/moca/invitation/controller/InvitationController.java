package net.koreate.moca.invitation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/invitation/*")
public class InvitationController {

	@GetMapping("invitationMain")
	public String invitationMain() {
		return "invitation/invitationMain";
	}

}
