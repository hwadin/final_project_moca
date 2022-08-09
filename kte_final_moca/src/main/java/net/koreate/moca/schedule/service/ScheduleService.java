package net.koreate.moca.schedule.service;

import java.util.List;

import net.koreate.moca.schedule.vo.ScheduleVO;

public interface ScheduleService {

//	Schedule 등록
	void regist(ScheduleVO vo) throws Exception;

//	오늘 날짜와 사용자 번호를 입력 받아 해당 사용자의 오늘이 포함된 월의 일정 목록을 가져옴
	List<ScheduleVO> monthScheduleList(ScheduleVO vo) throws Exception;

//	지정된 날짜의 목록을 가져옴
	List<ScheduleVO> dayScheduleList(ScheduleVO vo) throws Exception;

//	일정 상세 보기(일정 번호로 조회)
	ScheduleVO read(int no) throws Exception;

//	일정 수정
	void update(ScheduleVO vo) throws Exception;

//	일정 삭제
	void delete(int no) throws Exception;

}
