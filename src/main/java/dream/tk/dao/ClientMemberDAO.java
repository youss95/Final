package dream.tk.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import dream.tk.dto.ClientMemberDTO;

@Repository
public class ClientMemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int idCheck(String id) {
		return mybatis.selectOne("cMember.idCheck", id);
	}
	public int insert(ClientMemberDTO dto) {
		return mybatis.insert("cMember.insert", dto);
	}
	public int update(ClientMemberDTO dto) {
		return mybatis.update("cMember.update", dto);
	}
	public int delete(String id) {
		return mybatis.delete("cMember.delete", id);
	}
	public int login(Map<String, String> param) {
		return mybatis.selectOne("cMember.login", param);
	}
	public ClientMemberDTO getInfo(String id) {
		return mybatis.selectOne("cMember.getInfo", id);
	}
	public int matchNameEmail(Map<String, String> param) {
		return mybatis.selectOne("cMember.matchNameEmail", param);
	}
	public String findID(Map<String, String> param) {
		return mybatis.selectOne("cMember.findID", param);
	}
	public int matchIdNameEmail(Map<String, String> param) {
		return mybatis.selectOne("cMember.matchNameEmail", param);
	}
	public int resetPW(Map<String, String> param) {
		return mybatis.update("cMember.resetPW", param);
	}
}
