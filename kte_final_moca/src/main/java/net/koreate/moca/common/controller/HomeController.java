package net.koreate.moca.common.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.common.alert.AlertVO;
import net.koreate.moca.invitation.dao.InvitationDAO;

@Controller
@RequiredArgsConstructor
public class HomeController {

	private final InvitationDAO dao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	@RequestMapping("/alert/{id}")
	@ResponseBody
	public ResponseEntity<AlertVO> alert(@PathVariable("id") String id) {
		ResponseEntity<AlertVO> entity = null;

		AlertVO alert = new AlertVO();
		alert.setId(id);

		alert.setInvitationAlert(dao.getAlertList(alert));

		entity = new ResponseEntity<>(alert, HttpStatus.OK);

		return entity;
	}

}
