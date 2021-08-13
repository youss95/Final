package dream.tk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dream.tk.dto.StoreDTO;
import dream.tk.service.StoreService;



@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpSession session1;
	
	@Autowired
	private StoreService service;
	
	
	// Store 음식점 리스트

//	@RequestMapping("signup")
//	public String signup(Model model) throws Exception {
//		List<StoreDTO> list = service.selectAll();
//		model.addAttribute("storeList", list);
//		return "/Store/Store";
//	}
	
	@RequestMapping("signup")
	public String list(int cpage, String category, String keyword, Model m) throws Exception {
		m.addAttribute("cpage", cpage);
		m.addAttribute("searchList",service.searchList(category, keyword));
		m.addAttribute("list", service.list(cpage, category, keyword));
		m.addAttribute("navi", service.pageNavi(cpage, category, keyword));
		m.addAttribute("category", category);
		m.addAttribute("keyword", keyword);
		return "/Store/Store";
	}

	@RequestMapping("view")
	public String view(int store_seq, Model m) throws Exception{
		StoreDTO dto = service.select(store_seq);
		m.addAttribute("list", dto);
		return "/Store/StoreDetail";
	}
	
	
	@RequestMapping("store_detail")
	public String detail() {
		return "Store/StoreDetail";
	}
}
