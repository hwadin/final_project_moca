package net.koreate.moca.common.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.cafe.service.CafeService;
import net.koreate.moca.member.service.MemberService;

@RestController
@RequestMapping("/search/api/*")
@RequiredArgsConstructor
public class SearchRestController {

	private final MemberService ms;
	private final CafeService cs;

	@GetMapping("")
	public ResponseEntity<Map<String, Object>> search(String keyword) {
		ResponseEntity<Map<String, Object>> entity = null;

		Map<String, Object> map = new HashMap<>();
		map.put("member", ms.findByKeyword(keyword));
		map.put("cafe", cs.findByKeyword(keyword));

		entity = new ResponseEntity<>(map, HttpStatus.OK);

		return entity;
	}
}
