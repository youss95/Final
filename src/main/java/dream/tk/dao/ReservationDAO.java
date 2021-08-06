package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<String> dayoff(){
		List<String> list = mybatis.selectList("ResMapper.dayoff");
		System.out.println(list);
		return list;
	}
	
	public int resDelete(int resId) {
		int result = mybatis.delete("ResMapper.resDelete");
		return result;
	}
	
}
