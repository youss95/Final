package dream.tk.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlInOutParameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.api.SHA256;
import dream.tk.api.VerifyRecaptcha;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.BusinessFileDTO;
import dream.tk.dto.BusinessMemberDTO;
import dream.tk.dto.ReservationDTO;
import dream.tk.service.BusinessFileService;
import dream.tk.service.BusinessMemberService;
import dream.tk.service.EmailService;

@RequestMapping("/bMember")
@Controller
public class BusinessMemberController {
	
	@Autowired
	private BusinessMemberService ser;
	
	@Autowired
	private BusinessFileService fser;
	
	@Autowired
	private EmailService eser;
	
	@Autowired
	private HttpSession session;
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
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
			
			//int bizSeq = ser.getSeq(id);
			BusinessMemberDTO sessiondto = (BusinessMemberDTO) session.getAttribute("binfo");
			int bizSeq = sessiondto.getSeq();
			BusinessDTO bizdto = ser.getBizInfo(bizSeq);
			session.setAttribute("bizInfo", bizdto);
			return "/memberB/loginView";
		}else {
			return "memberB/loginFail";
		}
	}
	
	@ResponseBody
	@RequestMapping("dupleCheck")
	public String dupleCheck(String id) {
		int result = ser.dupleCheck(id);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("emailSend")
	public String emailSend(String name, String email) throws Exception {
		return eser.sendEmailConfirm(name, email);
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
	@ResponseBody
	@RequestMapping("checkAndEmailSend")
	public String checkAndEmailSend(String id, String name, String email) throws Exception {
		String resultid= ser.findPW(id, name, email);
		if(resultid != null) {
		return eser.sendEmailConfirm(name, email);
		}
		return "0";
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
		
	
		BusinessMemberDTO dto = new BusinessMemberDTO(0,id,pw,name,email,phone,null,null,null,null);
		
		int result = ser.signup(dto);
		m.addAttribute("result", result);
		
		return "/memberB/signupView";
	}
	
	@RequestMapping("myPage")
	public String myPage(Model m) {
		
		BusinessMemberDTO dto = (BusinessMemberDTO) session.getAttribute("binfo");
		int bizSeq = dto.getSeq();

		BusinessDTO bizdto = ser.getBizInfo(bizSeq);
		m.addAttribute("bizInfo", bizdto);
		
		String id = dto.getId();
		List<BusinessFileDTO> flist = fser.getFlist(id);
		m.addAttribute("flist", flist);
	
		return "/memberB/myPage";
	}
	
	@RequestMapping("signOut")
	public String signOut(String id) {
		ser.signOut(id);
		session.invalidate();
		return "/memberB/memberOutView";
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

		
		ser.editPersonalInfo(dto);
		BusinessMemberDTO newdto =ser.getInfo((String) session.getAttribute("loginID"));
		session.setAttribute("binfo", newdto);
		return "redirect:/bMember/myPage";
	}
	
	@RequestMapping("findIDForm")
	public String findIDForm() {
		return "/memberB/findID";
	}
	
	@ResponseBody
	@RequestMapping("findIDProc")
	public String findIDProc(String name, String email) {
		String id = ser.findID(name, email);
		return id;
	}
	
	@RequestMapping("findPWForm")
	public String findPWForm(){
		return "/memberB/findPW";
	} 
	
	@ResponseBody
	@RequestMapping("findPWProc")
	public String findPWProc(String id, String name, String email) {
		String resultid =ser.findPW(id,name,email);
		return resultid;
	}
	
	@RequestMapping("changePW")
	public String changePW(String id, String pw,Model m) {
		String newpw = SHA256.getSHA512(pw);
		int result = ser.changePW(id, newpw);
		m.addAttribute("result", result);
		return "/memberB/chagePWView";
	}
	
	@RequestMapping("editBizInfo")
	public String editBizInfo(BusinessDTO dto) {

		int memSeq = ((BusinessMemberDTO) session.getAttribute("binfo")).getSeq();
		dto.setSeq(memSeq);
		ser.editBizInfo(dto);
		BusinessDTO newdto = ser.getBizInfo(memSeq);
		session.setAttribute("bizInfo", newdto);
		
		return "redirect:/bMember/myPage";
	}
	
	@RequestMapping("dashboard")
	public String dashboard(Model m) {
		if(session.getAttribute("bizInfo")!=null) {
		String businessName =((BusinessDTO) session.getAttribute("bizInfo")).getBusinessName();
		int biz_seq =((BusinessDTO) session.getAttribute("bizInfo")).getBiz_seq();
		
		String star_avg = ser.getStar_avg(biz_seq);
		int totalRes = ser.getTotalRes(biz_seq);
		int likes = ser.getLikes(biz_seq);
		
		List<Map<String, String>> ageResult = ser.getReserveAge(businessName);
		
		List<Object> ageData = new ArrayList<>(Arrays.asList(0,0,0,0,0));	
		for(int i=0; i<ageResult.size(); i++) {
			
			if(ageResult.get(i).get("연령대").equals("10대")) {
				ageData.set(0,ageResult.get(i).get("COUNT(연령대)"));
			}
			else if(ageResult.get(i).get("연령대").equals("20대")) {
				ageData.set(1,ageResult.get(i).get("COUNT(연령대)"));
			}
			else if(ageResult.get(i).get("연령대").equals("30대")) {
				ageData.set(2,ageResult.get(i).get("COUNT(연령대)"));
			}
			else if(ageResult.get(i).get("연령대").equals("40대")) {
				ageData.set(3,ageResult.get(i).get("COUNT(연령대)"));
			}
			else if(ageResult.get(i).get("연령대").equals("50대")) {
				ageData.set(4,ageResult.get(i).get("COUNT(연령대)"));
			}
		}
		
		
		List<Map<String, String>> nationResult = ser.getReserveNation(businessName);

		List<Object> nationLabel = new ArrayList<>(); 
		List<Object> nationData = new ArrayList<>(); 
		
		for(int i=0; i<nationResult.size(); i++) {
			nationLabel.add(nationResult.get(i).get("국적"));
			nationData.add(nationResult.get(i).get("COUNT(*)"));
		}
		
		
		
		
		
		List<Map<String, String>> monthResult = ser.getReserveMonth(businessName);
		List<Object> monthData = new ArrayList<>(Arrays.asList(0,0,0,0,0,0,0,0,0,0,0,0));
		for(int i=0; i<monthResult.size(); i++) {
			if(monthResult.get(i).get("월").equals("1월")) {
				monthData.set(0, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("2월")) {
				monthData.set(1, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("3월")) {
				monthData.set(2, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("4월")) {
				monthData.set(3, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("5월")) {
				monthData.set(4, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("6월")) {
				monthData.set(5, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("7월")) {
				monthData.set(6, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("8월")) {
				monthData.set(7, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("9월")) {
				monthData.set(8, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("10월")) {
				monthData.set(9, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("11월")) {
				monthData.set(10, monthResult.get(i).get("COUNT(*)"));
			}
			else if(monthResult.get(i).get("월").equals("12월")) {
				monthData.set(11, monthResult.get(i).get("COUNT(*)"));
			}
		}
		
		String biz_type = ((BusinessDTO) session.getAttribute("bizInfo")).getBiz_type();
		//Map<String, String> vsResult = ser.getVs(biz_type);
		//Map<String, String> vsMine = ser.getVsMine(businessName);
		String bizStar_avg = ser.getBizStar_avg(biz_type);
		int bizLikes = ser.getBizLikes(biz_type);
		int bizView_count = ser.getBizView_count(biz_type);
		
		m.addAttribute("star_avg", star_avg);
		m.addAttribute("totalRes", totalRes);
		m.addAttribute("likes", likes);
		
		m.addAttribute("ageData", ageData);
		m.addAttribute("nationLabel", nationLabel);
		m.addAttribute("nationData",nationData);
		m.addAttribute("monthData",monthData);
		
		m.addAttribute("bizStar_avg",bizStar_avg);
		m.addAttribute("bizLikes",bizLikes);
		m.addAttribute("bizView_count",bizView_count);
		}
		return "/memberB/dashboard";
	}
	
	@RequestMapping("chatting")
	public String chatting() {
		return "/memberB/chatting";
	}
	
	@GetMapping("/reservation")
	public String reservation(String res_name,Model model) {
		System.out.println(res_name);
		List<ReservationDTO> list = ser.resManage(res_name);
		model.addAttribute("resList",list);
		
		return "/memberB/myReservation";
	}
	
	@RequestMapping("noAccess")
	public String noAccess() {
		return "/memberB/noAccess";
	}
	
	

}
