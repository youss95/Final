package dream.tk.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.AdminDAO;
import dream.tk.dao.AdminMemberDAO;

@Service
public class AdminService {

	@Autowired
	private AdminMemberDAO dao;
	
	@Autowired
	private AdminDAO Adao;

	public List<Map<String,String>>getBlacklist(){
		return Adao.getBlackList();
	}

	public int businessOut(int seq){
		return Adao.businessOut(seq);
	}

}
