package net.koreate.moca.cafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/cafe/*")

public class CafeController {


	@GetMapping("cafeMain")
	public String CafeMain() {
		return "cafe/cafeMain";
	}
	
	@GetMapping("cafeDetail")
	public String CafeDetail() {
		return "cafe/cafeDetail";
	}
	

	
}
