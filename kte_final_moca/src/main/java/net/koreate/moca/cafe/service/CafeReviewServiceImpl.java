package net.koreate.moca.cafe.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.dao.CafeReviewDAO;
@Service
@RequiredArgsConstructor
public class CafeReviewServiceImpl implements CafeReviewService {
	
	private final CafeReviewDAO dao;
	
	@Override
	public Map<String,Object> reviewList(int cafe_no) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", dao.reviewList(cafe_no));
		map.put("reviewCount", dao.reviewCount(cafe_no));
		map.put("ownerCount", dao.ownerCount(cafe_no));
		map.put("starCount", dao.starCount(cafe_no));
		map.put("monthCount", dao.monthCount(cafe_no));
		map.put("starAvg", dao.starAvg(cafe_no));
		
		return map;
	}

}
