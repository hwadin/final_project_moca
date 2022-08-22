package net.koreate.moca.board.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.board.service.CafeBoardService;

@RestController
@RequestMapping("/board")
@RequiredArgsConstructor
public class CafeBoardRestController {
	
	private final CafeBoardService cs;
	
	// @PostMapping("/register")
	
}
