package net.koreate.moca.invitation.vo;

import java.util.Date;

import lombok.Data;

@Data
public class InvParticipantVO {

	private int no;
	private String code;
	private int participant_no;
	private Date invitedate;
	private Boolean isAccepted;

	private String name;

}
