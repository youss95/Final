  package dream.tk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.config.StoreConfig;
import dream.tk.dto.StoreDTO;



@Repository
public class StoreDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<StoreDTO> selectAll() throws Exception{
		return mybatis.selectList("Store.selectAll");
	}
	
	public StoreDTO select(int store_seq) throws Exception{
		return mybatis.selectOne("Store.select", store_seq);
	}
	
	
	private int getRecordCount1() throws Exception {
		return mybatis.selectOne("Store.getRecordCount1");
	}
	// 오버 로딩해서 다시 하나 더 만들기

	private int getRecordCount2(String category, String keyword) throws Exception{
		Map<String,String> param = new HashMap<>();
	      param.put("category", category);
	      param.put("keyword", keyword);
		return mybatis.selectOne("Store.getRecordCount2",param); 
	}
	
	
	public List<String> getPageNavi(int currentPage, String category, String keyword) throws Exception {
		int recordTotalCount ;
		if(keyword==null||keyword.contentEquals("")) {
			recordTotalCount=this.getRecordCount1();
		}else {
			recordTotalCount=this.getRecordCount2(category,keyword);
		}

		int recordCountPerPage = StoreConfig.RECORD_COUNT_PER_PAGE; // 한 페이지 당 보여줄 게시글의 개수
		int naviCountPerPage = StoreConfig.NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작부터 끝까지의 페이지가 총 몇개인지

		int pageTotalCount = 0;   
		// 전체 레코드를 페이지당 보여줄 게시글 수 로 나눠서, 나머지가 0보다 크다면 1페이지를 더 추가해줘라!
		if (recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
		} else {
			// 전체 레코드를 페이지당 보여줄 게시글 수 로 나눠서, 나머지가 0이면
			// 페이지의 게시글 수와 레코드 개수가 딱 맞아 떨어지니까, 총 만들어야 할 전체 페이지 개수도 딱 맞아 떨어진다!
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}


		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} else if (currentPage < 1) {
			currentPage = 1;
		}

		// 페이지 네비게이터의 첫번째 시작 숫자를 알 수 있는 코드
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		// 페이지 네비게이터의 마지막 숫자를 알 수 있는 코드
		int endNavi = startNavi + (naviCountPerPage - 1);
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		// 페이지 < 1 2 3 4 5> 처럼 이전, 이후 표시 만드는 코드
		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		List<String> pageNavi = new ArrayList<>();
		if (needPrev) {
			pageNavi.add("<");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi.add(String.valueOf(i)); // 숫자 i를 string으로 변환해서 add 해주기!
		}
		if (needNext) {
			pageNavi.add(">");
		}

		return pageNavi;

	}

	public List<StoreDTO> getPageList1(Map<String,Integer> param) throws Exception {
		return mybatis.selectList("Store.getPageList1", param);
	}
	// 검색 후, 페이지 리스트를 가져오는 메서드를 오버로딩해서 한번 더 만들기!
	public List<StoreDTO> getPageList2(Map<String,Object> param) throws Exception {
		return mybatis.selectList("Store.getPageList2",param);

	}
	//========= 게시판  페이징 처리 끝! ======================================================================	
	public List<StoreDTO> search(Map<String,String> param) throws Exception {
		return mybatis.selectList("Store.search",param);
	}
	
	
	// 조회수 카운터
	public int count(int store_seq) throws Exception {
		return mybatis.update("Store.count", store_seq);
	}
	
	
	
}
