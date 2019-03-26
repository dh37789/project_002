package kr.or.ddit.message.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MessageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class MessageDaoImpl implements MessageDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public String insertMessage(Map<String, String> params) throws Exception {
		return (String) client.insert("message.insertMessage",params);
	}

	@Override
	public void hitMessage(String msg_num) throws Exception {
		client.update("message.hitMessage",msg_num);
	}

	@Override
	public MessageVO messageInfo(Map<String, String> params) throws Exception {
		return (MessageVO) client.queryForObject("message.messageInfo",params);
	}

	@Override
	public void deleteMessage(String msg_num) throws Exception {
			client.update("message.deleteMessage",msg_num);
	}

	@Override
	public List<MessageVO> messageTO(Map<String, String> params)
			throws Exception {
		return client.queryForList("message.messageTO",params);
	}

	@Override
	public List<MessageVO> messageFROM(Map<String, String> params)
			throws Exception {
		return client.queryForList("message.messageFROM",params);
	}

	@Override
	public int totalCountTO(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("message.totalCountTO",params);
	}

	@Override
	public int totalCountFROM(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("message.totalCountFROM",params);
	}

}
