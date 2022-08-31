package net.koreate.moca.reservation.vo;

import lombok.Data;

@Data
public class ReservationVO {

	private int no;
	private String invite_code;
	private int cafe_no;
	private String time;
	private boolean isDutch;
	private boolean isAccepted;

	private String location;

}
