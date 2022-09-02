package net.koreate.moca.cafe.service;

import java.util.List;

import net.koreate.moca.cafe.vo.CafeSearchVO;
import net.koreate.moca.cafe.vo.CafeVO;

public interface CafeService {

	// 카페 정보 등록
	void regist(CafeVO vo) throws Exception;

	// 카페 상세 정보 읽어오기 (카페 번호로 조회)
	CafeVO read(int no) throws Exception;

	// 카페 리스트 읽어오기(인덱스 번호로 조회)
	List<CafeVO> cafeList(int index) throws Exception;
	
	// 카페 정보 수정
	void update(CafeVO vo) throws Exception;

	// 카페 좋아요 수 증가
	void updatelikenum(int no) throws Exception;

	// 카페 정보 삭제(카페 번호로 조회)
	void delete(int no) throws Exception;

	List<CafeVO> findByKeyword(String keyword);

	

	

}
