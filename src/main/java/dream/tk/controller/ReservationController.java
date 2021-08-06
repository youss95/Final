package dream.tk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dream.tk.dto.BusinessDTO;
import dream.tk.service.ReservationService;

@Controller
@RequestMapping("/res")
public class ReservationController {

	@Autowired
	private ReservationService resService;
	
	@GetMapping("/calendar")
	public String calendar(String time,Model model) {
	System.out.println(time);
	//String time2 = replyService.restime(time);
	List<String> offdays = resService.dayoff();
	//System.out.println(time3);
	//model.addAttribute("time",time2);
	model.addAttribute("offdays",offdays);
		return "/reservation/res_calendar";
	}
	
	@GetMapping("/bizSetting")
	public String bizSetting() {
		return "/reservation/res_bizSetting";
	}
	
	@PostMapping("/setTime")
	public String setTime(BusinessDTO dto) {
		String result = "";
		
		for(String time : dto.getOnday()) {
			result = result + time + "," ;
		}
		System.out.println(result);
		
		System.out.println(dto.toString());
		return "/home";
	}
	
	@DeleteMapping("/{resId}")
	public ResponseEntity<String> resDelete(@PathVariable int resId){
		System.out.println(resId);
		//삭제
		int result= resService.resDelete(resId);
		if(result == 1) {
			//200번
			return new ResponseEntity<String>("삭제성공",HttpStatus.OK);
		}
		//500번
		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
