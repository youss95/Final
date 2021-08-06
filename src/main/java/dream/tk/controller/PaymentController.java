package dream.tk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dao.ReservationDAO;
import dream.tk.dto.PaymentDTO;
import dream.tk.service.ReservationService;
import dream.tk.util.PaymentUtil;

@Controller
@RequestMapping("/pay")
public class PaymentController {

	
	@Autowired
	private ReservationService resService;
	
	@GetMapping("/res_payment")
	public String paymentPage() {
		
		return "/reservation/res_payment";
	}
	
	
	@PostMapping(value="/payment",produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> payCom(@RequestBody PaymentDTO dto) {
		System.out.println("되나염?");
		System.out.println(dto.toString());
		int result = resService.resPay(dto);
		if(result == 1) {
			return new ResponseEntity<String>("성공",HttpStatus.OK);
		}
		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@PostMapping(value="/cancel",produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String payCancel(String memberId) {
		System.out.println("도나");
		System.out.println(memberId);
		
		PaymentUtil obj = new PaymentUtil();
		String mui = resService.passRefund(memberId);
		System.out.println(mui);
		//m_uid를 디비에 저장해서 가져오자
		//merchant_ui를 받아오면 그것을 식별하고 환불이 진행
		  String token = obj.getImportToken(); 
		  int res = obj.cancelPayment(token,mui);
		 
		System.out.println(res);
		  if(res == 1) { 
			  resService.refundCheck(memberId); //환불이 되었다는 체크
			  return "success"; 
			  }
		 
		return "fail";
	}
	
}
