package dream.tk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dream.tk.config.PagingVO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.BusinessFileDTO;
import dream.tk.dto.LikeStatusDTO;
import dream.tk.dto.TranslateDTO;
import dream.tk.service.BusinessFileService;
import dream.tk.service.LikesService;
import dream.tk.service.StoreBusinessService;
import dream.tk.service.TranslateService;
import net.sf.json.JSONArray;


@Controller
@RequestMapping("/Business")
public class BusinessStoreController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpSession session1;
	
	@Autowired
	private StoreBusinessService service;
	
	@Autowired
	private LikesService likeService;
	
	@Autowired
	private TranslateService serviceT;
	
	@Autowired
	private BusinessFileService serviceF;
	
	
	
	
	@GetMapping("signup")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @ModelAttribute("searchVO") BusinessDTO searchVO,  ModelMap modelMap
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
			
			List<BusinessDTO> test = service.getList(searchVO);
			modelMap.addAttribute("rdnmadrListJson", JSONArray.fromObject(test));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/Store/BusinessStore";
	}
	
	//디테일 페이지로
	   @RequestMapping("view")
	   public String view(int biz_seq,String userId, Model m, String store) throws Exception{
	      BusinessDTO dto = service.select(biz_seq);
	      LikeStatusDTO statusDto = new LikeStatusDTO(biz_seq,userId);
	      String likeStatus = likeService.likeStatus(statusDto);

	      List<TranslateDTO> menuList = serviceT.select(biz_seq);
	      m.addAttribute("menuList", menuList);
	      
	      List<BusinessFileDTO> getFlist =  serviceF.getFlistSeq(biz_seq);
	      m.addAttribute("getFlist", getFlist);
	      
	      //m.addAttribute("countCmt", serviceC.count(store_seq));
	      m.addAttribute("list", dto);
	      m.addAttribute("likeStatus",likeStatus);
	      session.setAttribute("store", store);
	      return "/Store/BusinessStoreDetail";
	   }
	
	
	// 혹시 모르는 페이지
	@RequestMapping("store_detail")
	public String detail() {
		return "/Store/BusinessStoreDetail";
	}
}
