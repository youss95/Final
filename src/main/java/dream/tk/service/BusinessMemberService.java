package dream.tk.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.BusinessMemberDAO;
import dream.tk.dao.ClientMemberDAO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.BusinessMemberDTO;


@Service
public class BusinessMemberService {

	@Autowired
	private BusinessMemberDAO dao;
	
	@Autowired
	private ClientMemberDAO cdao;
	
	public int dupleCheck(String id) {
		int result1 = dao.dupleCheck(id);
		int result2 = cdao.idCheck(id);
		if(result1>0 || result2>0) {
			return 1;
		}
		return 0;
	}
	
	public int signup(BusinessMemberDTO dto) {
		return dao.signup(dto);
	}
	
	public int loginProc(String id, String pw) {
		Map<String,String> param =new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return dao.loginProc(param);
	}
	
	public int signOut(String id) {
		return dao.signOut(id);
	}
	
	public BusinessMemberDTO getInfo(String id) {
		return dao.getInfo(id);
	}
	
	public int editPersonalInfo(BusinessMemberDTO dto) {
		return dao.editPersonalInfo(dto);
	}
	
	public BusinessDTO getBizInfo(int bizSeq) {
		return dao.getBizInfo(bizSeq);
	}
	
	public String findID(String name, String email) {
		Map<String, String> param = new HashMap<>();
		param.put("name", name);
		param.put("email", email);
		return dao.findID(param);
	}
	
	public String findPW(String id, String name, String email) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("name", name);
		param.put("email", email);
		return dao.findPW(param);
	}
	
	public int changePW(String id, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return dao.changePW(param);
	}
	
}
