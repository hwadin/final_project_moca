package Cafe;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;
import net.koreate.moca.cafe.dao.CafeMenuDAO;
import net.koreate.moca.cafe.service.CafeMenuService;
import net.koreate.moca.cafe.vo.CafeMenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:context/root-context.xml",
"classpath:context/appServlet/servlet-context.xml"})
@Slf4j

public class CafeMenuTest {

	@Autowired
	CafeMenuService cms;
	
	@Autowired
	CafeMenuDAO dao;
	
	@Test
	public void cafeMenuTest() throws Exception{
		
		CafeMenuVO vo = new CafeMenuVO();
		vo.setCafe_no(1);
		vo.setName("아메리카노");
		vo.setPrice("5000");
		vo.setDiscount("4000");
		vo.setPhoto_url("");
		
		int a = dao.regist(vo);
		log.info("regist = {}", a);
		Assert.assertEquals(a, 1);
		
		CafeMenuVO readVo = dao.read(vo.getCafe_no());
		log.info("readVo = {}", readVo);
		Assert.assertEquals(readVo.getCafe_no(), vo.getCafe_no());
		
		readVo.setName("앗메리카노");
		readVo.setPrice("4500");
		int c = dao.update(readVo);
		log.info("update = {}", c);
		Assert.assertEquals(c, 1);
		
		int b = dao.delete(readVo.getNo());
		log.info("delete = {}", b);
		Assert.assertEquals(b, 1);
	}

}
