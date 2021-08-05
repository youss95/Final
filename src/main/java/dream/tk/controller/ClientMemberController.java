package dream.tk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dto.ClientMemberDTO;
import dream.tk.service.ClientMemberService;

@Controller
@RequestMapping("/cMember")
public class ClientMemberController {
	
	@Autowired
	private HttpSession session;

	@Autowired
	private ClientMemberService service;

	@RequestMapping(value="signupForm")
	public String signupForm() {
		return "memberC/signup";
	}

	@RequestMapping(value="idCheck")
	@ResponseBody
	public String idCheck(String id) {
		return String.valueOf(service.idCheck(id));
	}

	@RequestMapping(value="signupProc")
	public String signupProc(ClientMemberDTO dto) {
		int result = service.insert(dto);
		if(result>0) {
			return "memberC/login";
		}else {
			return "memberC/signupFailed";
		}
	}

	@RequestMapping(value="loginForm")
	public String loginForm() {
		return "memberC/login";
	}

	@RequestMapping(value="loginProc")
	public String loginProc(String id, String pw, Model m) {
		int result = service.login(id, pw);
		if(result>0) {
			session.setAttribute("loginId", id);
			m.addAttribute("result", "true");
			return "memberA/loginResult";
		}else {
			m.addAttribute("result", "false");
			return "memberA/loginResult";
		}		
	}
	


}
