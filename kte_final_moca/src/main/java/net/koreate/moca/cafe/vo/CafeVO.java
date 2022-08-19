package net.koreate.moca.cafe.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CafeVO {

	private int no; 	 		//카페 번호
	private String name; 		// 카페 이름
	private String addr; 		// 카페 주소
	private String addr_detail; // 카페 상세 주소
	private int owner_no;		// 오너 번호
	private Date regdate;		// 카페 등록일
	private int likenum;		// 좋아요 개수
	private double map_x;		// 지도 x 좌표
	private double map_y;		// 지도 y 좌표
	private String content;		// 카페 소개 글
	
}
