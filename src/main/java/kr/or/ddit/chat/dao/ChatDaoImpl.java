package kr.or.ddit.chat.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
@Repository
public class ChatDaoImpl implements ChatDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public String insertChat(Map<String, String> params) throws Exception {
		return (String) client.insert("chat.insertChat",params);
	}

	@Override
	public List<ChatVO> selectChat(Map<String, String> params) throws Exception {
		return client.queryForList("chat.selectChat",params);
	}

}
