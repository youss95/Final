package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.likeDAO;
import dream.tk.dto.likeDTO;

@Service
public class likeService {
	
	@Autowired
	private likeDAO dao;
	
	// 찜하기 출력문
	public List<likeDTO> selectAll(String id) throws Exception{
		return dao.selectAll(id);
	}
	
	
	// 찜하기 취소문
	public int delete(String id) throws Exception{
		return dao.Cancel(id);
	}
	
	
	
	  
}
