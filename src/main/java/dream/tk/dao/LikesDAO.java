package dream.tk.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.LikeDTO;

@Repository
public class LikesDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	

	//찜하기
	public int doLike(LikeDTO dto) {
		return mybatis.insert("like.doLike",dto);
	}
}
