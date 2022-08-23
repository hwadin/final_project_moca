package net.koreate.moca.cafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import net.koreate.common.utils.SearchCriteria;
import net.koreate.moca.cafe.service.CafeService;


@Controller
@RequestMapping("/cafe/*")
@RequiredArgsConstructor
public class CafeController {

	private final CafeService cs;

	@GetMapping("cafeMain")
	public String CafeMain() {
		return "cafe/cafeMain";
	}
	
	@GetMapping("cafeDetail")
	public String CafeDetail() {
		return "cafe/cafeDetail";
	}
	


	
}
