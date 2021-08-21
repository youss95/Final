package dream.tk.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Map<String,String>> getBlackList(){
		return mybatis.selectList("admin.getBlackList");
	}
	
	public int businessOut(int seq){
		return mybatis.delete("admin.businessOut",seq);
	}
}
