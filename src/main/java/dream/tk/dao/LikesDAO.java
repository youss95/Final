package dream.tk.dao;

import java.util.List;

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
	  public int doLike(LikesDTO dto) { 
		  return mybatis.insert("like.doLike",dto); 
		  }
	  
	  public int updateLike(LikesDTO dto) {
		  return mybatis.update("like.updateStatus",dto);  
	  }
	  
	  public int updateLikeWhenUnliked(LikesDTO dto) {
		  return mybatis.update("like.updateLikeCancel",dto);
	  }

	  //찜하기 상태 가져오기
	  public String likeStatus(LikeStatusDTO dto) {
		  return mybatis.selectOne("like.likeStatus",dto);
	  }
	  
	  public List<LikesDTO> getList(String userId){
		  return mybatis.selectList("like.likeList",userId);
	  }
	 
}
