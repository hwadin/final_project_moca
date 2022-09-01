package net.koreate.moca.reservation.vo;

import java.util.List;

import lombok.Data;

@Data
public class ReservationVO {

	private int no;
	private String invite_code;
	private int cafe_no;
	private String time;
	private boolean dutch;
	private boolean isAccepted;
	private Boolean isExpired;
	private int totalPrice;

	private String location;

	List<ReservationMenuVO> reservationMenu;

}
