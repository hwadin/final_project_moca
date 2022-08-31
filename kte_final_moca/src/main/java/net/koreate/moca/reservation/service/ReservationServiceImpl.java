package net.koreate.moca.reservation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.reservation.dao.ReservationDAO;
import net.koreate.moca.reservation.vo.CafeDTO;
import net.koreate.moca.reservation.vo.ReservationVO;

@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService {

	private final ReservationDAO dao;

	@Override
	public List<CafeDTO> cafeList(ReservationVO vo) throws Exception {
		return dao.cafeList(vo);
	}

}
