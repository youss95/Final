package dream.tk.controller;

import java.util.List;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dto.TranslateDTO;
import dream.tk.service.NaverTransService;
import dream.tk.service.TranslateService;




@Controller
@RequestMapping("/trans")
public class TranslateController {

	//	@Autowired
	//	private HttpSession session;

	@Autowired
	private TranslateService service;

	@Autowired
	private NaverTransService serviceT;

	@RequestMapping(value="insertMenuForm")
	public String insertMenuForm() {
		return "/translation/transRequest";
	}

	@RequestMapping(value="insertMenuProc")
	public String insertMenuProc(String[] menu_kor, String[] price) throws Exception{

		JSONParser jsonParse = new JSONParser();

		//String business_id = (String) session.getAttribute("loginID");
		String business_id = "test02";
		//String business_name = daoB.getInfo(business_id).getName();
		String business_name ="test02Name";
		for(int i=0; i<menu_kor.length; i++) {
			String responseBody = serviceT.getTransSentence(menu_kor[i]);
			JSONObject responseObj;

			responseObj = (JSONObject) jsonParse.parse(responseBody);
			JSONObject messageObj = (JSONObject) responseObj.get("message");
			JSONObject resultObj = (JSONObject) messageObj.get("result");
			String menu_eng = (String) resultObj.get("translatedText");
			int p = Integer.parseInt(price[i]);
			TranslateDTO dto = new TranslateDTO(menu_kor[i], menu_eng, p, business_id, business_name);
			service.insertMenu(dto);

		}
		return "redirect:/trans/insertMenuForm";
	}

	@RequestMapping(value="transList")
	public String transList(Model m, int currentPage) {

		List<TranslateDTO> pageList = service.getPageList(currentPage);
		List<String> pageNavi = service.getPageNavi(currentPage);

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("pageList", pageList);
		m.addAttribute("pageNavi", pageNavi);

		return "/translation/transList";
	}

	@RequestMapping("transDetail")
	public String transDetail(String business_id, Model m) throws Exception{
		List<TranslateDTO> menuList = service.select(business_id);

		m.addAttribute("menuList", menuList);
		m.addAttribute("business_id", business_id);
		return "/translation/transDetail";
	}

	@ResponseBody
	@RequestMapping(value="directConfirm")
	public int directConfirm(int seq) {
		return service.directConfirm(seq);
	}
	
	@ResponseBody
	@RequestMapping(value="modiConfirm")
	public int modiConfirm(String menu_eng, int seq) {
		return service.modiConfirm(menu_eng, seq);
	}



	@ExceptionHandler
	public String exceptionHandlerB(Exception e) {
		e.printStackTrace();
		return "error";
	}


}
