package dream.tk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.BusinessMemberDAO;
import dream.tk.dao.ClientMemberDAO;
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
	
}
