package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.NotificationDTO;
import dream.tk.dto.PagingListDTO;

@Repository
public class NotificationDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int countNoti(String userId) {
		return mybatis.selectOne("notiMapper.countNoti", userId);
	}
	
	public List<NotificationDTO> allNotis(PagingListDTO dto){
		System.out.println("dao 이름: "+dto);
		return mybatis.selectList("notiMapper.allNotis",dto);
	}
	
	public void alarmRead() {
		mybatis.update("notiMapper.alarmRead");
	}
	
	public int countForPaging(String userId) {
		return mybatis.selectOne("notiMapper.countForPaging",userId);
	}
	
}
