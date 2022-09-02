package net.koreate.moca.schedule.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@PostMapping("scheduleListByMembers")
	public ResponseEntity<List<ScheduleVO>> scheduleListByMembers(
			@RequestParam(value = "member_list[]") List<Integer> member_list) {
		ResponseEntity<List<ScheduleVO>> entity = null;

		System.out.println(member_list);

		return entity;
	}

	@GetMapping("scheduleById")
	public ResponseEntity<ScheduleVO> scheduleById(ScheduleVO vo) {
		ScheduleVO s = null;
		try {
			s = ss.read(vo.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(s, HttpStatus.OK);
	}

	@DeleteMapping("{id}")
	public ResponseEntity<String> delete(@PathVariable("id") int id) {
		try {
			ss.delete(id);
			return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("/")
	public ResponseEntity<ScheduleVO> regist(ScheduleVO vo) {
		try {
			ss.regist(vo);
			return new ResponseEntity<>(vo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}
	}

	@PatchMapping("/")
	public ResponseEntity<ScheduleVO> update(ScheduleVO vo) {
		try {
			ss.update(vo);
			return new ResponseEntity<>(ss.read(vo.getId()), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(vo, HttpStatus.BAD_REQUEST);
		}
	}

}
