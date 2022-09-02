package net.koreate.moca.reservation.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.vo.CafeReviewVO;
import net.koreate.moca.manage.vo.ManageReservationDTO;
import net.koreate.moca.reservation.service.ReservationService;
import net.koreate.moca.reservation.vo.CafeDTO;
import net.koreate.moca.reservation.vo.ReservationDTO;
import net.koreate.moca.reservation.vo.ReservationVO;

@RestController
@RequestMapping("/reservation/api/*")
@RequiredArgsConstructor
public class ReservationRestController {

	private final ReservationService rs;

	@GetMapping("cafeList")
	public ResponseEntity<List<CafeDTO>> cafeList(ReservationVO vo) {
		ResponseEntity<List<CafeDTO>> entity = null;

		try {
			List<CafeDTO> list = rs.cafeList(vo);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@PostMapping("regist")
	public ResponseEntity<String> regist(@RequestBody ReservationVO reservation) {
		ResponseEntity<String> entity = null;

		System.out.println(reservation);
		try {
			rs.regist(reservation);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@GetMapping("reservList/{member_no}")
	public ResponseEntity<List<ReservationDTO>> reservList(@PathVariable int member_no) {
		ResponseEntity<List<ReservationDTO>> entity = null;

		try {
			List<ReservationDTO> list = rs.reservList(member_no);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@GetMapping("pastReservList/{member_no}")
	public ResponseEntity<List<ReservationDTO>> pastReservList(@PathVariable int member_no) {
		ResponseEntity<List<ReservationDTO>> entity = null;

		try {
			List<ReservationDTO> list = rs.pastReservList(member_no);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@GetMapping("detail")
	public ResponseEntity<Map<String, Object>> detail(int no, String code) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = rs.detail(no, code);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@DeleteMapping("delete")
	public ResponseEntity<String> delete(int no, String code) {
		ResponseEntity<String> entity = null;

		try {
			rs.delete(no, code);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@PostMapping("registReview")
	public ResponseEntity<String> registReview(CafeReviewVO vo) {
		ResponseEntity<String> entity = null;

		try {
			rs.registReview(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@GetMapping("review/{no}")
	public ResponseEntity<CafeReviewVO> review(@PathVariable int no) {
		ResponseEntity<CafeReviewVO> entity = null;

		try {
			entity = new ResponseEntity<>(rs.review(no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@GetMapping("manageReservList/{no}")
	public ResponseEntity<List<ManageReservationDTO>> manageReservList(@PathVariable int no) {
		ResponseEntity<List<ManageReservationDTO>> entity = null;

		try {
			List<ManageReservationDTO> list = rs.manageReservList(no);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
