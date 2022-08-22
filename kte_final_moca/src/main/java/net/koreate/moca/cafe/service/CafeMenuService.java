package net.koreate.moca.cafe.service;

import java.util.List;

import net.koreate.moca.cafe.vo.CafeMenuVO;

public interface CafeMenuService {

	// 카페 메뉴 등록
	void regist(CafeMenuVO vo) throws Exception;
	
	// 카페 메뉴 목록 가져옴
	List<CafeMenuVO> menuList(CafeMenuVO vo) throws Exception;
	
	// 카페 메뉴 읽어오기 ( 메뉴 번호로 조회)
	CafeMenuVO read(int no) throws Exception;
	
	// 메뉴 정보 수정
	void update(CafeMenuVO vo) throws Exception;
	
	// 메뉴 정보 삭제 ( 메뉴 번호로 조회)
	void delete(int no) throws Exception;
	
}
