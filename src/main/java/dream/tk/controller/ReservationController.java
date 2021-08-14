package dream.tk.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dream.tk.dto.BusinessDTO;
import dream.tk.dto.NotificationDTO;
import dream.tk.dto.ReservationDTO;
import dream.tk.service.ReservationService;

@Controller
@RequestMapping("/res")
public class ReservationController {

	@Autowired
	private ReservationService resService;
	
	
	//?bizs_seq= 붙이자 일단
	@GetMapping("/calendar")
	public String calendar(int biz_seq,Model model) {

	//String time2 = replyService.restime(time);
	
	//System.out.println(time3);
	//model.addAttribute("time",time2);
		System.out.println(biz_seq);
		List<ReservationDTO> resInfo = resService.getResInfo();
	String od = resService.getOffday(biz_seq);
	System.out.println("od"+od);
	List<String> offdays = resService.dayoff(od);
	String onday = resService.getOnday(biz_seq);
	model.addAttribute("resInfo",resInfo); //예약정보
	model.addAttribute("onday",onday);
	model.addAttribute("od",od);
	model.addAttribute("offdays",offdays);
		return "/reservation/res_calendar";
	}
	
	@GetMapping("/bizSetting")
	public String bizSetting() {
		
		
		
		return "/reservation/res_bizSetting";
	}
	
	@GetMapping("/btnTest")
	public String btnTest() {
		return "/reservation/websocketBtnTest";
	}
	
	
	
	
	
	@PostMapping("/setTime")
	public String setTime(BusinessDTO dto) {
		String result = "";
		
		for(String time : dto.getOnday()) {
			result = result + time + "," ;
		}
		
		
		dto.setTimeAvailable(result);
		
		System.out.println(result);
		
		System.out.println(dto.toString());
		resService.registerBiz(dto);
		return "redirect: /";
	}
	
	@DeleteMapping(value="/{resId}",produces= {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
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
	
	
	@PostMapping(value = "/insertCal", produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String registerTime(@RequestBody ReservationDTO dto) {
		System.out.println(dto.toString());
		int result = resService.registerTime(dto);
		if(result == 1) {
		return "success";
		}
		return "fail";
	}
	
	@GetMapping(value= "/resInfoList",produces= {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<ReservationDTO> resInfoList(String userId){
		List<ReservationDTO> list = resService.resInfoList(userId);
		
		
		return list;
	}
	
	
}
