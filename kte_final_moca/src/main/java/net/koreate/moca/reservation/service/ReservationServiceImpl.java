package net.koreate.moca.reservation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.vo.CafeReviewVO;
import net.koreate.moca.manage.vo.ManageReservationDTO;
import net.koreate.moca.reservation.dao.ReservationDAO;
import net.koreate.moca.reservation.vo.CafeDTO;
import net.koreate.moca.reservation.vo.ReservationDTO;
import net.koreate.moca.reservation.vo.ReservationMenuVO;
import net.koreate.moca.reservation.vo.ReservationVO;

@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService {

	private final ReservationDAO dao;

	@Override
	public List<CafeDTO> cafeList(ReservationVO vo) throws Exception {
		return dao.cafeList(vo);
	}

	@Transactional
	@Override
	public void regist(ReservationVO reservation) throws Exception {
		dao.regist(reservation);

		for (ReservationMenuVO menu : reservation.getReservationMenu()) {
			menu.setReservation_no(reservation.getNo());
			dao.menuRegist(menu);
		}

		dao.updateInvitation(reservation);
		dao.refreshParticipant(reservation);
	}

	@Override
	public List<ReservationDTO> reservList(int member_no) throws Exception {
		return dao.reservList(member_no);
	}

	@Override
	public Map<String, Object> detail(int no, String code) throws Exception {
		Map<String, Object> map = new HashMap<>();

		List<String> participants = dao.getParticipants(code);
		List<ReservationMenuVO> menus = dao.getMenus(no);

		map.put("participants", participants);
		map.put("menus", menus);

		return map;
	}

	@Transactional
	@Override
	public void delete(int no, String code) throws Exception {
		dao.delete(no);
		dao.updateInvitationBack(code);
	}

	@Override
	public List<ReservationDTO> pastReservList(int member_no) {
		return dao.pastReservList(member_no);
	}

	@Override
	public void registReview(CafeReviewVO vo) throws Exception {
		dao.registReview(vo);
		dao.updateReviewOrigin(vo);
	}

	@Override
	public CafeReviewVO review(int no) throws Exception {
		return dao.review(no);
	}

	@Override
	public List<ManageReservationDTO> manageReservList(int no) throws Exception {
		return dao.manageReservList(no);
	}

	@Override
	public void acceptReserv(int no) throws Exception {
		dao.acceptReserv(no);
	}

	@Transactional
	@Override
	public void expireReserv(int no) throws Exception {
		dao.expireReserv(no);
		ReservationVO vo = dao.getReservByNo(no);
		dao.expireInvite(vo);
	}

	@Override
	public void rejectReserv(int no) throws Exception {
		dao.rejectReserv(no);
		ReservationVO vo = dao.getReservByNo(no);
		dao.rejectInvite(vo);
	}

}
