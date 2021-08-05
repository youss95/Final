package dream.tk.service;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.AdminMemberDAO;
import dream.tk.dto.AdminMemberDTO;

@Service
public class AdminMemberService {
	
	@Autowired
	private AdminMemberDAO dao;
	
	public int preExist(String emp_id, String name) {
		Map<String, String> param = new HashMap<>();
		return dao.preExist(param);
	}
	
	public int insert(AdminMemberDTO dto) {
		return dao.insert(dto);
	}
	
	public int login(String emp_id, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("emp_id", emp_id);
		param.put("pw", pw);
		return dao.login(param);
		
	}
	
	public int update(AdminMemberDTO dto) {
		return dao.update(dto);
	}
	public int delete(String emp_id) {
		return dao.delete(emp_id);
	}
	public AdminMemberDTO getInfo(String emp_id) {
		return dao.getInfo(emp_id);
	}
	

}
