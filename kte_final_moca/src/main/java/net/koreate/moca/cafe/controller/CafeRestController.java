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
	
	@GetMapping("cafeSearchList")
	public ResponseEntity<List<CafeVO>> cafeSearchList(CafeSearchVO vo){
		List<CafeVO> cafeSearchList = null;
		try {
			cafeSearchList = cs.cafesearchList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(cafeSearchList,HttpStatus.OK);
	}
	
	@GetMapping("cafeSearchByDate")
	public ResponseEntity<List<CafeScheduleVO>> cafesearchlist(CafeSearchVO vo){
		List<CafeScheduleVO> cafesearchlist = null;
		try {
			cafesearchlist = css.cafesearchlist(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(cafesearchlist,HttpStatus.OK);
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
