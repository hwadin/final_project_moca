package net.koreate.moca.cafe.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.service.CafeReviewService;

@RestController
@RequestMapping("/review/api/*")
@RequiredArgsConstructor
public class CafeReviewRestController {
	
	private final CafeReviewService crs;
	
	@GetMapping("{cafe_no}")
	public ResponseEntity<Map<String,Object>> list(@PathVariable(name="cafe_no")int cafe_no){
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> map = null;
		try {
			map = crs.reviewList(cafe_no);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity ;
	}
}
