package kr.or.ddit.chat.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.chat.dao.ChatDao;
import kr.or.ddit.vo.ChatVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public String insertChat(Map<String, String> params) throws Exception {
		return dao.insertChat(params);
	}

	@Override
	public List<ChatVO> selectChat(Map<String, String> params) throws Exception {
		return dao.selectChat(params);
	}
}
