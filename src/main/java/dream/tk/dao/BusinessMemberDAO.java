package dream.tk.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.BusinessMemberDTO;

@Repository
public class BusinessMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int dupleCheck(String id) {
		return mybatis.selectOne("bMem.dupleCheck", id);
	}
	
	public int signup(BusinessMemberDTO dto) {
		return mybatis.insert("bMem.signup", dto);
	}
	
	public int loginProc(Map<String,String> param) {
		return mybatis.selectOne("bMem.loginProc", param);
	}
	
	
}
