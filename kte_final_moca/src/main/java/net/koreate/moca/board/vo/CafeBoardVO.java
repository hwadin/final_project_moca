package net.koreate.moca.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CafeBoardVO {
	
	private int no;
	private int cafe_no;
	private String category;
	private String title;
	private String content;
	private int origin;
	private int depth;
	private int seq;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
	private String writer;
	
}








