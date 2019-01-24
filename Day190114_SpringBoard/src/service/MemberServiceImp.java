package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;
@Service("memberService")
public class MemberServiceImp implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
	
	public List<Map<String, Object>> getAllMemberList() {
		return memberDao.selectAll();
	}


	@Override
	public boolean login(String id, String pw) {
		// TODO Auto-generated method stub
		if(memberDao.selectById(id)!=null) {
			if(memberDao.selectById(id).get("M_PW").equals(pw)) {
				return true;
			}else {
				return false;				
			}
		}else {
			return false;
		}
	}


	@Override
	public int updateMember(Map<String, Object> member) {
		// TODO Auto-generated method stub
		return memberDao.updateMember(member);
	}


	@Override
	public Map<String, Object> selectById(String m_userid) {
		// TODO Auto-generated method stub
		return memberDao.selectById(m_userid);
	}


	@Override
	public int insertMember(Map<String, Object> member) {
		// TODO Auto-generated method stub
		return memberDao.insertMember(member);
	}

}
