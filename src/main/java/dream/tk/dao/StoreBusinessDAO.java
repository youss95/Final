package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.config.PagingVO;
import dream.tk.dto.AllResStoreDTO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.CategoryListDTO;
import dream.tk.dto.CategoryPagingDTO;
import dream.tk.dto.PagingNumDTO;

@Repository
public class StoreBusinessDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 페이지 뿌리기
	public List<BusinessDTO> selectAll() throws Exception{
		return mybatis.selectList("StoreBu.selectAll");
	}
	
	// 디테일 페이지
	public BusinessDTO select(int store_seq) throws Exception{
		return mybatis.selectOne("StoreBu.select", store_seq);
	}
	
	//상호명 불러오기
	public BusinessDTO getInfo(int seq){
		return mybatis.selectOne("StoreBu.getInfo", seq);
	}
	
	// 게시글 총 갯수
	public int countBoard() throws Exception{
		return mybatis.selectOne("StoreBu.countBoard");
	}

	// 페이징 처리 게시글 조회
	public List<BusinessDTO> selectBoard(PagingVO vo) throws Exception{
		return mybatis.selectList("StoreBu.selectBoard", vo);
	}
		
	
	// 조회수 카운터
	public int count(int store_seq) throws Exception {
		return mybatis.update("StoreBu.count", store_seq);
	}
	
	//페이징 카운트
	public int pagingCount() {
		return mybatis.selectOne("StoreBu.pagingCount");
	}
	
	public List<AllResStoreDTO> allResStore(PagingNumDTO dto){
		return mybatis.selectList("StoreBu.getListAllResStore",dto);
	}
	
	//비즈 타입 별로 리스트
	public List<CategoryListDTO> getListByCategory(CategoryPagingDTO dto){
		
		return mybatis.selectList("StoreBu.getListByBizType",dto);
	}
	
	// 마커 지도 검색 관련
	
	public List<BusinessDTO> getList(BusinessDTO searchVO) {
	    return mybatis.selectList("StoreBu.getList", searchVO);
	}
	
}
