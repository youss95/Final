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
import dream.tk.dto.AllResStoreDTO;
import dream.tk.dto.AllResStorePagingDTO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.BusinessFileDTO;
import dream.tk.dto.CategoryListDTO;
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
			List<BusinessFileDTO> storePics =  serviceF.storePics();
		    model.addAttribute("storePics", storePics); //파일
			
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
	
	   @RequestMapping("/viewAll")
	   public String viewAllResStore(int page,Model model) {
		   List<AllResStoreDTO> list = service.getAllResStoreList(page);
		   System.out.println("size: "+list.size());
				  AllResStorePagingDTO dto = service.getPaging(page);
				  System.out.println(dto.toString());
				  model.addAttribute("paging",dto);
				  model.addAttribute("storeList",list);
				  return "/Store/BusinessStore";
	   }
	   
	   @RequestMapping("/viewByBizType")
	   public String viewByBizType(int page,String biz_type,Model model) {
		   System.out.println(biz_type);
		   List<AllResStoreDTO> list = service.getAllByBizType(page,biz_type); //페이지당 12개
		   System.out.println(list.size());
		   AllResStorePagingDTO dto = service.getPagingCategory(page,biz_type);
		   model.addAttribute("paging",dto);
		   model.addAttribute("storeList",list);
		   model.addAttribute("biz_type",biz_type);
		   return "/Store/BusinessStoreCategory";
	   }
	   
		/*
		 * @RequestMapping("/viewCategory") public String viewByCategory(String
		 * biz_type,int page, Model model) {
		 * 
		 * List<CategoryListDTO> list = service.getListByCategory(biz_type, page);
		 * System.out.println(list.toString()); model.addAttribute("cateList",list);
		 * 
		 * return "/Store/BusinessStoreCategory"; }
		 */
	   
	   
	
	// 혹시 모르는 페이지
	@RequestMapping("store_detail")
	public String detail() {
		return "/Store/BusinessStoreDetail";
	}



	
	   @ExceptionHandler
	   public String exceptionHandler(Exception e) {
	      e.printStackTrace();
	      return "error";
	   }
}

