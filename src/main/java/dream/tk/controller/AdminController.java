package dream.tk.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.service.AdminService;



@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private HttpSession session;



	@Autowired
	private AdminService serviceA;


	@RequestMapping(value="dashForm")
	public String dashForm(Model m) {
		
		int total = serviceA.totalC() + serviceA.totalB();
		int totalC = serviceA.totalC();
		int totalB = serviceA.totalB();
		
		List<String> totalPerMonthLabel = serviceA.totalPerMonthLabel();
		List<Integer> totalPerMonthCounts = serviceA.totalPerMonthCounts();
		
		List<String> clietPerNationLabel = serviceA.clietPerNationLabel();
		List<Integer> clietPerNationCounts = serviceA.clietPerNationCounts();
		
		
		List<String> clientPerMonthLabel = serviceA.clientPerMonthLabel();
		List<Integer> clientPerMonthCounts = serviceA.clientPerMonthCounts();

		List<String> clientAgesLabel = serviceA.clientAgesLabel();
		List<Integer> clientAgesCounts = serviceA.clientAgesCounts();
		
		List<String> businessPerMonthLabel = serviceA.businessPerMonthLabel();
		List<Integer> businessPerMonthCounts = serviceA.businessPerMonthCounts();
		
		List<String> reservationLabel= serviceA.reservationLabel();
		List<Integer> reservationCounts = serviceA.reservationCounts();
		
		m.addAttribute("total", total);
		m.addAttribute("totalC", totalC);
		m.addAttribute("totalB", totalB);
		m.addAttribute("totalPerMonthLabel", totalPerMonthLabel);
		m.addAttribute("totalPerMonthCounts", totalPerMonthCounts);
		m.addAttribute("clietPerNationLabel", clietPerNationLabel);
		m.addAttribute("clietPerNationCounts", clietPerNationCounts);
		m.addAttribute("clientPerMonthLabel", clientPerMonthLabel);
		m.addAttribute("clientPerMonthCounts", clientPerMonthCounts);
		m.addAttribute("clientAgesLabel", clientAgesLabel);
		m.addAttribute("clientAgesCounts", clientAgesCounts);
		m.addAttribute("businessPerMonthLabel", businessPerMonthLabel);
		m.addAttribute("businessPerMonthCounts", businessPerMonthCounts);
		m.addAttribute("reservationLabel", reservationLabel);
		m.addAttribute("reservationCounts", reservationCounts);
		return "admin/adminDashboard";
	}

	



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


	@RequestMapping(value="insertForm")
	public String insertForm() {
		System.out.println("insertForm 요청");
		return "admin/insert";
	}

	@RequestMapping(value="insertC")
	public String insertC() {
		System.out.println("inserC 요청");
		serviceA.insertC();
		return "admin/insert";
	}

	@RequestMapping(value="insertB")
	public String insertB() {
		System.out.println("inserB 요청");
		serviceA.insertB();
		return "admin/insert";
	}
}