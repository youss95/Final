package dream.tk.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.AdminMemberDTO;

@Repository
public class AdminMemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int idExist(String emp_id) {
		return mybatis.selectOne("aMember.idExist", emp_id);
	}
	public int nameExist(String name) {
		return mybatis.selectOne("aMember.nameExist", name);
	}

	public int insert(AdminMemberDTO dto) {
		return mybatis.insert("aMember.insert", dto);
	}
	public int update(AdminMemberDTO dto) {
		return mybatis.update("aMember.update", dto);
	}
	public int delete(String emp_id) {
		return mybatis.delete("aMember.delete", emp_id);
	}
	public int login(Map<String, String> param) {
		return mybatis.selectOne("aMember.login", param);
	}
	public AdminMemberDTO getInfo(String emp_id) {
		return mybatis.selectOne("aMember.getInfo", emp_id);
	}

}
