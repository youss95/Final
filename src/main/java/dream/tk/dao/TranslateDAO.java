package dream.tk.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.TranslateDTO;

@Repository
public class TranslateDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public int insertMenu(TranslateDTO dto) {
		return mybatis.insert("trans.insertMenu", dto);
	}

	public int deleteAllMenu(String business_id) { 
		return mybatis.delete("trans.deleteAllMenu", business_id);
	}
	
	public List<TranslateDTO> select(int biz_seq) {
		return mybatis.selectList("trans.select", biz_seq);
	}
	
	public int directConfirm(int seq) {
		return mybatis.update("trans.directConfirm", seq);
	}
	public int modiConfirm(Map<String, String> param) {
		return mybatis.update("trans.modiConfirm", param);
	}

	public int getRecordCount(){
		return mybatis.selectOne("trans.getRecordCount");
	}
	public List<TranslateDTO> getPageList(Map<String, String> param){
		return mybatis.selectList("trans.getPageList", param);
	}
	
}
