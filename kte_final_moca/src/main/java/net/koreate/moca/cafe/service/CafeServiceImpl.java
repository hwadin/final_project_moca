package net.koreate.moca.cafe.service;

import java.util.List;


import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.dao.CafeDAO;
import net.koreate.moca.cafe.vo.CafeSearchVO;
import net.koreate.moca.cafe.vo.CafeVO;

@Service
@RequiredArgsConstructor
public class CafeServiceImpl implements CafeService {

	private final CafeDAO dao;

	@Override
	public void regist(CafeVO vo) throws Exception {
		dao.regist(vo);
	}

	@Override
	public CafeVO read(int no) throws Exception {
		return dao.read(no);
	}

	@Override
	public void update(CafeVO vo) throws Exception {
		dao.update(vo);

	}

	@Override
	public void delete(int no) throws Exception {
		dao.delete(no);

	}

	@Override
	public List<CafeVO> cafeList(int index) throws Exception {
		return dao.cafeList(index);
	}

	@Override
	public void updatelikenum(int no) throws Exception {
		dao.updatelikenum(no);

	}

	@Override
	public List<CafeVO> findByKeyword(String keyword) {
		return dao.findByKeyword(keyword);
	}




}
