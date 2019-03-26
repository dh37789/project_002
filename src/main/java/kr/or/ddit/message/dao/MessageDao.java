package kr.or.ddit.message.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MessageVO;

public interface MessageDao {
	/**
	 * 전선영
	 * 해당 회원이 받은 메세지 리스트를 가져오는 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<MessageVO> messageTO(Map<String, String> params) throws Exception;
	/**
	 * 전선영
	 * 해당 회원이 보낸 메세지 리스트를 가져오는 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<MessageVO> messageFROM(Map<String, String> params) throws Exception;
	/**
	 * 전선영
	 * 메세지를 보내는 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public String insertMessage(Map<String, String> params) throws Exception;
	/**
	 * 전선영
	 * 메세지의 조회수를 업데이트 하는 메서드
	 * @param msg_num
	 * @throws Exception
	 */
	public void hitMessage(String msg_num) throws Exception;
	/**
	 * 전선영
	 * 메세지를 삭제하는 상태값을 변경하는 메서드
	 * @param msg_num
	 * @throws Exception
	 */
	public void deleteMessage(String msg_num) throws Exception;
	/**
	 * 전선영
	 * 한 메세지의 세부정보를 보기위한 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public MessageVO messageInfo(Map<String, String> params) throws Exception;
	
	public int totalCountTO(Map<String, String> params)throws Exception;

	public int totalCountFROM(Map<String, String> params)throws Exception;

}
