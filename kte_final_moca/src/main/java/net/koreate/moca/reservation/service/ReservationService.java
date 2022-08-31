package net.koreate.moca.reservation.service;

import java.util.List;

import net.koreate.moca.reservation.vo.CafeDTO;
import net.koreate.moca.reservation.vo.ReservationVO;

public interface ReservationService {

	// 사용자가 선택한 날짜와 장소에 대한 카페 목록 검색
	List<CafeDTO> cafeList(ReservationVO vo) throws Exception;

}
