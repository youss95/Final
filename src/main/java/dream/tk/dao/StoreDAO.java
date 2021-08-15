  package dream.tk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.config.PagingVO;
import dream.tk.dto.StoreDTO;




@Repository
public class StoreDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 페이지 뿌리기
	public List<StoreDTO> selectAll() throws Exception{
		return mybatis.selectList("Store.selectAll");
	}
	
	// 디테일 페이지
	public StoreDTO select(int store_seq) throws Exception{
		return mybatis.selectOne("Store.select", store_seq);
	}
	
	
	// 게시글 총 갯수
	public int countBoard() throws Exception{
		return mybatis.selectOne("Store.countBoard");
	}

	// 페이징 처리 게시글 조회
	public List<StoreDTO> selectBoard(PagingVO vo) throws Exception{
		return mybatis.selectList("Store.selectBoard", vo);
	}
		
	
	// 조회수 카운터
	public int count(int store_seq) throws Exception {
		return mybatis.update("Store.count", store_seq);
	}
	
	// 마커 지도 검색 관련
	
	public List<StoreDTO> getList(StoreDTO searchVO) {
	    return mybatis.selectList("Store.getList", searchVO);
	}
	
	
	
}
