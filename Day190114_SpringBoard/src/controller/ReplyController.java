package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import service.IReplyService;
import service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	@Autowired
	private IReplyService service;
	//댓글등록
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public boolean register(@RequestParam Map<String, Object>params) {
		System.out.println("register : "+params);
		return service.writeReply(params);
		
	}
	
	//댓글수정
	
	@RequestMapping(value="/{replyNum}",method=RequestMethod.POST)
	public boolean modify(@RequestParam Map<String, Object>params) {
		System.out.println("modify : "+params);
		return service.modifyReply(params);
	}
	
	//댓글삭제
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public boolean delete(@RequestParam Map<String, Object>params) {
		System.out.println("delete : "+params);
		return service.deleteReply(params);
	}
	
	//댓글목록
	@RequestMapping(value="/all/{boardNum}", method=RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> list(@PathVariable("boardNum")int boardNum){
		System.out.println("List : "+boardNum);
		ResponseEntity<List<Map<String, Object>>> entity = null;
		try{
			List<Map<String, Object>>replyList = service.getReply(boardNum);
			entity = new ResponseEntity<List<Map<String,Object>>>(replyList,HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<List<Map<String,Object>>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
