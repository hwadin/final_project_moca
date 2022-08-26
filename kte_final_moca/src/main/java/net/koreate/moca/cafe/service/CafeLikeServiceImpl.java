package net.koreate.moca.cafe.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.dao.CafeDAO;
import net.koreate.moca.cafe.dao.CafeLikeDAO;
import net.koreate.moca.cafe.vo.CafeLikeVO;

@Service
@RequiredArgsConstructor
public class CafeLikeServiceImpl implements CafeLikeService {

	private final CafeLikeDAO dao;
	private final CafeDAO cafeDAO;

	@Transactional
	@Override
	public CafeLikeVO read(CafeLikeVO vo) throws Exception {
		return dao.read(vo);		
	}

	@Override
	public void update(CafeLikeVO vo) throws Exception {
		// vo => mno, cno
		// 1) 한 번도 누르지 않은 사람인지 확인
		CafeLikeVO clvo = dao.likeCheck(vo);
		if(clvo == null) {
			dao.insertLike(vo);
			cafeDAO.updatelikenum(vo.getCno());
		} else {
			// 2) 한 번 눌렀던 사람이라면 테이블에서 수정
			if(clvo.getLike_check() == 1) {
				dao.cancel(clvo);
				cafeDAO.cancellikenum(vo.getCno());
			} else {
				dao.update(clvo);
				cafeDAO.updatelikenum(vo.getCno());
			}
		}
	}

	@Override
	public void cancel(CafeLikeVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
