package dream.tk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.api.SHA256;
import dream.tk.api.VerifyRecaptcha;
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
	private EmailService serviceE;

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
	public String emailConfirm(String name, String email) throws Exception {
		return serviceE.sendEmailConfirm(name, email);
	}


	@RequestMapping(value="signupProc")
	public String signupProc(ClientMemberDTO dto, Model m) {
		
		System.out.println("signupProc");
		String shaPW = SHA256.getSHA512(dto.getPw());
		dto.setPw(shaPW);

		int result = service.signup(dto);

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
	
	@RequestMapping(value="findIDForm")
	public String findIDForm() {
		return "memberC/findID";
	}

	@ResponseBody
	@RequestMapping(value="sendEmailforID")
	public String sendEmailforID(String name, String email) throws Exception {
		int resultMatching = service.matchNameEmail(name, email);
		if(resultMatching>0) {
			return serviceE.sendEmailConfirm(name, email);
		}else {
			return "false";
		}
	}
	@ResponseBody
	@RequestMapping(value="findID")
	public String findID(String name, String email) throws Exception {
		return service.findID(name, email);
	}

	@RequestMapping(value="findPWForm")
	public String findPWForm() {
		return "memberC/findPW";
	}
	@ResponseBody
	@RequestMapping(value="sendEmailforPW")
	public String sendEmailforPW(String id, String name, String email) throws Exception {
		int resultMatching = service.matchIdNameEmail(id, name, email);
		if(resultMatching>0) {
			return serviceE.sendEmailConfirm(name, email);
		}else { 
			return "false";
		}
	}

	@RequestMapping(value="resetPW")
	public String resetPW(String id, String pw, Model m) throws Exception {
		String shaPW = SHA256.getSHA512(pw);
		int result = service.resetPW(id, shaPW);
		m.addAttribute("result", result);
		return "memberC/resetPWResult";
	}



}
