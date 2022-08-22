package net.koreate.moca.board.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import net.koreate.common.utils.PageMaker;
import net.koreate.common.utils.SearchPageMaker;
import net.koreate.moca.board.dao.CafeBoardDAO;
import net.koreate.moca.board.vo.CafeBoardVO;
import net.koreate.moca.common.utils.CafeSearchCriteria;

@Service
@RequiredArgsConstructor
public class CafeBoardServiceImpl implements CafeBoardService {
	
	private final CafeBoardDAO dao;
	
	@Transactional
	@Override
	public String register(CafeBoardVO vo) {
		int result = dao.regist(vo);
		String msg = "작성 성공!";
		if(result == 0) {
			msg = "작성 실패!";
		}
		return msg;
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
	public List<CafeBoardVO> listReply(CafeSearchCriteria csri) {
		List<CafeBoardVO> list = dao.listReply(csri);
		return list;
	}
	
	// < > 특수문자 치환
		public String replaceScript(String text) {
			// < == &lt;
			// > == &gt;
			text = text.replaceAll("<", "&lt");
			text = text.replaceAll(">", "&gt");
			return text;
		}
		
		// 삽입 또는 수정될 객체 정보에서 특수문자 치환
		public CafeBoardVO replace(CafeBoardVO vo) {
			vo.setTitle(replaceScript(vo.getTitle()));
			vo.setWriter(replaceScript(vo.getWriter()));
			vo.setContent(replaceScript(vo.getContent()));
			return vo;
		}
		
	@Override
	public PageMaker getPageMaker(CafeSearchCriteria csri) {
		int totalCount = dao.listCount(csri);
		PageMaker pm = new SearchPageMaker();
		pm.setCri(csri);
		pm.setDisplayPageNum(10);
		pm.setTotalCount(totalCount);
		return pm;
	}


}
