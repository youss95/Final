package dream.tk.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.ClientMemberDAO;
import dream.tk.dto.ClientMemberDTO;

@Service
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
	
	public int matchNameEmail(String name, String email) {
		Map<String, String> param = new HashMap<>();
		param.put("name", name);
		param.put("email", email);
		return dao.matchNameEmail(param);
	}
	public String findID(String name, String email) {
		Map<String, String> param = new HashMap<>();
		param.put("name", name);
		param.put("email", email);
		return dao.findID(param);
	}
	public int matchIdNameEmail(String id, String name, String email) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("name", name);
		param.put("email", email);
		return dao.matchIdNameEmail(param);
	}
	public int resetPW(String id, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return dao.resetPW(param);
	}
	
}
