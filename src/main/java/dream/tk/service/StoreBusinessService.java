package dream.tk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.config.PagingVO;
import dream.tk.dao.StoreBusinessDAO;
import dream.tk.dto.AllResStoreDTO;
import dream.tk.dto.AllResStorePagingDTO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.CategoryListDTO;
import dream.tk.dto.CategoryPagingDTO;
import dream.tk.dto.CategoryPagingNumDTO;
import dream.tk.dto.PagingNumDTO;

@Service
public class StoreBusinessService {
	@Autowired
	private StoreBusinessDAO daoc;
	
	// 리스트 뿌리기
	public List<BusinessDTO> selectAll() throws Exception{
		return daoc.selectAll();
	}
	
	// 조회수 증가
	public BusinessDTO select(int biz_seq) throws Exception {
		daoc.count(biz_seq);
		return daoc.select(biz_seq);
	}
	// 페이지 카운터
	public int countBoard() throws Exception{
		return daoc.countBoard();
	}

	// 페이지 리스트
	public List<BusinessDTO> selectBoard(PagingVO vo) throws Exception {
		
		return daoc.selectBoard(vo);
	}
	
	//list
	public List<AllResStoreDTO> getAllResStoreList(int page){

		int firstNum = (page-1)*12+1;
		int secondNum = page*12;
		PagingNumDTO dto = new PagingNumDTO(firstNum,secondNum);
		return daoc.allResStore(dto);
	}
	
	//페이징
	public AllResStorePagingDTO getPaging(int page) {
		int allCount = daoc.pagingCount();
		System.out.println("coutn: "+allCount);
		int nowGrp = (int)(Math.ceil((double)page/10));
		int startNum = (nowGrp-1)*10+1;
		int lastNum = nowGrp*10;
		int lastPage = (int)Math.ceil(allCount/12.0);
		int endPage =  lastNum > lastPage ? lastPage : lastNum;
		AllResStorePagingDTO dto = new AllResStorePagingDTO(startNum,lastNum,lastPage,endPage);
		return dto;
	}
	//cate 페이징
	public AllResStorePagingDTO getPagingCategory(int page,String biz_type) {
		//int allCount = daoc.pagingCount();
		int allCount = daoc.categoryCount(biz_type);
		System.out.println("coutn: "+allCount);
		int nowGrp = (int)(Math.ceil((double)page/10));
		int startNum = (nowGrp-1)*10+1;
		int lastNum = nowGrp*10;
		int lastPage = (int)Math.ceil(allCount/12.0);
		int endPage =  lastNum > lastPage ? lastPage : lastNum;
		AllResStorePagingDTO dto = new AllResStorePagingDTO(startNum,lastNum,lastPage,endPage);
		return dto;
	}
	
	//비즈타입
	public List<AllResStoreDTO> getAllByBizType(int page,String biz_type){
		int firstNum = (page-1)*12+1;
		int secondNum = page*12;
		CategoryPagingNumDTO dto = new CategoryPagingNumDTO(firstNum,secondNum,biz_type);
		return daoc.allResStoreCategory(dto);
	}
	

	/*
	 * public List<CategoryListDTO> getListByCategory(String biz_type,int page){
	 * 
	 * int firstNum = (page-1)*4+1; int secondNum = page*4; CategoryPagingDTO dto =
	 * new CategoryPagingDTO(biz_type, firstNum, secondNum); return
	 * daoc.getListByCategory(dto); }
	 */
	
	// 마커 다중 검색
	public List<BusinessDTO> getList(BusinessDTO searchVO) throws Exception {
	    return daoc.getList(searchVO);
	}
}
