package dream.tk.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import dream.tk.dto.BusinessDTO;
import dream.tk.dto.BusinessFileDTO;
import dream.tk.service.BusinessFileService;
import dream.tk.service.StoreBusinessService;

@Controller
public class HomeController {

	@Autowired
	private BusinessFileService serviceF;
	
	@Autowired
	private StoreBusinessService serviceB;
	
	@RequestMapping("/")
	public String home(Model m) throws Exception{
		List<BusinessFileDTO> storePics =  serviceF.storePics();
	    m.addAttribute("storePics", storePics); //파일
	    
	    List<BusinessDTO> getBusiness = serviceB.selectAll();
	    m.addAttribute("getBusiness", getBusiness); //비지니스
	    
	  
		return "/Store/main";
	}
	
	
	   @ExceptionHandler
	   public String exceptionHandler(Exception e) {
	      e.printStackTrace();
	      return "error";
	   }
}
