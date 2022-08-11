package net.koreate.moca.cafe.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.dao.CafeScheduleDAO;
import net.koreate.moca.cafe.vo.CafeScheduleVO;

@Service
@RequiredArgsConstructor
public class CafeScheduleServiceImpl implements CafeScheduleService {

	private final CafeScheduleDAO dao;
	
	@Override
	public void regist(CafeScheduleVO vo) throws Exception {
		dao.regist(vo);
	}

	@Override
	public CafeScheduleVO read(int cafe_no) throws Exception {
		return dao.read(cafe_no);
	}

	@Override
	public void update(CafeScheduleVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void delete(int no) throws Exception {
		dao.delete(no);
		
	}


}
