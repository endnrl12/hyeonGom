package service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

public interface IBoardService {
	//리스트 요청
	public List<Map<String, Object>> getBoardList(Map<String, Object> params);
	//게시글 쓰기 요청
	public boolean writeBoard(Map<String, Object>params,MultipartFile file);
	//게시글 번호를 이용해 게시글 조회 후 조회수 증가
	public Map<String, Object> readBoard(int num);
	//수정요청
	public boolean modifyBoard(Map<String, Object> params);
	//삭제요청
	public boolean deleteBoard(int num);
	//비밀번호 확인요청
	public boolean checkPass(int num, String pass);
	//첨부파일 다운로드 요청 : 보류
	
	//게시글 네비게이션을 표시할 정보 얻어오기
	public Map<String, Object> getViewData(Map<String, Object>params);
	public Map<String, Object>getBoardByNum(int num);
	
	//게시글 카운트
	public List<Map<String, Object>> replyCount();
	
	//파일을 별도 공간에 저장 후 uuid를 포함한 파일의 full name을 반환하는 메서드
	public String writeFile(MultipartFile file);
	
	public View getUploadFile(int num);
}
