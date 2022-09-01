package net.koreate.moca.reservation.service;

import java.util.List;
import java.util.Map;

import net.koreate.moca.reservation.vo.CafeDTO;
import net.koreate.moca.reservation.vo.ReservationDTO;
import net.koreate.moca.reservation.vo.ReservationVO;

public interface ReservationService {

	// 사용자가 선택한 날짜와 장소에 대한 카페 목록 검색
	List<CafeDTO> cafeList(ReservationVO vo) throws Exception;

	void regist(ReservationVO reservation) throws Exception;

	List<ReservationDTO> reservList(int member_no) throws Exception;

	Map<String, Object> detail(int no, String code) throws Exception;

	void delete(int no, String code) throws Exception;

	List<ReservationDTO> pastReservList(int member_no);

}
