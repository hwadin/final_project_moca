package net.koreate.moca.cafe.vo;

import lombok.Data;

@Data
public class CafeScheduleVO {

	private int no;		        // 카페 스케줄 번호
	private int cno; 	    // 카페 번호
	private String start_date;   // 카페 스케줄 시작날짜
	private String end_date;   // 카페 스케줄 끝날짜
	private String start_time;  // 카페 스케줄 시작시간
	private String end_time;	// 카페 스케줄 끝시간
}
