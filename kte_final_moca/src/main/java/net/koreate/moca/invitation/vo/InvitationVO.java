package net.koreate.moca.invitation.vo;

import java.util.Date;

import lombok.Data;

@Data
public class InvitationVO {

	private int no;
	private String code;
	private String title;
	private int member_no;
	private Date regdate;
	private Boolean isReserve;
	private Boolean isExpired;

	private Boolean isAccepted;
	private String name;

}
