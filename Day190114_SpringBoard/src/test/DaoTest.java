package test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.IBoardDao;
import dao.ReplyDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:WebContent/WEB-INF/spring/root-context.xml")
public class DaoTest {
	@Autowired
	private IBoardDao boardDao;
	@Autowired
	private ReplyDao replyDao;
	@Test
	public void testDao() {
		List<Map<String, Object>> boardList;
		/*List<Map<String, Object>> replyList;
		boardList = boardDao.selectAll();
		replyList = replyDao.selectByBoardNum(16);
		System.out.println("boardList : "+boardList);
		System.out.println("-------------------------");
		System.out.println("replyList : "+replyList);*/
		/*int num = 16;
		boardDao.plusReadCount(num);*/
		//System.out.println("replucount : "+boardDao.replyCount());
		boardList = boardDao.replyCount();
		for(Map<String, Object>boardList1 : boardList) {
			System.out.println(boardList1);
		}
		
	}
}
