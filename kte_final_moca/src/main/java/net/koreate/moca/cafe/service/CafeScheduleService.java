package net.koreate.moca.cafe.service;

import java.util.List;

import net.koreate.moca.cafe.vo.CafeScheduleVO;
import net.koreate.moca.cafe.vo.CafeSearchVO;
import net.koreate.moca.cafe.vo.CafeVO;



public interface CafeScheduleService {

	// 카페 스케줄 등록	
	void regist(CafeScheduleVO vo) throws Exception;
	
	// 카페 스케쥴 읽어오기 ( 카페 번호로 조회)
	CafeScheduleVO read(int cno) throws Exception;
	
	// 카페 스케줄 수정
	void update(CafeScheduleVO vo) throws Exception;
	
	// 카페 스케줄 삭제(스케줄 번호로 조회)
	void delete(int no) throws Exception; 

	// Location 으로 카페 검색 
	List<CafeVO> searchListbyLo(CafeSearchVO vo);
	
	// DATE 로 카페 검색
	List<CafeVO> searchListbyDt(CafeSearchVO vo);
	
	// Location & Date 
	List<CafeVO> searchListbyLD(CafeSearchVO vo);
}
