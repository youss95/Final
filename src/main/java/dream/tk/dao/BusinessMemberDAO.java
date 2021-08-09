package dream.tk.dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.BusinessDTO;
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
	
	public int signOut(String id) {
		return mybatis.delete("bMem.signOut", id);
	}
	
	public BusinessMemberDTO getInfo(String id) {
		return mybatis.selectOne("bMem.getInfo", id);
	}
	
	public int editPersonalInfo(BusinessMemberDTO dto) {
		return mybatis.delete("bMem.editPersonalInfo", dto);
	}
	
	public BusinessDTO getBizInfo(int bizSeq) {
		return mybatis.selectOne("bMem.getBizInfo", bizSeq);
	}
	
}
