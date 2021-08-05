package dream.tk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dto.AdminMemberDTO;
import dream.tk.service.AdminMemberService;

@Controller
@RequestMapping("/aMember")
public class AdminMemberController {

	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminMemberService service;
	
	@RequestMapping(value="signupForm")
	public String signupForm() {
		return "memberA/signup";
	}
	
	@RequestMapping(value="preExist")
	@ResponseBody
	public String preExist(String emp_id, String name) {
		return String.valueOf(service.preExist(emp_id, name));
	}
	
	@RequestMapping(value="signupProc")
	public String signupProc(AdminMemberDTO dto) {
		service.insert(dto);
		return "memberA/login";
	}
	
	@RequestMapping(value="loginForm")
	public String loginForm() {
		return "memberA/login";
	}
	
	@RequestMapping(value="loginProc")
	public String loginForm(String emp_id, String pw, Model m) {
		int result = service.login(emp_id, pw);
		if(result>0) {
			session.setAttribute("loginId", emp_id);
			m.addAttribute("result", "true");
			return "memberA/loginResult";
		}else {
			m.addAttribute("result", "false");
			return "memberA/loginResult";
		}
		
	}
}
