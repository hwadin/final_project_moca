package net.koreate.moca.cafe.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.moca.cafe.vo.CafeLikeVO;

public interface CafeLikeDAO {
	
	// 좋아요 체크 
	@Update("UPDATE tbl_cafe_like SET like_check= like_check + 1 WHERE mno=#{mno} AND cno=#{cno}")
	void update(CafeLikeVO vo) throws Exception;
	
	// 좋아요 체크 취소
	@Update("UPDATE tbl_cafe_like SET like_check = 0 WHERE mno=#{mno} AND cno=#{cno} ")
	void cancel(CafeLikeVO vo) throws Exception;
	
	// 카페번호로 좋아요 수(likenum) 조회
	 @Select("SELECT C.likenum, L.like_check, L.cno FROM " +
	 " tbl_cafe AS C INNER JOIN tbl_cafe_like AS L on C.no = L.cno " +
	  " WHERE L.cno = #{cno} AND L.mno = #{mno}")
	CafeLikeVO read(CafeLikeVO vo) throws Exception;

	 @Select("SELECT * FROM tbl_cafe_like WHERE cno=#{cno} AND mno=#{mno}")
	CafeLikeVO likeCheck(CafeLikeVO vo);

	 @Insert("INSERT INTO tbl_cafe_like(cno, mno, like_check) VALUES(#{cno}, #{mno}, 1)")
	void insertLike(CafeLikeVO vo);
	
}
