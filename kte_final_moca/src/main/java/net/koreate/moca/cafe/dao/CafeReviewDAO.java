package net.koreate.moca.cafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import net.koreate.moca.cafe.vo.CafeReviewVO;
import net.koreate.moca.cafe.vo.ReviewCounterVO;

@Repository
public interface CafeReviewDAO {

	@Select("SELECT R.*,M.name, M.profile_url FROM tbl_cafe_review AS R INNER JOIN tbl_member AS M ON R.member_no = M.no WHERE cafe_no = #{cafe_no} ORDER BY origin DESC, no ASC")
	List<CafeReviewVO> reviewList(int cafe_no);

	@Select("SELECT count(*) FROM tbl_cafe_review WHERE cafe_no = #{cafe_no} AND depth = 0")
	int reviewCount(int cafe_no);

	@Select("SELECT count(*) FROM tbl_cafe_review WHERE cafe_no = #{cafe_no} AND depth = 1")
	int ownerCount(int cafe_no);

	@Select("SELECT month(time) AS criteria,avg(star) AS score FROM tbl_cafe_review WHERE depth != 1 AND cafe_no = #{cafe_no} AND time between now() - interval 5 month and now() GROUP BY month(time) ORDER BY criteria ASC")
	List<ReviewCounterVO> monthCount(int cafe_no);

	@Select("SELECT star AS criteria,count(*) AS score FROM tbl_cafe_review WHERE  depth != 1 AND cafe_no = #{cafe_no} GROUP BY star ORDER BY criteria DESC")
	List<ReviewCounterVO> starCount(int cafe_no);

	@Select("SELECT avg(star) FROM tbl_cafe_review WHERE  depth != 1 AND cafe_no = #{cafe_no}")
	Double starAvg(int cafe_no);

	@Select("SELECT * FROM tbl_cafe_review WHERE cafe_no = #{cafe_no} AND depth = 1 ")
	List<CafeReviewVO> selectReply(int cafe_no);

}
