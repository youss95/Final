package dream.tk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dao.BusinessMemberDAO;
import dream.tk.dao.StoreBusinessDAO;
import dream.tk.dto.TranslateDTO;
import dream.tk.service.NaverTransService;
import dream.tk.service.TranslateService;




@Controller
@RequestMapping("/trans")
public class TranslateController {

	@Autowired
	private HttpSession session;

	@Autowired
	private TranslateService service;

	@Autowired
	private NaverTransService serviceT;
	
	@Autowired
	private BusinessMemberDAO daoBM;
	
	@Autowired
	private StoreBusinessDAO daoB;

	@RequestMapping(value="transRequest")
	public String insertMenuForm() {
		return "/translation/transRequest";
	}

	@RequestMapping(value="insertMenuProc")
	public String insertMenuProc(String[] menu_kor, String[] price) throws Exception{

		for(String str: menu_kor) {
			System.out.println("메뉴: "+ str);
		}
		for(String str: price) {
			System.out.println("가격: "+ str);
		}
		JSONParser jsonParse = new JSONParser();

		String business_id = (String) session.getAttribute("loginID");

		int business_seq = daoBM.getSeq(business_id);
		String business_name = daoB.getBusinessname(business_seq);

		//menu_kor를 String 배열로 받았기 때문에 for문 돌림
		for(int i=0; i<menu_kor.length; i++) {
			
			//for문 어디까지 돌아가는 지 일단 확인하기 위해
			System.out.println(i);
			
			//자동 번역 api로 영어로 번역
			String responseBody = serviceT.getTransSentence(menu_kor[i]);
			
			//JSON parser로 번역된 menu_eng만 꺼내는 과정
			JSONObject responseObj;
			responseObj = (JSONObject) jsonParse.parse(responseBody);
			JSONObject messageObj = (JSONObject) responseObj.get("message");
			JSONObject resultObj = (JSONObject) messageObj.get("result");
			String menu_eng = (String) resultObj.get("translatedText");
			
			//menu_kor랑 menu_eng 잘 나왔는지 확인
			System.out.println(menu_kor[i] +":"+ menu_eng);
			
			//DB에 넣는 작업
			int p = Integer.parseInt(price[i]);
			TranslateDTO dto = new TranslateDTO(menu_kor[i], menu_eng, p, business_id, business_name);
			service.insertMenu(dto);

		}
		return "redirect:/bMember/myPage";
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
