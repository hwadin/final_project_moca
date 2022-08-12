package net.koreate.moca.member.vo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode()
public class MemberVO {

	private int no;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String addr;
	private Date regdate;
	private Date updatedate;
	boolean IsOwner;
}
