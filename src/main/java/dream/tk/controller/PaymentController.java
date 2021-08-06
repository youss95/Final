package dream.tk.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.util.PaymentUtil;

@Controller
@RequestMapping("/pay")
public class PaymentController {

	
	@GetMapping("/res_payment")
	public String paymentPage() {
		
		return "/reservation/res_payment";
	}
	
	
	@PostMapping(value="/payment",produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String payCom(@RequestBody String email) {
		System.out.println("되나염?");
		System.out.println(email);
		return email;
	}
	
	
	@PostMapping(value="/cancel",produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String payCancel(@RequestBody String email) {
		System.out.println("도나");
		System.out.println(email);
		
		PaymentUtil obj = new PaymentUtil();
		
		//m_uid를 디비에 저장해서 가져오자
		//merchant_ui를 받아오면 그것을 식별하고 환불이 진행
		  String token = obj.getImportToken(); 
		  int res = obj.cancelPayment(token,"merchant_1628173728023");
		 
		System.out.println(res);
		  if(res == 1) { return "thanks"; }
		 
		return email;
	}
	
}
