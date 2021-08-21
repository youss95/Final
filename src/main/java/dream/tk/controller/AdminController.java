package dream.tk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.service.AdminService;
import dream.tk.service.BusinessMemberService;
import dream.tk.service.ClientMemberService;



@Controller
@RequestMapping("/admin")
public class AdminController {
   
   @Autowired
   private HttpSession session;

   @Autowired
   private ClientMemberService serviceC;
   
   @Autowired
   private BusinessMemberService serviceB;
   
   @Autowired
   private AdminService serviceA;
   
   
   @RequestMapping(value="dashForm")
   public String dashForm() {
      return "admin/adminDashboard";
   }
   
   @RequestMapping(value="insertForm")
   public String insertForm() {
      System.out.println("insertForm 요청");
      return "admin/insert";
   }
   
   @RequestMapping(value="insertC")
   public String insertC() {
      System.out.println("inserC 요청");
      serviceC.insert();
      return "admin/insert";
   }
   
   @RequestMapping(value="insertB")
   public String insertB() {
      System.out.println("inserB 요청");
      //serviceB.insert();
      return "admin/insert";
   }
//   @RequestMapping(value="signupProc")
//   public String signupProc(AdminMemberDTO dto, Model m) {
//      String shaPW = SHA256.getSHA512(dto.getPw());
//      dto.setPw(shaPW);
//      int result = service.insert(dto);
//
//      m.addAttribute("result", result);
//      return "memberA/signupResult";
//   }
   
//   @ResponseBody
//   @RequestMapping(value="emailConfirm")
//   public String emailConfirm(String name, String email) throws Exception {
//      return serviceE.sendEmailConfirm(name, email);
//   }
   
   	@RequestMapping("manageBusinessPage")
   	public String manageBusiness(Model m) {
   	 System.out.println(serviceA.getBlacklist());
   	  m.addAttribute("blackList",serviceA.getBlacklist());
      return "admin/manageBusiness";
   	}
   	
   	@ResponseBody
	@RequestMapping("businessOut")
   	public int businessOut(int seq) {
   	return serviceA.businessOut(seq);
   	}
}