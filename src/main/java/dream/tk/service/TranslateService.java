package dream.tk.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.config.TranslateConfig;
import dream.tk.dao.TranslateDAO;
import dream.tk.dto.TranslateDTO;


@Service
public class TranslateService {
	@Autowired
	private TranslateDAO dao;
	
	public int insertMenu(TranslateDTO dto) {
		return dao.insertMenu(dto);
	}

	public int deleteAllMenu(String business_id) {
		return dao.deleteAllMenu(business_id);
	}
	public List<TranslateDTO> select(String business_id){
		return dao.select(business_id);
	}
	
	public int directConfirm(int seq) {
		return dao.directConfirm(seq);
	}
	public int modiConfirm(String menu_eng, int seq) {
		Map<String, String> param = new HashMap<>();
		param.put("menu_eng", menu_eng);
		param.put("seq", String.valueOf(seq));
		return dao.modiConfirm(param);
	}
	
	//메뉴 신청 확인 페이징
	public List<TranslateDTO> getPageList(int cpage) {
		int endNum =cpage*TranslateConfig.RECORD_COUNT_PER_PAGE;
		int startNum =endNum -(TranslateConfig.RECORD_COUNT_PER_PAGE-1);

		Map<String, String> param = new HashMap<>();
		param.put("startNum", String.valueOf(startNum));
		param.put("endNum", String.valueOf(endNum));
		
		return dao.getPageList(param);
	}
	public List<String> getPageNavi(int currentPage) {
		int recordTotalCount ;

		recordTotalCount=dao.getRecordCount();

		int recordCountPerPage = TranslateConfig.RECORD_COUNT_PER_PAGE; // 한 페이지 당 보여줄 게시글의 개수
		int naviCountPerPage = TranslateConfig.NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작부터 끝까지의 페이지가 총 몇개인지

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
	

}
