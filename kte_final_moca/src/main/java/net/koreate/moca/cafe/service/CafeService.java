package net.koreate.moca.cafe.service;

import net.koreate.moca.cafe.vo.CafeVO;

public interface CafeService {

	// 카페 정보 등록
	void regist(CafeVO vo) throws Exception;
	
	// 카페  정보 읽어오기 (오너 번호로 조회)  
	CafeVO read(int owner_no) throws Exception;
	
	// 카페 정보 수정
	void update(CafeVO vo) throws Exception;
	
	// 카페 정보 삭제(카페 번호로 조회)
	void delete(int no) throws Exception; 
	
	
	
}
