package dream.tk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.config.PagingVO;
import dream.tk.dao.StoreBusinessDAO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.CategoryListDTO;
import dream.tk.dto.CategoryPagingDTO;

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
	
	//카테고리 별 리스트
	public List<CategoryListDTO> getListByCategory(String biz_type,int page){
		
		int firstNum = (page-1)*4+1;
		int secondNum = page*4;
		CategoryPagingDTO dto = new CategoryPagingDTO(biz_type, firstNum, secondNum);
		return daoc.getListByCategory(dto);
	}
	
	// 마커 다중 검색
	public List<BusinessDTO> getList(BusinessDTO searchVO) throws Exception {
	    return daoc.getList(searchVO);
	}
}
