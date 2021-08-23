package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.likeDAO;


@Service
public class likeService {
	
	@Autowired
	private likeDAO dao;
	
	// 찜하기 출력문
	/*
	 * public List<LikeDTO> selectAll(String id) throws Exception{ return
	 * dao.selectAll(id); }
	 */
	
	
	// 찜하기 취소문
	public int delete(String id) throws Exception{
		return dao.Cancel(id);
	}
	
	
	
	  
}
