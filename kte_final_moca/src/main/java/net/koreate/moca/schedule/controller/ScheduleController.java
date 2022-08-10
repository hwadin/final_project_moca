package net.koreate.moca.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {

	@GetMapping("scheduleMain")
	public String scheduleMain() {
		return "schedule/scheduleMain";
	}

}
