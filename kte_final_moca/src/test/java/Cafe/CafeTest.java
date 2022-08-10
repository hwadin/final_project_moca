package Cafe;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;
import net.koreate.moca.cafe.dao.CafeDAO;
import net.koreate.moca.cafe.service.CafeService;
import net.koreate.moca.cafe.vo.CafeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:context/root-context.xml",
		"classpath:context/appServlet/servlet-context.xml"})
//@Transactional 테스트할땐 롤백이 되던데 테스트에선 트랜잭셔널 사용할까요?
@Slf4j
public class CafeTest {

	@Autowired
	CafeService cs;
	
	@Autowired // 서비스코드가 지금 dao 호출밖에 없는데 테스트는 그냥 dao로 할까요?
	CafeDAO dao;
	
	@Test
	public void cafeTest() throws Exception {
		CafeVO vo = new CafeVO();
		vo.setName("송화진");
		vo.setAddr("부산");
		vo.setAddr_detail("부산 해운대구");
		vo.setOwner_no(1);
		
		// 테스트 이렇게 한번에 처리해도 되나요?
		int a = dao.regist(vo);
		log.info("regist = {}", a);
		Assert.assertEquals(a, 1);
		
		CafeVO readVo = dao.read(vo.getOwner_no());
		log.info("readVo = {}", readVo);
		Assert.assertEquals(readVo.getOwner_no(), vo.getOwner_no());
		
		readVo.setAddr("부산");
		readVo.setAddr_detail("부산 금정구");
		int c = dao.update(readVo);
		log.info("update = {}", c);
		Assert.assertEquals(c, 1);
		
		int b = dao.delete(readVo.getNo());
		log.info("delete = {}", b);
		Assert.assertEquals(b, 1);
	}

}
