package net.koreate.moca.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import net.koreate.moca.reservation.vo.CafeDTO;
import net.koreate.moca.reservation.vo.ReservationVO;

public interface ReservationDAO {

	// 카페 목록 검색
	@Select("SELECT c.*, avg(r.star) as star, 'y' as onsale FROM tbl_cafe c LEFT JOIN tbl_cafe_schedule s ON c.no = s.cno LEFT JOIN tbl_cafe_review r ON c.no = r.cafe_no WHERE (date_format(#{time}, '%Y/%m/%d') BETWEEN s.start_date AND s.end_date) AND (date_format(#{time}, '%H:%i') BETWEEN s.start_time AND s.end_time) AND (c.addr LIKE concat('%',#{location},'%') OR c.addr_detail LIKE concat('%',#{location},'%')) GROUP BY c.no UNION SELECT c.*, avg(r.star) as star, 'n' as onsale FROM tbl_cafe c 	LEFT JOIN tbl_cafe_schedule s ON c.no = s.cno LEFT JOIN tbl_cafe_review r ON c.no = r.cafe_no WHERE NOT ((date_format(#{time}, '%Y/%m/%d') BETWEEN s.start_date AND s.end_date) AND (date_format(#{time}, '%H:%i') BETWEEN s.start_time AND s.end_time)) OR s.start_date is null AND (c.addr LIKE concat('%',#{location},'%') OR c.addr_detail LIKE concat('%',#{location},'%')) GROUP BY c.no")
	List<CafeDTO> cafeList(ReservationVO vo) throws Exception;

}
