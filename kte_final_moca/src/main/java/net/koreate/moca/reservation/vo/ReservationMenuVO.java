package net.koreate.moca.reservation.vo;

import lombok.Data;

@Data
public class ReservationMenuVO {

	private int no;
	private int reservation_no;
	private int menu_no;
	private int amount;

	private String name;
	private int price;
	private int discount;

}
