package net.koreate.moca.member.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
public class MemberVO {

	private int no;
	private String profile_url;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String post;
	private String addr;
	private String addr_detail;
	private Date regdate;
	private Date updatedate;
	private boolean IsOwner;
	private boolean IsDelete;
	// 권한 0 == 일반회원 1 == 관리자
	private boolean Role;
	
	// 권한
	private List<String>  authList;
}


