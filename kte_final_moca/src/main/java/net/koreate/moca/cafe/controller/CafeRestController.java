package net.koreate.moca.cafe.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.service.CafeLikeService;
import net.koreate.moca.cafe.service.CafeMenuService;
import net.koreate.moca.cafe.service.CafeScheduleService;
import net.koreate.moca.cafe.service.CafeService;
import net.koreate.moca.cafe.vo.CafeLikeVO;
import net.koreate.moca.cafe.vo.CafeMenuVO;
import net.koreate.moca.cafe.vo.CafeScheduleVO;
import net.koreate.moca.cafe.vo.CafeSearchVO;
import net.koreate.moca.cafe.vo.CafeVO;

@RestController
@RequestMapping("/cafe/api/*")
@RequiredArgsConstructor 
public class CafeRestController {

	private final CafeMenuService cms;
	private final CafeService cs;
	private final CafeLikeService cls;
	private final CafeScheduleService css;
	
	
	@GetMapping("cafeList")
	public ResponseEntity<List<CafeVO>> cafeList(int index){
		List<CafeVO> cafelist = null;
		try {
			cafelist = cs.cafeList(index);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(cafelist,HttpStatus.OK);
	}
	
	@GetMapping("searchListbyLo")
	public ResponseEntity<List<CafeVO>> searchListbyLo(CafeSearchVO vo){
		List<CafeVO> searchListbyLo = null;
		try {
			searchListbyLo = css.searchListbyLo(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(searchListbyLo,HttpStatus.OK);
	}
	
	@GetMapping("searchListbyDt")
	public ResponseEntity<List<CafeVO>> searchListbyDt(CafeSearchVO vo){
		List<CafeVO> searchListbyDt = null;
		try {
			searchListbyDt = css.searchListbyDt(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(searchListbyDt,HttpStatus.OK);
	}
	
	@GetMapping("searchListbyLD")
	public ResponseEntity<List<CafeVO>> searchListbyLD(CafeSearchVO vo){
		List<CafeVO> searchListbyLD = null;
		try {
			searchListbyLD = css.searchListbyLD(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(searchListbyLD,HttpStatus.OK);
	}
	
	@GetMapping("cafeMenuList")
	public ResponseEntity<List<CafeMenuVO>> cafeMenuList(int cafe_no){
		List<CafeMenuVO> menulist = null;
		try {
			menulist = cms.menuList(cafe_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(menulist,HttpStatus.OK);
	}
	
	@GetMapping("cafeDetail")
	public ResponseEntity<CafeVO> cafeDetail(int no){
		CafeVO cafevo = null;
		try {
			cafevo = cs.read(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(cafevo,HttpStatus.OK);
	} 
	
	@GetMapping("cafeLike")
	public ResponseEntity<CafeLikeVO> cafeLike(CafeLikeVO vo){
		CafeLikeVO likevo = null;
		try {
			likevo = cls.read(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(likevo,HttpStatus.OK);
	}
	
	@PatchMapping("/")
	public ResponseEntity<String> update(CafeLikeVO vo) {
		try {
			cls.update(vo);
			return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}
	}

		
}
