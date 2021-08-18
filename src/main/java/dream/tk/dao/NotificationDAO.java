package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.NotificationDTO;

@Repository
public class NotificationDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int countNoti(String userId) {
		return mybatis.selectOne("notiMapper.countNoti", userId);
	}
	
	public List<NotificationDTO> allNotis(String userId){
		System.out.println("dao 이름: "+userId);
		return mybatis.selectList("notiMapper.allNotis",userId);
	}
	
	public void alarmRead() {
		mybatis.update("notiMapper.alarmRead");
	}
	
}
