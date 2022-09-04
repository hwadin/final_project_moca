package net.koreate.moca.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.cafe.vo.CafeReviewVO;
import net.koreate.moca.manage.vo.ManageReservationDTO;
import net.koreate.moca.reservation.vo.CafeDTO;
import net.koreate.moca.reservation.vo.ReservationDTO;
import net.koreate.moca.reservation.vo.ReservationMenuVO;
import net.koreate.moca.reservation.vo.ReservationVO;

public interface ReservationDAO {

	// 카페 목록 검색
	@Select("SELECT c.*, avg(r.star) as star, 'y' as onsale FROM tbl_cafe c LEFT JOIN tbl_cafe_schedule s ON c.no = s.cno LEFT JOIN tbl_cafe_review r ON c.no = r.cafe_no WHERE (date_format(#{time}, '%Y/%m/%d') BETWEEN s.start_date AND s.end_date) AND (date_format(#{time}, '%H:%i') BETWEEN s.start_time AND s.end_time) AND (c.addr LIKE concat('%',#{location},'%') OR c.addr_detail LIKE concat('%',#{location},'%')) GROUP BY c.no UNION SELECT c.*, avg(r.star) as star, 'n' as onsale FROM tbl_cafe c 	LEFT JOIN tbl_cafe_schedule s ON c.no = s.cno LEFT JOIN tbl_cafe_review r ON c.no = r.cafe_no WHERE ((NOT ((date_format(#{time}, '%Y/%m/%d') BETWEEN s.start_date AND s.end_date) AND (date_format(#{time}, '%H:%i') BETWEEN s.start_time AND s.end_time))) OR s.start_date is null) AND (c.addr LIKE concat('%',#{location},'%') OR c.addr_detail LIKE concat('%',#{location},'%')) GROUP BY c.no")
	List<CafeDTO> cafeList(ReservationVO vo) throws Exception;

	@Insert("INSERT INTO tbl_reservation(invite_code, cafe_no, time, isDutch, totalPrice) VALUES(#{invite_code}, #{cafe_no}, #{time}, #{dutch}, #{totalPrice})")
	@Options(useGeneratedKeys = true, keyProperty = "no")
	void regist(ReservationVO reservation) throws Exception;

	@Insert("INSERT INTO tbl_reservation_menu(reservation_no, menu_no, amount) VALUES(#{reservation_no}, #{menu_no}, #{amount})")
	void menuRegist(ReservationMenuVO menu) throws Exception;

	@Update("UPDATE tbl_invite SET isReserve = 1 WHERE code = #{invite_code}")
	void updateInvitation(ReservationVO reservation);

	@Select("SELECT DISTINCT r.no, i.code, i.title, c.name cafe_name, r.time, r.isAccepted, r.isRejected, r.isDutch, c.addr, c.addr_detail, m.name member_name, r.totalPrice, c.no cafe_no "
			+ "FROM tbl_invite i LEFT JOIN tbl_invite_participant p ON i.code = p.code INNER JOIN tbl_reservation r "
			+ "	ON i.code = r.invite_code INNER JOIN tbl_cafe c ON r.cafe_no = c.no INNER JOIN tbl_member m ON i.member_no = m.no "
			+ "WHERE (i.member_no = #{member_no} OR p.participant_no = #{member_no}) AND (i.isReserve = true OR r.isRejected = true)AND i.isExpired = false AND r.time > now()")
	List<ReservationDTO> reservList(int member_no);

	@Select("SELECT DISTINCT r.no, i.code, i.title, c.name cafe_name, r.time, r.isAccepted, r.isExpired, r.isRejected, r.isDutch, c.addr, c.addr_detail, m.name member_name, r.totalPrice, cr.no AS review_no, c.no cafe_no  "
			+ "FROM tbl_invite i LEFT JOIN tbl_invite_participant p ON i.code = p.code INNER JOIN tbl_reservation r "
			+ "	ON i.code = r.invite_code INNER JOIN tbl_cafe c ON r.cafe_no = c.no INNER JOIN tbl_member m ON i.member_no = m.no LEFT JOIN tbl_cafe_review cr ON c.no = cr.cafe_no AND cr.member_no=#{member_no} AND r.invite_code = cr.invite_code"
			+ " WHERE (i.member_no = #{member_no} OR p.participant_no = #{member_no}) AND (i.isReserve = true OR r.isRejected = true) AND r.time < now()")
	List<ReservationDTO> pastReservList(int member_no);

	@Select("SELECT name FROM tbl_invite_participant p INNER JOIN tbl_member m ON p.participant_no = m.no WHERE code=#{code} AND p.isAccepted = 1")
	List<String> getParticipants(String code);

	@Select("SELECT cm.name, cm.price, cm.discount, rm.amount FROM tbl_reservation_menu rm INNER JOIN tbl_cafe_menu cm ON rm.menu_no = cm.no WHERE rm.reservation_no=#{no}")
	List<ReservationMenuVO> getMenus(int no);

	@Delete("DELETE FROM tbl_reservation WHERE no = #{no}")
	void delete(int no) throws Exception;

	@Update("UPDATE tbl_invite SET isReserve = 0 WHERE code = #{code}")
	void updateInvitationBack(String code) throws Exception;

	@Insert("INSERT INTO tbl_cafe_review(cafe_no, member_no, content, star, invite_code) VALUES(#{cafe_no}, #{member_no}, #{content}, #{star}, #{invite_code})")
	@Options(useGeneratedKeys = true, keyProperty = "no")
	void registReview(CafeReviewVO vo) throws Exception;

	@Update("UPDATE tbl_cafe_review SET origin = #{no} WHERE no=#{no}")
	void updateReviewOrigin(CafeReviewVO vo);

	@Select("SELECT m.name, m.profile_url, r.* FROM tbl_member m INNER JOIN tbl_cafe_review r ON r.member_no = m.no WHERE r.no=#{no}")
	CafeReviewVO review(int no) throws Exception;

	@Select("SELECT m.name member_name, c.name cafe_name, c.addr, c.addr_detail, i.title, r.*, count(p.participant_no) participant_count FROM tbl_reservation r JOIN tbl_invite i ON r.invite_code = i.code JOIN tbl_member m ON i.member_no = m.no LEFT JOIN tbl_invite_participant p ON i.code = p.code and p.isAccepted =1 JOIN tbl_cafe c ON r.cafe_no = c.no WHERE cafe_no = (SELECT no FROM tbl_cafe WHERE owner_no=#{no}) GROUP BY r.no")
	List<ManageReservationDTO> manageReservList(int no);

	@Update("UPDATE tbl_reservation SET isAccepted = 1 WHERE no = #{no}")
	void acceptReserv(int no);

	@Update("UPDATE tbl_reservation SET isExpired = 1 WHERE no = #{no}")
	void expireReserv(int no);

	@Select("SELECT * FROM tbl_reservation WHERE no = #{no}")
	ReservationVO getReservByNo(int no);

	@Update("UPDATE tbl_invite SET isExpired = 1 WHERE code=#{invite_code}")
	void expireInvite(ReservationVO vo);

	@Update("UPDATE tbl_reservation SET isRejected = 1 WHERE no = #{no}")
	void rejectReserv(int no);

	@Update("UPDATE tbl_invite SET isReserve = 0 WHERE code=#{invite_code}")
	void rejectInvite(ReservationVO vo);

	// 예약 신청 시 해당 코드의 미수락 상태 초대 멤버들 제거
	@Delete("DELETE FROM tbl_invite_participant WHERE code = #{invite_code} AND isAccepted is null")
	void refreshParticipant(ReservationVO reservation);

}
