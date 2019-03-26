package kr.or.ddit.chat.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatVO;

public interface ChatService {
	public String insertChat(Map<String, String> params)throws Exception;

	public List<ChatVO> selectChat(Map<String, String> params) throws Exception;

}
