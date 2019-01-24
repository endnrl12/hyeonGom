package dao;

import java.util.List;
import java.util.Map;

public interface MemberDao {
	public int insertMember(Map<String, Object> member);
	public int updateMember(Map<String, Object> member);
	public int deleteMember(String num);
	public Map<String, Object> selectOne(String num);
	public Map<String, Object> selectById(String m_userid);
	public List<Map<String, Object>> selectAll();
}
