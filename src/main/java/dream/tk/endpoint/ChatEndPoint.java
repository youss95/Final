package dream.tk.endpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
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
import dream.tk.dto.ChatDTO;
import dream.tk.service.ChatService;


@ServerEndpoint(value="/chat", configurator = HttpSessionConfigurator.class)
public class ChatEndPoint {
   
	private ChatService dao = ApplicationContextProvider.getApplicationContext().getBean(ChatService.class);
   
   private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
   private HttpSession hsession;
   
   @OnOpen
   public void onConnect(Session session, EndpointConfig config) {
      System.out.println("웹 소켓 클라이언트 연결됨.");
      hsession = (HttpSession)config.getUserProperties().get("hsession");
      
      System.out.println(hsession.getAttribute("loginID"));
      
      clients.add(session);
   }

   @OnMessage
   public void onMessage(Session self, String contents) {
      synchronized (clients) {
         for (Session client : clients) {
            	
            	
            	JsonObject json = new JsonObject();
            	json.addProperty("store", (String)hsession.getAttribute("storeName"));
            	json.addProperty("nickname", (String)hsession.getAttribute("loginID"));
            	json.addProperty("contents", contents);
            	String nickname = (String)hsession.getAttribute("loginID");
            	String store = (String)hsession.getAttribute("storeName");
            	String chatnum = nickname+store;
            	try {
					 dao.insert(new ChatDTO(chatnum,store,contents,nickname));
					 dao.selectAll(chatnum);
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