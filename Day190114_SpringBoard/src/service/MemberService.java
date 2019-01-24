package service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

public interface MemberService {
	public List<Map<String, Object>> getAllMemberList();
	public boolean login(String id, String pw);
	public int updateMember(Map<String, Object> member);
	public Map<String, Object> selectById(String id);
	public int insertMember(Map<String, Object> member);
	
}
