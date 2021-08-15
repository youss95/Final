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
		
		System.out.println("확인 : " + (String)session.getAttribute("loginID"));
		
		List<ChatDTO> list = service.selectAll();
		model.addAttribute("chatlist", list);
		return "chat/chat";
	}
	
	@RequestMapping("makeChat")
	public String makeChat(String store) throws Exception{
		System.out.println(store);
		return "chat/toChat";
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
