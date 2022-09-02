package net.koreate.moca.cafe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.dao.CafeScheduleDAO;
import net.koreate.moca.cafe.vo.CafeScheduleVO;
import net.koreate.moca.cafe.vo.CafeSearchVO;
import net.koreate.moca.cafe.vo.CafeVO;

@Service
@RequiredArgsConstructor
public class CafeScheduleServiceImpl implements CafeScheduleService {

	private final CafeScheduleDAO dao;
	
	@Override
	public void regist(CafeScheduleVO vo) throws Exception {
		dao.regist(vo);
	}

	@Override
	public CafeScheduleVO read(int cno) throws Exception {
		return dao.read(cno);
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
	public List<CafeVO> searchListbyLo(CafeSearchVO vo) {
		return dao.searchListbyLo(vo);
	}

	@Override
	public List<CafeVO> searchListbyDt(CafeSearchVO vo) {
		return dao.searchListbyDt(vo);
	}

	@Override
	public List<CafeVO> searchListbyLD(CafeSearchVO vo) {
		return dao.searchListbyLD(vo);
	}

}
