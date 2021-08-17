package dream.tk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dto.NotificationDTO;
import dream.tk.service.NotificationService;
import dream.tk.service.ReservationService;
@Controller
@RequestMapping("/noti")
public class NotificationController {

	@Autowired
	private ReservationService resService;
	
	@Autowired
	private NotificationService notiService;
	
	@PostMapping("/alarm")
	@ResponseBody
	public String at(@RequestBody NotificationDTO dto) {
		System.out.println(dto.toString());
		int result = resService.alarmInsert(dto);
		
		if(result==1)
		return "success";
		
		return "fail";
	}
	
	@GetMapping("/alarmCounts")
	@ResponseBody
	public int counts(String userId) {
		System.out.println(userId);
		int counts = notiService.countNoti(userId);
		return counts;
	}
	
	@GetMapping("/detail")
	public String notiDetail(String userId,Model model) {
		List<NotificationDTO> list = notiService.getAllNotis(userId);
		model.addAttribute("notiList",list);
		return "/reservation/notiDetail";
	}
	
}
