package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReplyDao;

@Service
public class ReplyService implements IReplyService{
	@Autowired
	private ReplyDao dao;
	@Override
	public boolean writeReply(Map<String, Object> params) {
		// TODO Auto-generated method stub
		if(dao.insertReply(params)>0) {
			return true;
		}else {
			return false;			
		}
	}

	@Override
	public boolean modifyReply(Map<String, Object> params) {
		//비밀번호 확인 후 일치하면 수정
		String pass = (String)params.get("pass");
		String idStr = (String)params.get("id");
		int id = Integer.parseInt(idStr);
		Map<String, Object>reply = dao.selectOne(id);
		if(reply.get("PASS").equals(pass)) {
			//같으면 삭제 로직 실행 후 true 반환
			if(dao.updateReply(params)>0) {
				return true;		
			}else {
				return false;
			}
		}else {
			//다르면 false 반환
			return false;
		}
	}

	@Override
	public boolean deleteReply(Map<String, Object> params) {
		// TODO Auto-generated method stub
		//비밀번호 확인 후 일치하면 삭제
		String pass = (String)params.get("pass");
		String idStr = (String)params.get("id");
		int id = Integer.parseInt(idStr);
		Map<String, Object>reply = dao.selectOne(id);
		if(reply.get("PASS").equals(pass)) {
			//같으면 삭제 로직 실행 후 true 반환
			if(dao.deleteReply(id)>0) {
				return true;
			}else {
				return false;
			}
		}else {
			//다르면 false 반환
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> getReply(int boardNum) {
		// TODO Auto-generated method stub
		
		return dao.selectByBoardNum(boardNum);
	}

}
