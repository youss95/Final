package dream.tk.endpoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
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

	// 1. 채팅방을 로직 DAO, DTO, Service / 2. 채팅방마다 세션을 저장할 리스트가 필요. Map<방이름, List<Session>유저 세션> 
	// 가영이가 1번 채팅방에서 메세지를 보냈다. 
	// 가영이가 속한 세션은 방 이름을 찾고. 
	// 그 방이름으로 Map에서 키값으로 세션을 담았던 List를 뽑고 
	// Session으로 메세지를 보냄

	// 2. DB에서 채팅방 리스트를 뽑고, 
	@OnOpen
	public void onConnect(Session session, EndpointConfig config) {
		System.out.println("웹 소켓 클라이언트 연결됨.");
		hsession = (HttpSession)config.getUserProperties().get("hsession");
		String roomid = (String) hsession.getAttribute("roomid");
		System.out.println(hsession.getAttribute("loginID"));
		//System.out.println("bizname : " + hsession.getAttribute("bizName"));
		System.out.println("Openbizname : " + hsession.getAttribute("buisnessNameChat"));
		clients.add(session);
	}

	@OnMessage
	public void onMessage(Session self, String contents) {
		synchronized (clients) {
			for (Session client : clients) { // 채팅방끼리 통신 가능함.

				JsonObject json = new JsonObject();
				json.addProperty("store", (String)hsession.getAttribute("storeName"));// 가게이름
				json.addProperty("nickname", (String)hsession.getAttribute("nickname")); // 유저 닉네임
				json.addProperty("bizName", (String) hsession.getAttribute("buisnessNameChat")); //업체명
				json.addProperty("manager", (String)hsession.getAttribute("manager")); //매니저 유무 확인
				json.addProperty("contents", contents); // 메세지
				String nickname = (String)hsession.getAttribute("nickname");
				if(nickname == null) {
					nickname = (String)hsession.getAttribute("loginID");
				}
				String store = (String)hsession.getAttribute("storeName");

				String bizName =  (String) hsession.getAttribute("buisnessNameChat");
				String manager = (String) hsession.getAttribute("manager");
				String chatnum = null;
				if(manager == null) {
					chatnum = nickname+store;
				}else {
					chatnum = "manager" + store;
				}
				try {
					if(nickname.contentEquals("manager")) {
						dao.insertManager(new ChatAdminDTO(chatnum,store,contents,nickname));
					}else {
						if(manager == null) {
							if(bizName == null) {
								dao.insert(new ChatDTO(chatnum,store,contents,nickname));
								//dao.deleteChatRoom(chatnum);
							}else {
								dao.insertBusiness(new ChatDTO(chatnum,store,contents,nickname));
							}

						}else {
							if(bizName != null) {
								dao.insertBizManager(new ChatAdminDTO(chatnum,store,contents,nickname));
							}
						}
					}
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
		}
	}
	// 접속했던 session 객체가 연결을 종료하는 순간
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("client disconnected");
	}
}