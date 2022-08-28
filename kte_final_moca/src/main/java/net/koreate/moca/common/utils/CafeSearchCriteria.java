package net.koreate.moca.common.utils;

import lombok.Data;
import net.koreate.common.utils.SearchCriteria;

@Data
public class CafeSearchCriteria extends SearchCriteria {
	int cafe_no;
	
	// addr_detail 검색
	private String keyword;
	// 날짜 or 시간 검색 
	private String type;
	// 검색 타입 배열 변환
	private String[] typeArr;
}
