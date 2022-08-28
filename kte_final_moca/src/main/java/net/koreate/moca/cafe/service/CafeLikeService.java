package net.koreate.moca.cafe.service;

import net.koreate.moca.cafe.vo.CafeLikeVO;

public interface CafeLikeService {

	// 라이크 증가
	void update(CafeLikeVO vo) throws Exception;
	
	// 라이크 취소
	void cancel(CafeLikeVO vo) throws Exception;
	
	// 라이크 개수 읽어오기 (카페 번호로 조회)
	CafeLikeVO read(CafeLikeVO vo) throws Exception;
	
	
}
