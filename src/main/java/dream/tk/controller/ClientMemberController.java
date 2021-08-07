package dream.tk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.config.SHA256;
import dream.tk.config.VerifyRecaptcha;
import dream.tk.dto.ClientMemberDTO;
import dream.tk.service.ClientMemberService;
import dream.tk.service.EmailService;

@Controller
@RequestMapping("/cMember")
public class ClientMemberController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ClientMemberService service;
	
	@Autowired
	private EmailService serviceA;

	@RequestMapping(value="signupForm")
	public String signupForm() {
		return "memberC/signup";
	}

	@ResponseBody
	@RequestMapping(value="idCheck")
	public int idCheck(String id) {
		return service.idCheck(id);
	}
	
	@ResponseBody
	@RequestMapping(value="emailConfirm")
	public String emailConfirm(String email, String name) throws Exception {
		return serviceA.sendEmailConfirm(email, name);
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
	@ResponseBody
	@RequestMapping(value = "verifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
	    VerifyRecaptcha.setSecretKey("6Ld-7eIbAAAAAHKQ6aWGRpvswCfWIykH7oqieuNY");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse))
	          return 0; // 성공
	       else return 1; // 실패
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //에러
	    }
	}



}
