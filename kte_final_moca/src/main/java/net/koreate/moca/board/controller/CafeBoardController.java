package net.koreate.moca.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import lombok.RequiredArgsConstructor;
import net.koreate.common.utils.PageMaker;
import net.koreate.common.utils.SearchCriteria;
import net.koreate.moca.board.service.CafeBoardService;
import net.koreate.moca.board.vo.CafeBoardVO;

@Controller
@RequiredArgsConstructor
public class CafeBoardController {
	
	private final CafeBoardService cs;
	
	// 게시글 목록 페이지
	@GetMapping("/board/listPage")
	public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		List<CafeBoardVO> list = cs.listReply(cri);
		System.out.println(list);
		PageMaker pm = cs.getPageMaker(cri);
		model.addAttribute("list",list);
		model.addAttribute("pm",pm);
		return "/board/listPage";
	}
	
	// 게시글 작성 페이지
	@GetMapping("register")
	public String register() {
		return "/board/register";
	}
}
