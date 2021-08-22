package dream.tk.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.AdminDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int totalC() {
		return mybatis.selectOne("admin.totalC");
	}
	public int totalB() {
		return mybatis.selectOne("admin.totalB");
	}
	
	public List<AdminDTO> clietPerNation(){
		return mybatis.selectList("admin.clietPerNation");
	}
	public List<AdminDTO> clientPerMonth(){
		return mybatis.selectList("admin.clientPerMonth");
	}
	public List<AdminDTO> clientAges(){
		return mybatis.selectList("admin.clientAges");
	}
	
	public List<AdminDTO> businessPerMonth(){
		return mybatis.selectList("admin.businessPerMonth");
	}
	
	public List<AdminDTO> reservation(){
		return mybatis.selectList("admin.reservation");
	}
	
	public List<Map<String,String>> getBlackList(){
		return mybatis.selectList("admin.getBlackList");
	}
	
	public int businessOut(int seq){
		return mybatis.delete("admin.businessOut",seq);
	}
}
