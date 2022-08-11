package net.koreate.moca.schedule.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.schedule.service.ScheduleService;
import net.koreate.moca.schedule.vo.ScheduleVO;

@RestController
@RequestMapping("/schedule/api/*")
@RequiredArgsConstructor
public class ScheduleRestController {

	private final ScheduleService ss;

	@GetMapping("scheduleList")
	public ResponseEntity<List<ScheduleVO>> scheduleList(ScheduleVO vo) {
		List<ScheduleVO> list = null;
		try {
			list = ss.monthScheduleList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

}
