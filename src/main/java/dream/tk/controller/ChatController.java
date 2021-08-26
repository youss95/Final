package dream.tk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import dream.tk.dto.ChatAdminDTO;
import dream.tk.dto.ChatDTO;
import dream.tk.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ChatService service;
	
	//클라이언트 채팅 리스트
	@RequestMapping("toChat")
	public String chat(Model model) throws Exception {
		session.setAttribute("writer", "client");
		String nickname = (String)session.getAttribute("loginID");
		String storeName = (String) session.getAttribute("storeName");
		String roomid = nickname + storeName;
		if(storeName.contentEquals("")) {
			roomid = "chatnum";
		}
		session.setAttribute("roomid", roomid);
		System.out.println("nickname 왜안돼.." + nickname);
		System.out.println("storeName 왜안돼.." + storeName);
		System.out.println("roomid 왜안돼.." + roomid);
		
		
		List<ChatDTO> list = service.selectAll(roomid); 
		List<ChatDTO> list2 = service.selectList(nickname);
		
		model.addAttribute("chatlist", list); // 해당 채팅 방
		model.addAttribute("chatStore",list2); // 채팅 리스트
		return "chat/chat";
	}
	
	@RequestMapping("makeChat")
	public String makeChat(String store) throws Exception{
		System.out.println("store 값 넘어옴" + store);
		session.setAttribute("storeName", store);
		return "redirect:toChat";
	}
	
	@RequestMapping("businessMakeChat")
	public String businessMakeChat(String store) throws Exception{
		session.setAttribute("storeName", store);
		return "redirect:businessChat";
	}
	
	@RequestMapping("clickChat")
	public String clickChat(String roomid, String id) throws Exception{
		session.setAttribute("roomid", roomid);
		session.setAttribute("nickname", id);
		
		if(roomid.contains("manager")) {
			session.setAttribute("manager", "manager");
		}else {
			session.setAttribute("manager", null);
		}
		return "redirect:businessChat";
	}
	
	//비즈니스 채팅 리스트
	@RequestMapping("businessChat")
	public String businessChat(Model model) throws Exception{
		session.setAttribute("writer", "store");
		//String nickname = (String)session.getAttribute("loginID");
		String storeName = (String) session.getAttribute("storeName");
		String roomid = (String) session.getAttribute("roomid");
		session.setAttribute("buisnessNameChat", storeName);
		System.out.println("controller에서 store : " + storeName);
		
		if(roomid == null) {
			roomid = "chatnum";
		}
		System.out.println("중복 storeName : " + storeName);
		
		List<ChatDTO> list = service.selectBusinessAll(roomid); 
		List<ChatDTO> list2 = service.selectBusinessList(storeName);
		List<ChatAdminDTO> list3 = service.selectAllManager(roomid);
		
		model.addAttribute("businesschatlist", list); // 해당 채팅 방
		model.addAttribute("businesschatStore",list2); // 채팅 리스트
		model.addAttribute("managerBiz", list3);//매니저랑 채팅 방
		return "chat/businessChat";
	}
	
	//채팅방 삭제
	@RequestMapping("deleteChatRoom")
	public String deleteChatRoom(String chatnum) throws Exception{
		service.deleteChatRoom(chatnum);
		return "redirect:toChat";
	}
	
	@RequestMapping("deleteBusinessChatRoom")
	public String deleteBusinessChatRoom(String chatnum) throws Exception{
		service.deleteChatRoom(chatnum);
		return "redirect:businessChat";
	}
	
	//매니저와 채팅
	@RequestMapping("bizSendManager")
	public String bizSendManager(String roomid) throws Exception{
		session.setAttribute("roomid", roomid);
		session.setAttribute("manager", "manager");
		return "redirect:businessChat";
	}
	
	//관리자 관점 채팅방
	@RequestMapping("adminChat")
	public String adminChat(Model model) throws Exception{
		session.setAttribute("writer", "admin");
		String storeName = (String) session.getAttribute("store");
		session.setAttribute("storeName", storeName);
		String chatnum = "manager"+storeName;
		if(storeName == null) {
			chatnum = "chatnum";
		}
		session.setAttribute("chatnum", chatnum);
		session.setAttribute("nickname", "manager");
		List<ChatAdminDTO> list1 = service.selectAdminList("manager");
		List<ChatAdminDTO> list2 = service.selectAllManager(chatnum);
		//System.out.println("chatnum 넘어옴? " + chatnum);
		model.addAttribute("adminList",list1);
		model.addAttribute("adminChat",list2);
		return "chat/adminChat";
	}
	
	@RequestMapping("makeAdminChat")
	public String makeAdminChat(String store) throws Exception{
		session.setAttribute("store", store);
		
		return "redirect:adminChat";
	}
	
	@ExceptionHandler
	   public String exceptionHandler(Exception e) {
	      e.printStackTrace();
	      return "error";
	   }
}
