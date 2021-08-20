package dream.tk.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.api.SHA256;
import dream.tk.dao.ClientMemberDAO;
import dream.tk.dto.ClientMemberDTO;

@Service
public class ClientMemberService {
	
	@Autowired
	private ClientMemberDAO dao;
	
	public int idCheck(String id) {
		return dao.idCheck(id);
	}
	public void insert() {
		String[] nations = new String[]{"AR", "AU", "BR", "CA", "CN", "FR", "DE", "IN", "ID", "IT", "JP", "KR", "MX", "RU", "SA", "ZA", "TR", "GB", "US"};
		int indexN= 1;
		int indexD=1;
		Date[] dates = new Date[] { 
				java.sql.Date.valueOf("2020-09-18"), java.sql.Date.valueOf("2020-10-18"), 
				java.sql.Date.valueOf("2021-11-18"), java.sql.Date.valueOf("2021-12-18"), 
				java.sql.Date.valueOf("2021-01-18"), java.sql.Date.valueOf("2021-02-18"), 
				java.sql.Date.valueOf("2021-03-18"), java.sql.Date.valueOf("2021-04-18"),
				java.sql.Date.valueOf("2021-05-18"), java.sql.Date.valueOf("2021-06-18"),
				java.sql.Date.valueOf("2021-07-18"), java.sql.Date.valueOf("2021-08-18")};
		int yob=1;
		for(int i=300; i<400;i++) {
			indexN = (int)(Math.random()*19);
			indexD = (int)(Math.random()*12);
			String id = "test000"+String.valueOf(i);
			String pw = "test000"+String.valueOf(i)+"!!";
			String shaPW = SHA256.getSHA512(pw);
			String email = "test000"+String.valueOf(i)+"google.com";
			String name = "test000"+String.valueOf(i);
			yob =(int)(Math.random()*20)+1980;
			String nation = nations[indexN];
			String agree = "agree";
			Date reg_date = dates[indexD];
			dao.insert(new ClientMemberDTO(0, id, shaPW, email, name, yob, nation, agree, reg_date));
		}
	}
	public int signup(ClientMemberDTO dto) {
		return dao.signup(dto);
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
