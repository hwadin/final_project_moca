package schedule;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import net.koreate.moca.schedule.service.ScheduleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:context/root-context.xml",
		"classpath:context/appServlet/servlet-context.xml" })
public class ScheduleTest {

	@Autowired
	private ScheduleService ss;

	@Test
	public void scheduleRegistTest() {
//		ScheduleVO vo = new ScheduleVO();
//		vo.setMember_no(1);
//
//		Date date = new Date();
//		String strDate = "2022-07-09";
//		try {
//			date = (new SimpleDateFormat("yyyy-MM-dd")).parse(strDate);
//			vo.setDate(date);
//		} catch (ParseException e1) {
//			e1.printStackTrace();
//		}
//
//		vo.setStart_time("09:00");
//		vo.setEnd_time("10:00");
//		vo.setTitle("1교시");
//
//		try {
//			ss.regist(vo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

	}

	@Test
	public void scheduleMonthListTest() {
//		ScheduleVO vo = new ScheduleVO();
//		vo.setMember_no(1);
//		vo.setDate(new Date());
//
//		try {
//			List<ScheduleVO> list = ss.monthScheduleList(vo);
//			for (ScheduleVO s : list) {
//				System.out.println(s);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	@Test
	public void scheduleDayListTest() {
//		ScheduleVO vo = new ScheduleVO();
//		vo.setMember_no(1);
////		vo.setDate(new Date());
//		Date date = new Date();
//		String strDate = "2022-07-09";
//		try {
//			date = (new SimpleDateFormat("yyyy-MM-dd")).parse(strDate);
//			vo.setDate(date);
//		} catch (ParseException e1) {
//			e1.printStackTrace();
//		}
//
//		try {
//			List<ScheduleVO> list = ss.dayScheduleList(vo);
//			for (ScheduleVO s : list) {
//				System.out.println(s);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	@Test
	public void scheduleReadTest() {

		try {
			System.out.println(ss.read(3));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Test
	public void scheduleUpdateTest() {
//		try {
//			ScheduleVO vo = ss.read(3);
//			vo.setTitle("3교시");
//			vo.setDetail("배고파");
//			vo.setEnd_time("13:00");
//
//			ss.update(vo);
//
//			System.out.println(ss.read(3));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	@Test
	public void scheduleDeleteTest() {
		try {
			ss.delete(2);
			System.out.println(ss.read(2));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
