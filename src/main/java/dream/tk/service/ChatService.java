package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.ChatDAO;
import dream.tk.dto.ChatAdminDTO;
import dream.tk.dto.ChatDTO;


@Service
public class ChatService {

	@Autowired
	private ChatDAO dao;

	
	/* public int insert(ChatDTO dto) throws Exception{ return dao.insert(dto); } */
	 
	
	  public int insert(ChatDTO dto) throws Exception{ 
		  return dao.insert(dto); 
	}
	  
	  public int insertBusiness(ChatDTO dto) throws Exception{ 
		  return dao.insertBusiness(dto); 
	}
	  
	  public int insertBizManager(ChatAdminDTO dto) throws Exception{ 
		  return dao.insertBizManager(dto); 
	}
	  
	  public int insertManager(ChatAdminDTO dto) throws Exception{ 
		  return dao.insertManager(dto); 
	}
	  
	  public List<ChatDTO> selectAll(String chatnum) throws Exception{
		  return dao.selectAll(chatnum);
	  }
	  
	  public List<ChatAdminDTO> selectAllManager(String chatnum) throws Exception{
		  return dao.selectAllManager(chatnum);
	  }
	  
	  public List<ChatAdminDTO> selectAllCManager(String chatnum) throws Exception{
		  return dao.selectAllCManager(chatnum);
	  }
	  
	  public List<ChatDTO> selectBusinessAll(String chatnum) throws Exception{
		  return dao.selectBusinessAll(chatnum);
	  }
	  
	  public List<ChatDTO> selectList(String nickname) throws Exception{
		  return dao.selectList(nickname);
	  }
	  
	  public List<ChatDTO> selectBusinessList(String store) throws Exception{
		  return dao.selectBusinessList(store);
	  }
	  
	  public int deleteChatRoom(String chatnum) throws Exception{
		  return dao.deleteChatRoom(chatnum);
	  }
}
