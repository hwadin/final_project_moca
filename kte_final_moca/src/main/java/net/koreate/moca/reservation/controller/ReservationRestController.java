package net.koreate.moca.reservation.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.reservation.service.ReservationService;
import net.koreate.moca.reservation.vo.CafeDTO;
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

}
