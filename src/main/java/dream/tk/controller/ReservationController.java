package dream.tk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dream.tk.dto.BusinessDTO;
import dream.tk.dto.NotificationDTO;
import dream.tk.dto.ResInfoDTO;
import dream.tk.dto.ReservationDTO;
import dream.tk.dto.ReserveCheckDTO;
import dream.tk.service.ReservationService;

@Controller
@RequestMapping("/res")
public class ReservationController {

	@Autowired
	private ReservationService resService;
	
	@Autowired
	private HttpSession session;
	
	//test
	@GetMapping("/testtest")
	public String gogo() {
		return "/reservation/testtest";
	}
	
	
	//?bizs_seq= 붙이자 일단
	@GetMapping("/calendar")
	public String calendar(int biz_seq,String userId,Model model,String res_name) {
		
	ResInfoDTO resdto = new ResInfoDTO(userId,biz_seq);
	List<ReservationDTO> resInfo = resService.getResInfo(resdto);
	String od = resService.getOffday(biz_seq);
	List<String> offdays = resService.dayoff(od);
	String onday = resService.getOnday(biz_seq);
	model.addAttribute("resInfo",resInfo); //예약정보
	model.addAttribute("onday",onday);
	model.addAttribute("od",od);
	model.addAttribute("offdays",offdays);
	model.addAttribute("biz_seq", biz_seq);
	model.addAttribute("bizName",res_name);
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
	public String setTime(@Valid BusinessDTO dto, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			Map<String,String> errorMap = new HashMap<>();
			
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
		System.out.println("유효성 검사 실패 메시지: "+errorMap.get("businessContact"));
			return "/reservation/res_bizSetting";
		}
		
		
		
		
		System.out.println(dto.toString());
		session.setAttribute("bizName", dto.getBusinessName());
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
			
			return new ResponseEntity<String>("삭제성공",HttpStatus.OK);
		}
		
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
		System.out.println(userId);
		List<ReservationDTO> list = resService.resInfoList(userId);
		
		
		return list;
	}
	
	@PostMapping("/reserveCheck")
	@ResponseBody
	public String reserveCheck(@RequestBody ReserveCheckDTO dto) {
		System.out.println(dto.toString());
		String resCheck = resService.resCheck(dto);
		System.out.println("체크:" +resCheck);
	return resCheck;	
	}
	
	@GetMapping("/cancel")
	public String resRefuse(int res_no,String res_name) {
		System.out.println("name: "+res_name);
		resService.resRefuse(res_no);
		return "redirect:/bMember/myPage";
	}
	
	
}
