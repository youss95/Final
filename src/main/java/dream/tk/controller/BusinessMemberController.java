package dream.tk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dto.BusinessMemberDTO;
import dream.tk.service.BusinessMemberService;

@RequestMapping("/bMember")
@Controller
public class BusinessMemberController {
	
	@Autowired
	private BusinessMemberService ser;
	
	@RequestMapping("signupForm")
	public String test() {
		return "/memberB/business_signup";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/memberB/login";
	}
	
	@ResponseBody
	@RequestMapping("dupleCheck")
	public String dupleCheck(String id) {
		int result = ser.dupleCheck(id);
		return String.valueOf(result);
	}
	
	@RequestMapping("signup")
	public String signup(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email= request.getParameter("email");
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + phone2+ phone3;
		
		String type = request.getParameter("type");
		String regNum = request.getParameter("regNum");
		String businessName = request.getParameter("businessName");
		String businessNameEng = request.getParameter("businessNameEng");
		
		String bcontact1 = request.getParameter("bContact1");
		String bcontact2 = request.getParameter("bContact2");
		String bcontact3 = request.getParameter("bContact3");
		String businessContact = bcontact1 + bcontact2+ bcontact3;
		
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String postcode = request.getParameter("postcode");
		
		String address1Kor = request.getParameter("address1Kor");
		
		BusinessMemberDTO dto = new BusinessMemberDTO(id,pw,name,email,phone,type,regNum,businessName, businessNameEng, businessContact, address1, address2, postcode, address1Kor);
		
		int result = ser.signup(dto);
		
		return "redirect:/cMember/loginForm";
	}
	
	
}
