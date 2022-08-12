package net.koreate.moca.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import net.koreate.common.utils.SearchCriteria;
import net.koreate.moca.board.provider.CafeBoardQueryProvider;
import net.koreate.moca.board.vo.CafeBoardVO;

@Repository
public interface CafeBoardDAO {

	void regist(CafeBoardVO vo);

	CafeBoardVO read(int no);

	void updateReply(CafeBoardVO vo);
	
	void replyRegister(CafeBoardVO vo);
	
	void updateCnt(int no);

	void modify(CafeBoardVO vo);

	void remove(int no);
	
	@SelectProvider(type=CafeBoardQueryProvider.class, method="searchSelectSQL")
	List<CafeBoardVO> listReply(SearchCriteria scri);
	
	@Select("SELECT count(*) FROM tbl_cafe_board ")
	// @SelectProvider(type=CafeBoardQueryProvider.class, method="searchSelectCount")
	int listCount(SearchCriteria scri);



}
