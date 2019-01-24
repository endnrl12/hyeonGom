package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import common.Constants;
import service.BoardService;
import service.MemberService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService service;
	@RequestMapping("/boardList")
	public String boardList(@RequestParam(value="page",defaultValue="1")int page,
			Model model,@RequestParam(required=false)String keyword, 
			@RequestParam(defaultValue="0")int type) {
		/*model.addAttribute("boardList",boardService.getBoardList(page));*/
		Map<String, Object>params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("keyword", keyword);
		params.put("type", type);
		
		System.out.println(boardService.getViewData(params));
		/*model.addAttribute("replyCount",boardService.replyCount());*/
		model.addAllAttributes(boardService.getViewData(params));
		
		return "boardList";
	}
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeForm(HttpServletRequest req,Model model) {
		model.addAttribute("name",req.getSession().getAttribute("userid"));
		return "boardWrite";
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeBoard(@RequestParam Map<String,Object>board,
			Model model, MultipartFile file) {
		
		String url = "/board/boardList";
		String msg = null;
		String result = null;
		System.out.println(board);
		if(boardService.writeBoard(board,file)) {
			msg="게시글을 등록했습니다.";
			result = "true";
		}else {
			msg = "게시물 작성에 실패했습니다.";
			result="false";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		model.addAttribute("result",result);
		return "result";
	}
	@RequestMapping(value="/view")
	public String view(@RequestParam(value="num")int boardNum,Model model) {
		model.addAttribute("board",boardService.readBoard(boardNum));
		return "boardView";
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyForm(Model model,int num) {
		//기존 게시글 정보를 가지고 화면 이동
		//게시글 정보를 가져와서 model에 attribute
		model.addAttribute("board",boardService.getBoardByNum(num));
		return "boardModify";
	}
	
	//게시글 수정요청
	@RequestMapping(value="modify",method=RequestMethod.POST)
	public String modify(@RequestParam Map<String, Object>board, Model model) {
		//수정 후 해당 게시글로 바로 이동
		System.out.println(board);
		String url = "view?num="+board.get("num");
		model.addAttribute("url",url);
		if(boardService.modifyBoard(board)) {
			model.addAttribute("msg","수정 성공");
		}else {
			model.addAttribute("msg","수정 실패");
		}
		return "result";
	}
	
	@RequestMapping("/boardCheckPassForm")
	public String boardCheckPassForm() {
		return "boardCheckPass";
	}
	@RequestMapping(value="/boardCheckPass",method=RequestMethod.POST)
	public String boardCheckPass(int num,String type,String pass,Model model) {
		//비밀번호 확인 후 비밀번호 일치시
		//수정 또는 삭제 요청 생성
		String url = "";
		if(boardService.checkPass(num, pass)) {
			//비밀번호 일치
			if(type.equals("update")) {
				url="redirect:modify?num="+num;
			}else {
				url="redirect:delete?num="+num;
			}
		}else {
			//비밀번호 불일치
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
			model.addAttribute("url","view?num="+num);
			url="result";
		}
		return url;
	}
	@RequestMapping(value="delete")
	public String delete(int num,Model model) {
		model.addAttribute("url","boardList");
		if(boardService.deleteBoard(num)) {
			model.addAttribute("msg","게시글을 삭제했습니다");
		}else {
			model.addAttribute("msg","게시글 삭제에 실패했습니다");
		}
		return "result";
	}
	@RequestMapping(value="/download")
	public View download(int num) {
		//반환값을 viewname 대신,
		//file을 View로 만들어 응답하면 file download
		//위의 작업을 하는 service method : getUploadFile() 생성
		System.out.println(num);
		
		return boardService.getUploadFile(num);
	}
}
