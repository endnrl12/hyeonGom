package service;

import java.util.List;
import java.util.Map;

public interface IReplyService {
	//댓글등록
	public boolean writeReply(Map<String, Object>params);
	//댓글수정 : 비밀번호 확인 후 비밀번호가 맞으면 수정
	public boolean modifyReply(Map<String, Object>params);
	//삭제요청
	public boolean deleteReply(Map<String, Object>params);
	//댓글목록
	public List<Map<String, Object>> getReply(int boardNum);
}
