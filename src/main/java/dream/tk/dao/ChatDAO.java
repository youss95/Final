package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dream.tk.dto.ChatAdminDTO;
import dream.tk.dto.ChatDTO;


@Component
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	  public int insert(ChatDTO dto) { 
		  return mybatis.insert("Chat.insert", dto); 
	}
	  
	  public int insertBusiness(ChatDTO dto) { 
		  return mybatis.insert("Chat.insertBusiness", dto); 
	}
	  
	  public int insertBizManager(ChatAdminDTO dto) { 
		  return mybatis.insert("Chat.insertBizManager", dto); 
	}
	  
	  public int insertManager(ChatAdminDTO dto) { 
		  return mybatis.insert("Chat.insertManager", dto); 
	}
	  
	  public List<ChatDTO> selectAll(String chatnum){
		  return mybatis.selectList("Chat.selectAll", chatnum);
	  }
	  
	  public List<ChatAdminDTO> selectAllManager(String chatnum){
		  return mybatis.selectList("Chat.selectAllManager", chatnum);
	  }
	  
	  public List<ChatDTO> selectBusinessAll(String chatnum){
		  return mybatis.selectList("Chat.selectBusinessAll", chatnum);
	  }
	  
	 public List<ChatDTO> selectList(String nickname){
		 return mybatis.selectList("Chat.selectList", nickname);
	 }
	 
	 public List<ChatDTO> selectBusinessList(String store){
		 return mybatis.selectList("Chat.selectBusinessList", store);
	 }
	 
	 public List<ChatAdminDTO> selectAdminList(String store){
		 return mybatis.selectList("Chat.selectAdminList", store);
	 }
	 
	 public int deleteChatRoom(String chatnum) {
		 return mybatis.delete("Chat.deleteChatRoom", chatnum);
	 }
	 
	 public int deleteAdminChatRoom(String chatnum) {
		 return mybatis.delete("Chat.deleteAdminChatRoom", chatnum);
	 }
}
