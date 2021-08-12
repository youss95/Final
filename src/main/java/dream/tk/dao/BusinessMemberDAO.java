package dream.tk.dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
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
	
	public String findID(Map<String,String> param) {
		return mybatis.selectOne("bMem.findID",param);
	}
	
	public String findPW(Map<String,String> param) {
		return mybatis.selectOne("bMem.findPW",param);
	}
	
	public int changePW(Map<String,String> param) {
		return mybatis.update("bMem.changePW",param);
	}
	
	public int editBizInfo(BusinessDTO dto) {
		return mybatis.update("bMem.editBizInfo", dto);
	}
	
	
	
	
	
	
	public List<Map<String, String>> getReserveAge(String businessName) {
		//return (List<Map<Object, Object>>) mybatis.selectMap("bMem.getReserveAge",businessName);
		return mybatis. selectList("bMem.getReserveAge",businessName);
	}
	
	public List<Map<String, String>> getReserveNation(String businessName) {
		return mybatis. selectList("bMem.getReserveNation",businessName);
	}
	
	public List<Map<String, String>> getReserveMonth(String businessName) {
		return mybatis. selectList("bMem.getReserveMonth",businessName);
	}
	
	
}
