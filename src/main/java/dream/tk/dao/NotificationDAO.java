package dream.tk.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NotificationDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int countNoti(String userId) {
		return mybatis.selectOne("notiMapper.countNoti", userId);
	}
	
	
	
}
