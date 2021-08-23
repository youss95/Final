package dream.tk.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.LikeStatusDTO;
import dream.tk.dto.LikesDTO;



@Repository
public class LikesDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	

	//찜하기
	
	  public int doLike(LikesDTO dto) { return mybatis.insert("like.doLike",dto); }
	  
	  public int updateLike(LikesDTO dto) {
		  return mybatis.update("like.updateStatus",dto);
				  
	  }
	  
	  //찜하기 상태 가져오기
	  public String likeStatus(LikeStatusDTO dto) {
		  
		  return mybatis.selectOne("like.likeStatus",dto);
	  }
	 
}
