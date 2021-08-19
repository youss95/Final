package dream.tk.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.BusinessFileDTO;

@Repository
public class BusinessFileDAO {

	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(Map<String,String> param) {
		return mybatis.insert("bFile.insert",param);
	}
	
	public List<BusinessFileDTO> getFlist(String id) {
		return mybatis.selectList("bFile.getFlist",id);
	}
	
	public int delete(String seq) {
		return mybatis.delete("bFile.delete", seq);
	}
	
	public String getSysName(String seq) {
		return mybatis.selectOne("bFile.getSysName",seq);
	}
	
}
