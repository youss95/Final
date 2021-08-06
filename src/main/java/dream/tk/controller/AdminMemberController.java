package dream.tk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.config.SHA256;
import dream.tk.dto.AdminMemberDTO;
import dream.tk.service.AdminMemberService;

@Controller
@RequestMapping("/aMember")
public class AdminMemberController {


	@Autowired
	private HttpSession session;

	@Autowired
	private AdminMemberService service;
	
	@RequestMapping(value="whichMember")
	public String whichMember() {
		return "memberA/whichMember";
	}

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
	public String signupProc(AdminMemberDTO dto, Model m) {
		String shaPW = SHA256.getSHA512(dto.getPw());
		dto.setPw(shaPW);
		int result = service.insert(dto);

		m.addAttribute("result", result);
		return "memberA/loginResult";
	}

	@RequestMapping(value="loginForm")
	public String loginForm() {
		return "memberA/login";
	}

	@RequestMapping(value="loginProc")
	public String loginForm(String emp_id, String pw, Model m) {
		String shaPW = SHA256.getSHA512(pw);
		int result = service.login(emp_id, shaPW);
		if(result>0) {
			session.setAttribute("loginID", emp_id);
			return "redirect:/";
		}else {
			return "memberA/loginFailed";
		}
		
		
		
	}

}

