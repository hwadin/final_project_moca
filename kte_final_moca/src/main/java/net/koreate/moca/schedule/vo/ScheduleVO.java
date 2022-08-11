package net.koreate.moca.schedule.vo;

import lombok.Data;

@Data
public class ScheduleVO {

	private int id;
	private int member_no;
	private boolean allDay;
	private String start;
	private String end;
	private String title;
	private String detail;

}
