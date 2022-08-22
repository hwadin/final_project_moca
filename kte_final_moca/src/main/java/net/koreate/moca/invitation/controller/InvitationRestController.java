package net.koreate.moca.invitation.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.invitation.service.InvitationService;
import net.koreate.moca.invitation.vo.InvitationVO;

@RestController
@RequestMapping("/invitation/api/*")
@RequiredArgsConstructor
public class InvitationRestController {

	private final InvitationService is;

	@GetMapping("listByMember/{no}")
	public ResponseEntity<List<InvitationVO>> findByMember(@PathVariable("no") int member_no) {
		ResponseEntity<List<InvitationVO>> entity = null;

		try {
			entity = new ResponseEntity<>(is.findByMember(member_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@PostMapping("/")
	public ResponseEntity<String> regist(InvitationVO vo) {
		ResponseEntity<String> entity = null;

		try {
			is.regist(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
