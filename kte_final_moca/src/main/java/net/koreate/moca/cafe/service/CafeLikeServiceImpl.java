package net.koreate.moca.cafe.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.dao.CafeLikeDAO;
import net.koreate.moca.cafe.vo.CafeLikeVO;

@Service
@RequiredArgsConstructor
public class CafeLikeServiceImpl implements CafeLikeService {

	private final CafeLikeDAO dao;


	@Override
	public CafeLikeVO read(CafeLikeVO vo) throws Exception {
		return dao.read(vo);
	}

	@Override
	public void update(int cno) throws Exception {
		dao.update(cno);
		
	}
	@Override
	public void cancel(int cno) throws Exception {
		dao.cancel(cno);
	}

}
