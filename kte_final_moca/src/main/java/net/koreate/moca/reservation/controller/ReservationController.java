package net.koreate.moca.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {

	@GetMapping("reservationMain")
	public String reservationMain(HttpSession session) {
		if (session.getAttribute("memberInfo") != null) {
			return "/reservation/reservationMain";
		} else {
			return "redirect:/member/logIn";
		}
	}

	@GetMapping("pastReservation")
	public String pastReservation(HttpSession session) {
		if (session.getAttribute("memberInfo") != null) {
			return "/reservation/pastReservation";
		} else {
			return "redirect:/member/logIn";
		}
	}

}
