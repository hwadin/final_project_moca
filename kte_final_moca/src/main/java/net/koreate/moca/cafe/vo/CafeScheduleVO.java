package net.koreate.moca.cafe.vo;

import lombok.Data;

@Data
public class CafeScheduleVO {

	private int no;		        // 카페 스케줄 번호
	private int cafe_no; 	    // 카페 번호
	private String dayofweek;   // 카페 스케줄 날짜
	private String start_time;  // 카페 스케줄 시작시간
	private String end_time;	// 카페 스케줄 끝시간
}
