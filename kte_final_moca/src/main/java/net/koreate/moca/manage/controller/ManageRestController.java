package net.koreate.moca.manage.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.reservation.service.ReservationService;

@RestController
@RequestMapping("/manage/api/*")
@RequiredArgsConstructor
public class ManageRestController {

	private final ReservationService rs;

	// 모두 예약 번호
	@PatchMapping("cafe/accept/{no}")
	public ResponseEntity<String> accept(@PathVariable int no) {
		ResponseEntity<String> entity = null;

		try {
			rs.acceptReserv(no);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@PatchMapping("cafe/expire/{no}")
	public ResponseEntity<String> expire(@PathVariable int no) {
		ResponseEntity<String> entity = null;

		try {
			rs.expireReserv(no);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@PatchMapping("cafe/reject/{no}")
	public ResponseEntity<String> reject(@PathVariable int no) {
		ResponseEntity<String> entity = null;

		try {
			rs.rejectReserv(no);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}
