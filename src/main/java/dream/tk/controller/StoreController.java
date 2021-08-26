package dream.tk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dream.tk.config.PagingVO;
import dream.tk.dto.LikeStatusDTO;
import dream.tk.dto.StoreDTO;
import dream.tk.service.CommentService;
import dream.tk.service.LikesService;
import dream.tk.service.StoreService;
import net.sf.json.JSONArray;



@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private HttpSession session;
		
	@Autowired
	private HttpSession session1;
	
	@Autowired
	private StoreService service;
	
	@Autowired
	private CommentService serviceC;
	
	// 혹시 모르는 페이지
	@RequestMapping("main")
	public String Main() {
		return "Store/main";
	}
	
	@GetMapping("signup")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @ModelAttribute("searchVO") StoreDTO searchVO,  ModelMap modelMap
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		int total = service.countBoard();
		System.out.println(searchVO);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "12";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
				
		try {
			model.addAttribute("viewAll", service.selectBoard(vo));
			List<StoreDTO> test = service.getList(searchVO);
			modelMap.addAttribute("rdnmadrListJson", JSONArray.fromObject(test));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/Store/Store";
	}
	
	//디테일 페이지로
	@RequestMapping("view")
	public String view(int store_seq,Model m, String store) throws Exception{
		StoreDTO dto = service.select(store_seq);
		
		
		m.addAttribute("countCmt", serviceC.count(store_seq));
		m.addAttribute("list", dto);
		
		System.out.println(dto.toString());
		session.setAttribute("store", store);
		return "/Store/StoreDetail";
	}
	

	@ExceptionHandler
	   public String exceptionHandler(Exception e) {
	      e.printStackTrace();
	      return "error";
	   }
	
	
}
