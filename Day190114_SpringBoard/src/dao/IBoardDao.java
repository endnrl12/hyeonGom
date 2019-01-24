package dao;

import java.util.List;
import java.util.Map;

public interface IBoardDao {
	public int insertBoard(Map<String, Object> param);
	public int updateBoard(Map<String, Object> param);
	public int deleteBoard(int num);
	public Map<String, Object> selectOne(int num);
	public List<Map<String, Object>> selectAll();
	public List<Map<String, Object>> boardList(Map<String, Object>param);
	//게시글의 조회수를 1 증가시키는 메서드
	public int plusReadCount(int num);
	//전체 게시글 수 가져오는 메서드
	public int selectTotalCount(Map<String, Object>params);
	//댓글수
	public List<Map<String, Object>> replyCount();
	
	//첨부파일 이름 저장을 위한 메서드(uploadfile 테이블 사용)
	public int insertAttach(Map<String, Object>params);
	public Map<String, Object> selectAttach(int num);
	
	
}






