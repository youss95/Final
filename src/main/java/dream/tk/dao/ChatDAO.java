package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dream.tk.dto.ChatDTO;


@Component
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	  public int insert(ChatDTO dto) { 
		  return mybatis.insert("Chat.insert", dto); 
	}
	  
	  public List<ChatDTO> selectAll(String chatnum){
		  return mybatis.selectList("Chat.selectAll", chatnum);
	  }
	  
	  public List<ChatDTO> selectBusinessAll(String storeName){
		  return mybatis.selectList("Chat.selectBusinessAll", storeName);
	  }
	  
	 public List<ChatDTO> selectList(String nickname){
		 return mybatis.selectList("Chat.selectList", nickname);
	 }
	 
	 public List<ChatDTO> selectBusinessList(String store){
		 return mybatis.selectList("Chat.selectBusinessList", store);
	 }
}
