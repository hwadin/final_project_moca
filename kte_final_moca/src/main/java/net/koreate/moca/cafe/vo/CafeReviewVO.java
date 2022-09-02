package net.koreate.moca.cafe.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CafeReviewVO {

	private int no;
	private int cafe_no;
	private int member_no;
	private String content;
	private String star;
	private Date time;
	private int depth;
	private int origin;
	private String name;
	private String invite_code;
	private String profile_url;

}
