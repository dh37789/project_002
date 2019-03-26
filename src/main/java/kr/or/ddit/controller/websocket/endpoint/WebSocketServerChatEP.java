package kr.or.ddit.controller.websocket.endpoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;


import kr.or.ddit.chat.service.ChatService;
import kr.or.ddit.filter.PrincipalWithSession;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;

@ServerEndpoint("/wschat")
public class WebSocketServerChatEP {
	@Autowired
	private ProjectService projectService;
	
//	private static MemberVO member;
//	private static ProjectVO project;

	private Map<String, String> params = new HashMap<String, String>();

	private static Map<String, List<Session>> totalList = new HashMap<String, List<Session>>();
	private static Map<String, List<String>> totalList2 = new HashMap<String, List<String>>();

	private static HttpSession httpSession;

	@OnOpen
	public void onOpen(Session webSocketSession) throws Exception {
		// javax.websocket.Session을 통한 HttpSession 취득
		httpSession = ((PrincipalWithSession) webSocketSession.getUserPrincipal()).getSession();

		// 클라이언트의 WebSocket 생성시 콜백.
		try {
			MemberVO member = (MemberVO) httpSession.getAttribute("USER_LOGININFO");
			ProjectVO project = (ProjectVO) httpSession.getAttribute("CHAT_PROJECT");
			String pr_num = project.getPr_num();
			params.put("mem_id", member.getMem_id());

			if (totalList2.containsKey(pr_num)) {
				if(totalList2.get(pr_num).contains(member.getMem_id())){
					webSocketSession.getBasicRemote().sendText("이미 입장한 상태입니다.");
				}else{
					totalList.get(pr_num).add(webSocketSession);
					totalList2.get(pr_num).add(member.getMem_id());
					webSocketSession.getBasicRemote().sendText("채팅방에 입장하셨습니다.");
					onMessage(member.getMem_id() + "님이 입장하셨습니다.");
				}
			} else {
				totalList.put(pr_num, new ArrayList<Session>());
				totalList2.put(pr_num, new ArrayList<String>());
				totalList.get(pr_num).add(webSocketSession);
				totalList2.get(pr_num).add(member.getMem_id());
				
				httpSession.setAttribute("CHATMEMBER", totalList2.get(project.getPr_num()));
				webSocketSession.getBasicRemote().sendText("채팅방에 입장하셨습니다.");
				webSocketSession.getBasicRemote().sendText(member.getMem_id() + "님이 입장하셨습니다.");
			}


		} catch (IOException e) {
			
		}
	}

	@OnClose
	public void onClose(Session session) {
		MemberVO member = (MemberVO) httpSession.getAttribute("USER_LOGININFO");
		ProjectVO project = (ProjectVO) httpSession.getAttribute("CHAT_PROJECT");
		totalList.get(project.getPr_num()).remove(session);
		totalList2.get(project.getPr_num()).remove(member.getMem_id());
		
		// 클라이언트의 웹소켓 리소스 close() 호출에따라 콜백.
	}

	@OnMessage
	public void onMessage(String msg) throws Exception {
		ProjectVO project = (ProjectVO)httpSession.getAttribute("CHAT_PROJECT");
		
		// 클라이언트의 WebSocket.send() 호출에따라 콜백.
		String names="";
		try {
			for(String name : totalList2.get(project.getPr_num())){
				names+="/"+name;
			}
			// 브로드캐스팅(모든 세션 대상 메세지 송신)
			for (Session session : totalList.get(project.getPr_num())) {
					Basic clientBase = session.getBasicRemote();
					// HttpSession ID값을 매개로 생성된 javax.websocket.Session의 ID 속성값 취득 및
					// 유니캐스팅, 멀티캐스팅에 활용
					System.out.println("ID : " + session.getId());
					clientBase.sendText(msg+names);
			}
		} catch (IOException e) {
		}
	}
	

	@OnError
	public void onError(Throwable exception) throws Throwable {
		System.out.println("Chat Error: " + exception.toString());
	}
}
