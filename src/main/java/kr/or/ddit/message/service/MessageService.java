package kr.or.ddit.message.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MessageVO;

public interface MessageService {
	public List<MessageVO> messageTO(Map<String, String> params) throws Exception;

	public List<MessageVO> messageFROM(Map<String, String> params) throws Exception;

	public String insertMessage(Map<String, String> params) throws Exception;

	public void hitMessage(String msg_num) throws Exception;
	
	public void deleteMessage(String msg_num) throws Exception;

	public MessageVO messageInfo(Map<String, String> params) throws Exception;

	public int totalCountTO(Map<String, String> params)throws Exception;

	public int totalCountFROM(Map<String, String> params)throws Exception;

}
