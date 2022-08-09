package net.koreate.moca.schedule.service;

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
		dao.regist(vo);
	}

	@Override
	public List<ScheduleVO> monthScheduleList(ScheduleVO vo) throws Exception {
		return dao.monthScheduleList(vo);
	}

	@Override
	public List<ScheduleVO> dayScheduleList(ScheduleVO vo) throws Exception {
		return dao.dayScheduleList(vo);
	}

	@Override
	public ScheduleVO read(int no) throws Exception {
		return dao.read(no);
	}

	@Override
	public void update(ScheduleVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int no) throws Exception {
		dao.delete(no);
	}

}
