package dream.tk.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import dream.tk.dao.ClientMemberDAO;
import dream.tk.dto.AdminMemberDTO;
import dream.tk.dto.ClientMemberDTO;

public class ClientMemberService {
	
	@Autowired
	private ClientMemberDAO dao;
	
	public int idCheck(String id) {
		return dao.idCheck(id);
	}
	
	public int insert(ClientMemberDTO dto) {
		return dao.insert(dto);
	}
	
	public int login(String id, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return dao.login(param);
	}
	
	public int update(ClientMemberDTO dto) {
		return dao.update(dto);
	}
	public int delete(String id) {
		return dao.delete(id);
	}
	public ClientMemberDTO getInfo(String id) {
		return dao.getInfo(id);
	}
}
