package dream.tk.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.config.SHA256;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.BusinessMemberDTO;
import dream.tk.service.BusinessMemberService;

@RequestMapping("/bMember")
@Controller
public class BusinessMemberController {
	
	@Autowired
	private BusinessMemberService ser;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("signupForm")
	public String test() {
		return "/memberB/business_signup";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/memberB/login";
	}
	
	@RequestMapping(value="loginProc")
	public String loginProc(String id, String pw ) {
		int result =ser.loginProc(id, SHA256.getSHA512(pw));
		if(result>0) {
			session.setAttribute("loginID", id);
			BusinessMemberDTO dto = ser.getInfo(id);
			session.setAttribute("binfo", dto);
			
//			String bizSeq = dto.getSeq();
//			BusinessDTO bizdto = ser.getBizInfo(bizSeq);
//			session.setAttribute("bizInfo", bizdto);
			return "/memberB/loginView";
		}else {
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping("dupleCheck")
	public String dupleCheck(String id) {
		int result = ser.dupleCheck(id);
		return String.valueOf(result);
	}
	
	@RequestMapping("signup")
	public String signup(HttpServletRequest request, Model m) {
		String id = request.getParameter("id");
		String pw = SHA256.getSHA512(request.getParameter("pw"));
		String name = request.getParameter("name");
		String email= request.getParameter("email");
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + phone2+ phone3;
		
	
		BusinessMemberDTO dto = new BusinessMemberDTO(0,id,pw,name,email,phone,null,null);
		
		int result = ser.signup(dto);
		m.addAttribute("result", result);
		
		return "/memberB/signupView";
	}
	
	@RequestMapping("myPage")
	public String myPage(Model m) {
		int bizSeq = ((BusinessMemberDTO) session.getAttribute("binfo")).getSeq();
		BusinessDTO bizdto = ser.getBizInfo(bizSeq);
		m.addAttribute("bizInfo", bizdto);
		return "/memberB/myPage";
	}
	
	@RequestMapping("signOut")
	public String signOut(String id) {
		ser.signOut(id);
		return "/memberB/login";
	}
	
	@RequestMapping("editPersonalInfo")
	public String editPersonalInfo(BusinessMemberDTO dto) {
		if(dto.getPw()!=null&&dto.getPw()!="") {
			String pw = SHA256.getSHA512(dto.getPw());
			dto.setPw(pw);
		}else {
			String originPw=((BusinessMemberDTO) session.getAttribute("binfo")).getPw();
			dto.setPw(originPw);
		}
		dto.setSeq(40);
		dto.setPremium("No");
		dto.setPrm_exp_date(new Date(0));
		ser.editPersonalInfo(dto);
		session.setAttribute("binfo", dto);
		return "redirect:/bMember/myPage";
	}
}
