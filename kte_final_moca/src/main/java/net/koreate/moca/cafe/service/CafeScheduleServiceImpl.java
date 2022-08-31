package net.koreate.moca.cafe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.dao.CafeScheduleDAO;
import net.koreate.moca.cafe.vo.CafeScheduleVO;
import net.koreate.moca.cafe.vo.CafeSearchVO;

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

	@Override
	public List<CafeScheduleVO> cafesearchlist(CafeSearchVO vo) {
		
		return dao.cafesearchlist(vo);
	}


}
