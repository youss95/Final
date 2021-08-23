package dream.tk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import dream.tk.dto.ChatDTO;
import dream.tk.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ChatService service;
	
	@RequestMapping("toChat")
	public String chat(Model model) throws Exception {
		String nickname = (String)session.getAttribute("loginID");
		String storeName = (String) session.getAttribute("storeName");
		String roomid = nickname + storeName;
		session.setAttribute("roomid", roomid);
		
		List<ChatDTO> list = service.selectAll(roomid); 
		List<ChatDTO> list2 = service.selectList(nickname);
		
		System.out.println("ChatController 안에서 출력한 채팅방 리스트"+list);
		System.out.println("ChatController 안에서 출력한 식당 리스트"+list2);
		
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
		System.out.println("business store 값 넘어옴" + store);
		session.setAttribute("storeName", store);
		return "redirect:businessChat";
	}
	
	@RequestMapping("businessChat")
	public String businessChat(Model model) throws Exception{
		System.out.println("업체 아이디");
		//String nickname = (String)session.getAttribute("loginID");
		String storeName = (String) session.getAttribute("storeName");
		//String roomid = nickname + storeName;
		//session.setAttribute("roomid", roomid);
		
		//List<ChatDTO> list = service.selectAll(roomid); 
		List<ChatDTO> list2 = service.selectBusinessList(storeName);
		
		//model.addAttribute("chatlist", list); // 해당 채팅 방
		model.addAttribute("businesschatStore",list2); // 채팅 리스트
		return "chat/chat";
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
