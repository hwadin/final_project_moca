package net.koreate.moca.reservation.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationDTO {

	private int no;
	private String code;
	private String title;
	private String cafe_name;
	private Date time;
	private Boolean isAccepted;
	private Boolean isExpired;
	private Boolean isRejected;
	private Boolean isDutch;
	private String addr;
	private String addr_detail;
	private String member_name;
	private int totalPrice;
	private int cafe_no;
	private Integer review_no;

}
