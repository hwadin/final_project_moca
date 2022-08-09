package net.koreate.moca.schedule.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.schedule.dao.ScheduleDAO;
import net.koreate.moca.schedule.vo.ScheduleVO;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {

	private final ScheduleDAO dao;

	@Override
	public void regist(ScheduleVO vo) throws Exception {

	}

	@Override
	public List<ScheduleVO> monthScheduleList(Date today) throws Exception {
		return null;
	}

	@Override
	public List<ScheduleVO> dayScheduleList(Date day) throws Exception {
		return null;
	}

	@Override
	public ScheduleVO read(int no) throws Exception {
		return null;
	}

	@Override
	public void update(ScheduleVO vo) throws Exception {

	}

	@Override
	public void delete(int no) throws Exception {

	}

}
