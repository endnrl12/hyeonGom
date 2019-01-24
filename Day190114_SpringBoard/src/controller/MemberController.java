package controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		System.out.println("로그인화면");
		return "login";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String id, String pw,HttpServletRequest req,Model model) {
		System.out.println("로그인요청");
		String msg="";
		String url="";
		if(service.login(id, pw)) {
			req.getSession().setAttribute("userid", id);
			msg = "로그인 성공";
			url="/board/boardList";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			model.addAttribute("result",true);
		}else {
			msg="로그인 실패";
			url="member/member";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			model.addAttribute("result",false);
		}
		
		return "result";
	}
	@RequestMapping("/result")
	public String result(Model model, HttpServletRequest req) {
		if(req.getSession().getAttribute("login").equals(false)) {
			
			String msg = (String)req.getSession().getAttribute("msg");
			model.addAttribute("msg",msg);
			req.getSession().removeAttribute("msg");
			req.getSession().removeAttribute("login");
			model.addAttribute("result",true);
			model.addAttribute("location","login");
			return "result";
		}
		return "";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, Model model) {
		System.out.println("로그아웃 요청");
		req.getSession().removeAttribute("userid");
		model.addAttribute("msg","로그아웃 되었습니다.");
		model.addAttribute("location","login");
		model.addAttribute("result",true);
		return "result";
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(@RequestParam Map<String, Object>member, Model model,HttpServletRequest req) {
		if(service.updateMember(member)>0) {
			model.addAttribute("result",true);
			model.addAttribute("url","/board/boardList");
			model.addAttribute("msg","회원정보를 변경하였습니다.");
			return "result";
		}else {
			model.addAttribute("result",false);
			model.addAttribute("url","/board/boardList");
			model.addAttribute("msg","회원정보 변경에 실패하였습니다.");
			return "result";
		}
		
		
	
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyForm(Model model,HttpServletRequest req) {
		System.out.println(req.getSession().getAttribute("userid"));
		model.addAttribute("member",service.selectById((String)req.getSession().getAttribute("userid")));
		return "memberUpdate";
	}
	
	@RequestMapping(value="/checkPass",method=RequestMethod.GET)
	public String checkPassForm() {
		
		return "memberCheckPass";
	}
	
	@RequestMapping(value="/checkPass",method=RequestMethod.POST)
	public String checkPass(String pw, Model model,HttpServletRequest req) {
		
		System.out.println("controller:"+req.getSession().getAttribute("userid"));
		String m_userid = (String)req.getSession().getAttribute("userid");
		Map<String, Object> member = service.selectById(m_userid);
		if(member != null) {
			if(member.get("M_PW").equals(pw)) {
				model.addAttribute("msg","회원정보 수정 페이지로 이동합니다.");
				model.addAttribute("url","/member/modify");
				model.addAttribute("result",true);
				return "result";
			}else {
				model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
				model.addAttribute("url","/member/checkPass");
				model.addAttribute("result",false);
				return "result";
			}
		}
		
		return "result";
	}
}
