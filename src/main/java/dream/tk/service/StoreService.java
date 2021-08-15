package dream.tk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.config.PagingVO;
import dream.tk.dao.StoreDAO;
import dream.tk.dto.StoreDTO;




@Service
public class StoreService {
	
	@Autowired
	private StoreDAO dao;
	
	// 리스트 뿌리기
	public List<StoreDTO> selectAll() throws Exception{
		return dao.selectAll();
	}
	
	// 조회수 증가
	public StoreDTO select(int store_seq) throws Exception {
		dao.count(store_seq);
		return dao.select(store_seq);
	}
	// 페이지 카운터
	public int countBoard() throws Exception{
		return dao.countBoard();
	}

	// 페이지 리스트
	public List<StoreDTO> selectBoard(PagingVO vo) throws Exception {
		return dao.selectBoard(vo);
	}
	
	// 마커 다중 검색
	public List<StoreDTO> getList(StoreDTO searchVO) throws Exception {
	    return dao.getList(searchVO);
	}
	
	
}
