package dream.tk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dream.tk.service.ClientMemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ClientMemberService service;
	
	@RequestMapping(value="whichMember")
	public String whichMember() {
		return "memberA/whichMember";
	}
	
	@RequestMapping(value="logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
}
