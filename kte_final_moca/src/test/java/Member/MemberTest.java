package Member;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import net.koreate.moca.member.dao.MemberDAO;
import net.koreate.moca.member.service.MemberService;
import net.koreate.moca.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:context/root-context.xml",
"classpath:context/appServlet/servlet-context.xml"})
@WebAppConfiguration
public class MemberTest {

	@Autowired
	MemberService ms;
	
	@Autowired
	MemberDAO dao;
	
//	MemberVO vo = new MemberVO();
	
	/*
	 * @Before public void init() {
	 * 
	 * vo.setId("dlwnaud"); vo.setPw("1234"); vo.setName("이주명"); vo.setAge(15);
	 * vo.setGender("여"); vo.setAddr("부산 사하구"); }
	 */
	
	// 회원가입 테스트
	@Test
	public void signUpTest() throws Exception{
		MemberVO vo = new MemberVO();
		vo.setId("dlwnaud");
		vo.setPw("1234");
		vo.setName("이주명");
		vo.setAge(15);
		vo.setGender("여");
		vo.setAddr("부산 사하구");
		
//		dao.signUp(vo);
		
		System.out.println(vo);
		
	}
	
	/*
	 * @Test public void loginTest() throws Exception{ MemberVO login =
	 * dao.logIn(vo); System.out.println(login);
	 * 
	 * }
	 */
	
}
