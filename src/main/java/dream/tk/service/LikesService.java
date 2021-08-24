package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.LikesDAO;
import dream.tk.dto.LikeStatusDTO;
import dream.tk.dto.LikesDTO;

@Service
public class LikesService {

	@Autowired
	private LikesDAO dao;
	
	
	 //찜하기
		
		  public int doLike(LikesDTO dto) { return dao.doLike(dto); }
		 
		  //cancel
		  public int updateLike(LikesDTO dto) {
			  return dao.updateLike(dto);
		  }
		  
		  //like
		  public int updateLikeWhenUnliked(LikesDTO dto) {
			  return dao.updateLikeWhenUnliked(dto);
		  }
		  
		  //likeStatus
		  public String likeStatus(LikeStatusDTO dto) {
			  return dao.likeStatus(dto);
		  }
		  
		  //getList
		  public List<LikesDTO> likeList(String userId){
			  return dao.getList(userId);
		  }
	
}
