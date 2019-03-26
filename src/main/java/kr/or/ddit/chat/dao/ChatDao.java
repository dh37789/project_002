package kr.or.ddit.chat.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatVO;

public interface ChatDao {
	public String insertChat(Map<String, String> params)throws Exception;

	public List<ChatVO> selectChat(Map<String, String> params) throws Exception;

}
