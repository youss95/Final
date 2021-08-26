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

import dream.tk.dto.AlaramInsertDTO;
import dream.tk.dto.AlarmPaginDTO;
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
	
	@PostMapping("/likeAlarm")
	@ResponseBody
	public String likeAlarm( String content, int seq) {
		System.out.println("seq"+seq);
		System.out.println("con"+content);
		String userId = notiService.getRecipient(seq);
		System.out.println("userId"+userId);
		notiService.alarmInsert(userId, content);
		return userId;
	}
	
	@GetMapping("/alarmCounts")
	@ResponseBody
	public int counts(String userId) {
		System.out.println(userId);
		int counts = notiService.countNoti(userId);
		return counts;
	}
	
	@GetMapping("/detail")
	public String notiDetail(String userId,int page, Model model) {
	
		List<NotificationDTO> list = notiService.getAllNotis(userId,page);
		AlarmPaginDTO dto = notiService.getPaging(userId, page);
		notiService.alarmRead();  //알람 읽음을 표시
		System.out.println(list.toString());
		model.addAttribute("paging",dto);
		model.addAttribute("notiList",list);
		return "/reservation/notiDetail";
	}
	
}
