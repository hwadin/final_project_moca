package net.koreate.moca.schedule.service;

import java.util.Date;
import java.util.List;

import net.koreate.moca.schedule.vo.ScheduleVO;

public interface ScheduleService {

//	Schedule 등록
	void regist(ScheduleVO vo) throws Exception;

//	오늘 날짜를 입력 받아 해당 월의 일정 목록을 가져옴
	List<ScheduleVO> monthScheduleList(Date today) throws Exception;

//	지정된 날짜의 목록을 가져옴
	List<ScheduleVO> dayScheduleList(Date day) throws Exception;

//	일정 상세 보기(일정 번호로 조회)
	ScheduleVO read(int no) throws Exception;

//	일정 수정
	void update(ScheduleVO vo) throws Exception;

//	일정 삭제
	void delete(int no) throws Exception;

}
