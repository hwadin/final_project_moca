package net.koreate.moca.board.service;

import java.util.List;

import net.koreate.common.utils.PageMaker;
import net.koreate.moca.board.vo.CafeBoardVO;
import net.koreate.moca.common.utils.CafeSearchCriteria;

public interface CafeBoardService {
	
	public String register(CafeBoardVO vo);
	
	public CafeBoardVO read(int no);
	
	public void updateCnt(int no);
	
	public void replyRegister(CafeBoardVO vo);
	
	public void modify(CafeBoardVO vo);
	
	public void remove(int no);
	
	public List<CafeBoardVO> listReply(CafeSearchCriteria csri);
	
	public PageMaker getPageMaker(CafeSearchCriteria csri);
}
