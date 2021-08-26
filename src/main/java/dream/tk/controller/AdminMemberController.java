package dream.tk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.api.SHA256;
import dream.tk.api.VerifyRecaptcha;
import dream.tk.dto.AdminMemberDTO;
import dream.tk.dto.ClientMemberDTO;
import dream.tk.service.AdminMemberService;
import dream.tk.service.EmailService;

@Controller
@RequestMapping("/aMember")
public class AdminMemberController {


	@Autowired
	private HttpSession session;

	@Autowired
	private AdminMemberService service;

	@Autowired
	private EmailService serviceE;

	@RequestMapping(value="signupForm")
	public String signupForm() {
		return "memberA/signup";
	}

	@ResponseBody
	@RequestMapping(value="idExist")
	public int idExist(String emp_id) {

		return service.idExist(emp_id);
	}
	@ResponseBody
	@RequestMapping(value="nameExist")
	public int nameExist(String name) {

		return service.nameExist(name);
	}

	@ResponseBody
	@RequestMapping(value="emailConfirm")
	public String emailConfirm(String name, String email) throws Exception {
		return serviceE.sendEmailConfirm(name, email);
	}


	@RequestMapping(value="signupProc")
	public String signupProc(AdminMemberDTO dto, Model m) {
		String shaPW = SHA256.getSHA512(dto.getPw());
		dto.setPw(shaPW);
		int result = service.insert(dto);

		m.addAttribute("result", result);
		return "memberA/signupResult";
	}

	@RequestMapping(value="loginForm")
	public String loginForm() {
		return "memberA/login";
	}

	@RequestMapping(value="loginProc")
	public String loginForm(String emp_id, String pw, Model m) {
		System.out.println(emp_id);
		String shaPW = SHA256.getSHA512(pw);
		int result = service.login(emp_id, shaPW);
		if(result>0) {
			AdminMemberDTO dto = service.getInfo(emp_id);
			session.setAttribute("info", dto);
			session.setAttribute("loginID", emp_id);
			return "redirect:/admin/dashForm";
		}else {
			return "memberA/loginFailed";
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

	@RequestMapping(value="logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}

	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}

}

