package dream.tk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.config.StoreConfig;
import dream.tk.dao.StoreDAO;
import dream.tk.dto.StoreDTO;



@Service
public class StoreService {
	
	@Autowired
	private StoreDAO dao;
	
	public List<StoreDTO> selectAll() throws Exception{
		return dao.selectAll();
	}
	
	public StoreDTO select(int store_seq) throws Exception {
		
		dao.count(store_seq);
		return dao.select(store_seq);
	}
	
	
	
	//페이지하기
	public List<StoreDTO> getPageList1(int startNum, int endNum) throws Exception{
		Map<String,Integer> param = new HashMap<>();
		param.put("startNum", startNum);
		param.put("endNum", endNum);
		return dao.getPageList1(param);
	}
	
	// 페이징 
	public List<StoreDTO> getPageList2(int startNum, int endNum, String category, String keyword) throws Exception{
		Map<String,Object> param = new HashMap<>();
		param.put("startNum", startNum);
		param.put("endNum", endNum);
		param.put("category", category);
		param.put("keyword", keyword);
		return dao.getPageList2(param);
	}
	
	public List<String> getPageNavi(int cpage, String category, String keyword) throws Exception{
		return dao.getPageNavi(cpage, category, keyword);
	}
	
	public List<StoreDTO> search(String category, String keyword) throws Exception{
		Map<String,String> param = new HashMap<>();
	      param.put("category", category);
	      param.put("keyword", keyword);
		return dao.search(param);
	}
	
	
	public List<StoreDTO> searchList(String category, String keyword) throws Exception{
		List<StoreDTO> searchList = null;
		Map<String,String> param = new HashMap<>();
	      param.put("category", category);
	      param.put("keyword", keyword);
		if(keyword==null||keyword.contentEquals("")) {
		}else {
			searchList = dao.search(param);
		}
		return searchList;
	}
	
	public List<StoreDTO> list(int cpage, String category, String keyword) throws Exception{
		int endNum =cpage*StoreConfig.RECORD_COUNT_PER_PAGE;
		int startNum =endNum -(StoreConfig.RECORD_COUNT_PER_PAGE-1);
		List<StoreDTO> list ;
		if(keyword==null||keyword.contentEquals("")) {
			Map<String,Integer> param = new HashMap<>();
			param.put("startNum", startNum);
			param.put("endNum", endNum);
			list = dao.getPageList1(param);
		}else {
			Map<String,Object> param = new HashMap<>();
			param.put("startNum", startNum);
			param.put("endNum", endNum);
			param.put("category", category);
			param.put("keyword", keyword);
			list = dao.getPageList2(param);
		}
		return list;
	}
	
	public List<String> pageNavi(int cpage, String category, String keyword) throws Exception{
		List<String> pageNavi = dao.getPageNavi(cpage,category,keyword);
		return pageNavi;
	}
	
	
	
}
