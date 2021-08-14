package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.ChatDAO;
import dream.tk.dto.ChatDTO;


@Service
public class ChatService {

	@Autowired
	private ChatDAO dao;

	
	/* public int insert(ChatDTO dto) throws Exception{ return dao.insert(dto); } */
	 
	
	  public int insert(ChatDTO dto) throws Exception{ 
		  return dao.insert(dto); 
	}
	  
	  public List<ChatDTO> selectAll() throws Exception{
		  return dao.selectAll();
	  }
	  
	  
	 
}
