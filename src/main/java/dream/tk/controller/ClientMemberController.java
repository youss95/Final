package dream.tk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.config.SHA256;
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
	public int idCheck(String id) {
		return service.idCheck(id);
	}

	@RequestMapping(value="signupProc")
	public String signupProc(ClientMemberDTO dto, Model m) {
		String shaPW = SHA256.getSHA512(dto.getPw());
		dto.setPw(shaPW);
		
		int result = service.insert(dto);
		
		m.addAttribute("result", result);
		return "memberC/signupResult";
	}

	@RequestMapping(value="loginForm")
	public String loginForm() {
		return "memberC/login";
	}

	@RequestMapping(value="loginProc")
	public String loginProc(String id, String pw, Model m) {
		String shaPW = SHA256.getSHA512(pw);
		int result = service.login(id, shaPW);
		if(result>0) {
			session.setAttribute("loginID", id);
			return "redirect:/";
		}else {
			return "memberC/loginFailed";
		}



	}



}
