package kr.or.ddit.message.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.message.dao.MessageDao;
import kr.or.ddit.vo.MessageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MessageServiceImple implements MessageService {
	@Autowired
	private MessageDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public String insertMessage(Map<String, String> params) throws Exception {
		return dao.insertMessage(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void hitMessage(String msg_num) throws Exception {
		dao.hitMessage(msg_num);
		
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MessageVO messageInfo(Map<String, String> params) throws Exception {
		return dao.messageInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteMessage(String msg_num) throws Exception {
			dao.deleteMessage(msg_num);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MessageVO> messageTO(Map<String, String> params)
			throws Exception {
		return dao.messageTO(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MessageVO> messageFROM(Map<String, String> params)
			throws Exception {
		return dao.messageFROM(params);
	}
	@Override
	public int totalCountTO(Map<String, String> params) throws Exception {
		return dao.totalCountTO(params);
	}
	@Override
	public int totalCountFROM(Map<String, String> params) throws Exception {
		return dao.totalCountFROM(params);
	}

}
