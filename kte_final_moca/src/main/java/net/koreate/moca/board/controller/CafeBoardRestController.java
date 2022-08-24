package net.koreate.moca.board.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.service.CafeService;

@RestController
@RequestMapping("/board/")
@RequiredArgsConstructor
public class CafeBoardRestController {
	
	private final CafeService cs ;
	
	/*
	 * @PostMapping("wishlist") public ResponseEntity<String> review(){
	 * 
	 * }
	 */
}
