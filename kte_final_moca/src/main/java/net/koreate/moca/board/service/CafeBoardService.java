package net.koreate.moca.board.service;

import java.util.List;

import net.koreate.common.utils.PageMaker;
import net.koreate.common.utils.SearchCriteria;
import net.koreate.moca.board.vo.CafeBoardVO;

public interface CafeBoardService {
	
	public void register(CafeBoardVO vo);
	
	public CafeBoardVO read(int no);
	
	public void updateCnt(int no);
	
	public void replyRegister(CafeBoardVO vo);
	
	public void modify(CafeBoardVO vo);
	
	public void remove(int no);
	
	public List<CafeBoardVO> listReply(SearchCriteria scri);
	
	public PageMaker getPageMaker(SearchCriteria scri);
}
