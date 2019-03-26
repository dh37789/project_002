package kr.or.ddit.controller.websocket.endpoint;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.server.ServerEndpoint;

import kr.or.ddit.filter.PrincipalWithSession;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;

@ServerEndpoint("/wscam")
public class WebSocketServerCamEP {
	
	private static Map<String ,Map<String ,Session>> sessionList = new HashMap<String, Map<String,Session>>();
	private HttpSession httpSession;
	private MeetingVO mtInfo;
	private MemberVO memberInfo;
	@OnOpen
	public void onOpen(Session webSocketSession) throws Exception {
		Map<String ,Session> memList = new HashMap<String, Session>();
		// javax.websocket.Session을 통한 HttpSession 취득
		httpSession = ((PrincipalWithSession) webSocketSession.getUserPrincipal()).getSession();
		// 클라이언트의 WebSocket 생성시 콜백.
		try {
			mtInfo = (MeetingVO) httpSession.getAttribute("MEET_INFO");
			memberInfo = (MemberVO) httpSession.getAttribute("USER_LOGININFO");
			
			String mt_num = mtInfo.getMt_num();
			String mem_id = memberInfo.getMem_id();
			if (sessionList.containsKey(mt_num)) {
				sessionList.get(mt_num).put(mem_id, webSocketSession);
				webSocketSession.getBasicRemote().sendText("WebSocket 서버에 접속되었습니다.!");
			}else{
				memList.put(mem_id, webSocketSession);
				sessionList.put(mt_num,memList);
			}
		} catch (IOException e) {
		}
		System.out.println("WebSock Sever Open : "
				+ webSocketSession.toString());
	}

	@OnMessage(maxMessageSize = 1024*1024*8)
	public void onMessage(byte[] imgBytes) {
		Map<String ,Session> memList = sessionList.get(mtInfo.getMt_num());
		for ( String mem : memList.keySet() ) {
			if (!(mem.equals(memberInfo.getMem_id()))) {
				ByteBuffer buffer = ByteBuffer.wrap(imgBytes);
				try {
					memList.get(mem).getBasicRemote().sendBinary(buffer);
				} catch (IOException e) {
					e.printStackTrace();
				} 
			}
		}
	}

	@OnMessage
	public void onChatMessage(String message){
		Map<String ,Session> memList = sessionList.get(mtInfo.getMt_num());
		for ( String mem : memList.keySet() ) {
			try {
				Basic clientBase = memList.get(mem).getBasicRemote();
				clientBase.sendText(message);
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
	}
	
	
	@OnClose
	public void onClose(Session session) {
		try {
			System.out.println("웹캡 서버 웹 소켓 종료");
			sessionList.get(mtInfo.getMt_num()).remove(memberInfo.getMem_id());
			session.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@OnError
	public void onError(Session session, Throwable t) {
		System.out.println("에러 : " + t.toString());
	}
}
