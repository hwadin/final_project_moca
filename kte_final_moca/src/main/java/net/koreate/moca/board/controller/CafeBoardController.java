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
	public String listPage(@ModelAttribute("cri") CafeSearchCriteria csri, Model model) throws Exception {
		model.addAttribute("cafe_no", csri.getCafe_no());
		List<CafeBoardVO> list = cs.listReply(csri);
//		System.out.println(list);
		PageMaker pm = cs.getPageMaker(csri);
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
		return "/board/listPage";
	}

	@GetMapping("register")
	public String register(CafeBoardVO vo, Model model) {
		model.addAttribute("cafe_no", vo.getCafe_no());
		return "/board/register";
	}

	// 게시글 작성 페이지
	@PostMapping("register")
	public String registerPage(CafeBoardVO vo, RedirectAttributes rttr) throws Exception {
		String msg = cs.register(vo);
		rttr.addFlashAttribute("result", msg);
		return "redirect:/board/listPage?cafe_no=" + vo.getCafe_no();
	}

	@GetMapping("readPage")
	public String readPage(int no, RedirectAttributes rttr) throws Exception {
		// 조회수 증가
		cs.updateCnt(no);
		rttr.addAttribute("no", no);
		return "redirect:/board/read";
	}

	@GetMapping("read")
	public String read(int no, Model model) throws Exception {
		CafeBoardVO vo = cs.read(no);
		model.addAttribute("board", vo);
		return "/board/readPage";
	}

	// 게시글 삭제 요청
	@PostMapping("remove")
	public String remove(int no // 삭제해야할 게시글 번호
	) throws Exception {
		CafeBoardVO vo = cs.read(no);
		cs.remove(no);
		return "redirect:/board/listPage?cafe_no=" + vo.getCafe_no();
	}

	// 수정 페이지 요청
	@GetMapping("modifyPage")
	public String modifyPage(int no, Model model) throws Exception {
		CafeBoardVO vo = cs.read(no);
		model.addAttribute("board", vo);
		return "/board/modifyPage";
	}

	// 게시글 수정 완료 요청
	@PostMapping("modifyPage")
	public String modifyPage(CafeBoardVO vo, // 수정할 게시글 정보
			RedirectAttributes rttr) throws Exception {
		// 게시글 정보 수정
		cs.modify(vo);
		System.out.println(vo);
		rttr.addAttribute("no", vo.getNo());
		return "redirect:/board/read";
	}

	@GetMapping("wishList")
	public String wishList() {
		return "/board/wishList";
	}
}
