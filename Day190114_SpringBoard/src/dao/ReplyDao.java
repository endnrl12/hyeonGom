package dao;

import java.util.List;
import java.util.Map;

public interface ReplyDao {
	public int insertReply(Map<String, Object> params);
	public int updateReply(Map<String, Object> params);
	public int deleteReply(int id);
	public Map<String, Object> selectOne(int id);
	public List<Map<String, Object>> selectByBoardNum(int boardNum);
}


