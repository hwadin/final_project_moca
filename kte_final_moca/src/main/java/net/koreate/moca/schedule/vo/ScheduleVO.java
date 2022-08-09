package net.koreate.moca.schedule.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ScheduleVO {

	private int no;
	private int member_no;
	private Date date; // 스케쥴의 날짜 정보만 포함시키는 용도(시간 제외)
	private String start_time;
	private String end_time;
	private String title;
	private String detail;

}
