package net.koreate.moca.cafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.service.CafeLikeService;
import net.koreate.moca.cafe.service.CafeService;
import net.koreate.moca.cafe.vo.CafeLikeVO;
import net.koreate.moca.cafe.vo.CafeVO;


@Controller
@RequestMapping("/cafe/*")
@RequiredArgsConstructor
public class CafeController {

	private final CafeService cs;
	private final CafeLikeService cls;
	
	@GetMapping("cafeMain")
	public String CafeMain() {
		return "cafe/cafeMain";
	}
	
	@GetMapping("cafeDetail/{no}")
	public String CafeDetail(
			@PathVariable(name="no") int no, CafeLikeVO vo,
			Model model
			) throws Exception{
		CafeVO cafeVO =cs.read(no);
		model.addAttribute("cafeVO",cafeVO);
		
		
		CafeLikeVO cafelikeVO = cls.read(vo);
		model.addAttribute("cafelikeVO",cafelikeVO);
		return "cafe/cafeDetail";
	}
			
	
}
