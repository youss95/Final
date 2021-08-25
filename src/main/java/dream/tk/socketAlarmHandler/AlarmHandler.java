package dream.tk.socketAlarmHandler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dream.tk.dto.BusinessMemberDTO;
import dream.tk.service.ReservationService;

public class AlarmHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions = new ArrayList<>(); //세션을 담앋둠
	Map<String,WebSocketSession> userSessions = new HashMap<>();
	
	@Autowired
	private ReservationService resService;
	
     //클라이언트가 서버 접속 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("after"+session);
		sessions.add(session);
		String senderId = getId(session);
		System.out.println("senderId: "+senderId);
		userSessions.put(senderId, session); //로그인됨 -> 유저아이디 안됨 -> 웹소켓 세션 아이디
		System.out.println("us"+userSessions);
	}
	//서버에 메시지 보냈을때
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메시지"+message);
		String senderId= getId(session);  //모든 부라우저는 세션 아이디를 가진다.
		System.out.println("senderId"+senderId);
		/*
		 * for(WebSocketSession sess: sessions) { //모든 세션에게 메시지 보내기 sess.sendMessage(new
		 * TextMessage(senderId+" "+message.getPayload())); }
		 */
		
		//protocol: cmd,댓글작성자,게시글작성자  (alarm,sender,getter,no)
		String msg = message.getPayload();
		System.out.println("msg: "+msg);
		if(msg != null) {
		String[] strs = msg.split(",");
		if(strs != null && strs.length == 5) {
			String cmd = strs[0];
			String sender = strs[1];
			String boardId = strs[2];
			String businessName = strs[3];
			String count = strs[4];
			System.out.println(boardId);
			
			WebSocketSession boardWriterSession = userSessions.get(boardId);//게시글 작성자가 있으면
			System.out.println("받는사람"+boardWriterSession);
			if("like".equals(cmd) && boardWriterSession != null) {
				TextMessage tmpMsg = new TextMessage(sender + "님이" + businessName + "을 찜했습니다."+","+count);
				
				System.out.println("tmp"+tmpMsg);
				boardWriterSession.sendMessage(tmpMsg);
				
			}else	if("unlike".equals(cmd) && boardWriterSession != null) {
				TextMessage tmpMsg = new TextMessage(sender + "님이" + businessName + "의 찜을 취소했습니다."+","+count);
				
				System.out.println("tmp"+tmpMsg);
				boardWriterSession.sendMessage(tmpMsg);
				
			}
		
			}
		}
	}
	private String getId(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();  //httpsession을 다 map에 저장
		BusinessMemberDTO loginUser =(BusinessMemberDTO)httpSession.get("binfo");
		if(null == loginUser) {
			return session.getId();  //웹소켓 아이디
		}else {
			return loginUser.getId();  //유저 이름을 찾는다.
		}
		
	}
	//커넥션이 종료 되었을때 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(status);
	}
	
}
