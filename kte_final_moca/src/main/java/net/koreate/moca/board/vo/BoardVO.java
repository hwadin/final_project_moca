package net.koreate.moca.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int no;
	private int cafe_no;
	private String name;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
	
}








