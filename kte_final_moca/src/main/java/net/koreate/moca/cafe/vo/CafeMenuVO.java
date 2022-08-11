package net.koreate.moca.cafe.vo;

import lombok.Data;

@Data
public class CafeMenuVO {

	private int no; 	// 메뉴 번호
	private int cafe_no; // 카페 번호
	private String name; // 메뉴 이름
	private String price; // 메뉴 가격
	private String discount; // 메뉴 할인
	private String photo_url; // 메뉴 사진 링크
}
