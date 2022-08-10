package net.koreate.moca.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CafeBoardController {
	
	
	@GetMapping("listPage")
	public String cafeBoard() throws Exception{
		
		return "/board/listPage";
	}
}
