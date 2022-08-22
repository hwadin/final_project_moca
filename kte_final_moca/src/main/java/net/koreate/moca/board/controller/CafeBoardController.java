package net.koreate.moca.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import net.koreate.common.utils.PageMaker;
import net.koreate.moca.board.service.CafeBoardService;
import net.koreate.moca.board.vo.CafeBoardVO;
import net.koreate.moca.common.utils.CafeSearchCriteria;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/")
public class CafeBoardController {
	
	private final CafeBoardService cs;
	
	// 게시글 목록 페이지
	@GetMapping("listPage")
	public String listPage(@ModelAttribute("cri") CafeSearchCriteria csri, Model model) throws Exception{
		model.addAttribute("cafe_no", csri.getCafe_no());
		List<CafeBoardVO> list = cs.listReply(csri);
		System.out.println(list);
		PageMaker pm = cs.getPageMaker(csri);
		model.addAttribute("list",list);
		model.addAttribute("pm",pm);
		return "/board/listPage";
	}
	
	
	@GetMapping("register")
	public String register() {
		return "/board/register";
	}
	
	// 게시글 작성 페이지
	@PostMapping("register")
	public String registerPage(
			CafeBoardVO vo,
			RedirectAttributes rttr
			) throws Exception{
		String msg = cs.register(vo);
		rttr.addFlashAttribute("result",msg);
		return "redirect:/board/listPage";
	}
}
