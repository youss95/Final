package dream.tk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.LikesDAO;
import dream.tk.dto.LikesDTO;

@Service
public class LikesService {

	@Autowired
	private LikesDAO dao;
	
	
	 //찜하기
		
		  public int doLike(LikesDTO dto) { return dao.doLike(dto); }
		 
	
}
