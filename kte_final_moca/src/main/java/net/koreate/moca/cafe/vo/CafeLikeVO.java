package net.koreate.moca.cafe.vo;

import lombok.Data;

@Data
public class CafeLikeVO {

	private int likeno; // 좋아요 넘버
	private int cno; // 카페 넘버
	private int mno;	// 멤버 넘버
	private int like_check;	// 좋아요 체크 값 '0' or '1'
	private int likenum;
}
