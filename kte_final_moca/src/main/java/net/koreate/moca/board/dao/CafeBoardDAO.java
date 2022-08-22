package net.koreate.moca.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import net.koreate.moca.board.provider.CafeBoardQueryProvider;
import net.koreate.moca.board.vo.CafeBoardVO;
import net.koreate.moca.common.utils.CafeSearchCriteria;

@Repository
public interface CafeBoardDAO {
	
	@Insert("INSERT INTO tbl_cafe_board(cafe_no,category,title,content) VALUES(#{cafe_no},#{category},#{title},#{content})")
	int regist(CafeBoardVO vo);

	CafeBoardVO read(int no);

	void updateReply(CafeBoardVO vo);
	
	void replyRegister(CafeBoardVO vo);
	
	void updateCnt(int no);

	void modify(CafeBoardVO vo);

	void remove(int no);
	
	@SelectProvider(type=CafeBoardQueryProvider.class, method="searchSelectSQL")
	List<CafeBoardVO> listReply(CafeSearchCriteria csri);
	
	/* @Select("SELECT count(*) FROM tbl_cafe_board ") */
	@SelectProvider(type=CafeBoardQueryProvider.class, method="searchSelectCount")
	int listCount(CafeSearchCriteria csri);



}
