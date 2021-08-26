package dream.tk.endpoint;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonObject;

import dream.tk.configurator.ApplicationContextProvider;
import dream.tk.configurator.HttpSessionConfigurator;
import dream.tk.dto.ChatAdminDTO;
import dream.tk.dto.ChatDTO;
import dream.tk.service.ChatService;


@ServerEndpoint(value="/chat", configurator = HttpSessionConfigurator.class)
public class ChatEndPoint {

	private ChatService dao = ApplicationContextProvider.getApplicationContext().getBean(ChatService.class);
	private List<Session> list = new ArrayList<Session>();
	private static  Set<Session> clients = Collections.synchronizedSet(new HashSet<>()); // Map<채팅방 이름, 채팅방 마다 등록된 리스트>
	private HttpSession hsession;
	private ChatService service;


	@OnOpen
	public void onConnect(Session session, EndpointConfig config) {
		System.out.println("웹 소켓 클라이언트 연결됨.");
		hsession = (HttpSession)config.getUserProperties().get("hsession");
		clients.add(session);
	}

	@OnMessage
	public void onMessage(Session self, String contents) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("hh : mm aa");
		Date date = new Date();
		date.setTime(System.currentTimeMillis());

		String dateString = simpleDateFormat.format(date);
		synchronized (clients) {
			for (Session client : clients) { // 채팅방끼리 통신 가능함.

				JsonObject json = new JsonObject();
				json.addProperty("store", (String)hsession.getAttribute("storeName"));// 가게이름
				json.addProperty("nickname", (String)hsession.getAttribute("nickname")); // 유저 닉네임
				json.addProperty("bizName", (String) hsession.getAttribute("buisnessNameChat")); //업체명
				json.addProperty("manager", (String)hsession.getAttribute("manager")); //매니저 유무 확인
				json.addProperty("contents", contents); // 메세지
				json.addProperty("writer", (String)hsession.getAttribute("writer"));
				json.addProperty("time", dateString); //현재 시간
				
				
				
				String nickname = (String)hsession.getAttribute("nickname");
				String manager = (String) hsession.getAttribute("manager");
				System.out.println("상대 nickname : " + nickname);
				
				
				String writer = (String)hsession.getAttribute("writer");
				if(nickname == null) {
					nickname = (String)hsession.getAttribute("loginID");
					
				}
				String store = (String)hsession.getAttribute("storeName");

				
				String chatnum = null;
				if(writer.contentEquals("admin")) {
					chatnum = "manager" + store;
					
				}else {
					chatnum = nickname+store;
				}
				
				try {
					
					dao.selectList(nickname);
					dao.selectAll(chatnum);
					dao.selectAllManager(chatnum);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				try {
					client.getBasicRemote().sendText(json.toString());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			JsonObject json = new JsonObject();
			json.addProperty("store", (String)hsession.getAttribute("storeName"));// 가게이름
			json.addProperty("nickname", (String)hsession.getAttribute("nickname")); // 유저 닉네임
			json.addProperty("bizName", (String) hsession.getAttribute("buisnessNameChat")); //업체명
			json.addProperty("manager", (String)hsession.getAttribute("manager")); //매니저 유무 확인
			json.addProperty("contents", contents); // 메세지
			json.addProperty("writer", (String)hsession.getAttribute("writer"));
			String nickname = (String)hsession.getAttribute("nickname");
			String writer = (String)hsession.getAttribute("writer");
			if(nickname == null) {
				nickname = (String)hsession.getAttribute("loginID");
			}
			String store = (String)hsession.getAttribute("storeName");

			String manager = (String) hsession.getAttribute("manager");
			String chatnum = null;
			if(writer.contentEquals("admin")) {
				chatnum = "manager" + store;
				
			}else {
				if(manager == null) {
				chatnum = nickname+store;
				}else {
					chatnum = "manager" + store;
				}
			}
			System.out.println("chatnum : " + chatnum);
			try {
				if(writer.contentEquals("admin")) {
					dao.insertManager(new ChatAdminDTO(chatnum,store,contents,nickname));

				}else if(writer.contentEquals("client")) {
					dao.insert(new ChatDTO(chatnum,store,contents,nickname));
				}else {
					if(manager == null) {
							dao.insertBusiness(new ChatDTO(chatnum,store,contents,nickname));
						
					}else {
							dao.insertBizManager(new ChatAdminDTO(chatnum,store,contents,nickname));
					
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	// 접속했던 session 객체가 연결을 종료하는 순간
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("client disconnected");
	}
}