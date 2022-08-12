package net.koreate.moca.board.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import net.koreate.common.utils.PageMaker;
import net.koreate.common.utils.SearchCriteria;
import net.koreate.common.utils.SearchPageMaker;
import net.koreate.moca.board.dao.CafeBoardDAO;
import net.koreate.moca.board.vo.CafeBoardVO;

@Service
@RequiredArgsConstructor
public class CafeBoardServiceImpl implements CafeBoardService {
	
	private final CafeBoardDAO dao;
	
	@Transactional
	@Override
	public void register(CafeBoardVO vo) {
		dao.regist(vo);
	}

	@Override
	public CafeBoardVO read(int no) {
		CafeBoardVO vo = dao.read(no);
		return vo;
	}

	@Override
	public void updateCnt(int no) {
		dao.updateCnt(no);
	}

	@Override
	public void replyRegister(CafeBoardVO vo) {
		dao.updateReply(vo);
		vo.setSeq(vo.getSeq()+1);
		vo.setDepth(vo.getDepth()+1);
		dao.replyRegister(vo);
	}

	@Override
	public void modify(CafeBoardVO vo) {
		dao.modify(vo);
	}

	@Override
	public void remove(int no) {
		dao.remove(no);
	}
	
	@Override
	public List<CafeBoardVO> listReply(SearchCriteria scri) {
		List<CafeBoardVO> list = dao.listReply(scri);
		return list;
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria scri) {
		int totalCount = dao.listCount(scri);
		PageMaker pm = new SearchPageMaker();
		pm.setCri(scri);
		pm.setDisplayPageNum(10);
		pm.setTotalCount(totalCount);
		return pm;
	}


}
