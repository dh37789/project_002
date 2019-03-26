package kr.or.ddit.frProjectMeeting.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MeetingVO;

public interface MeetingService {
	/**
	 * 미팅 리스트
	 * @param params
	 * @return
	 * @throws Exception
	 */
	List<MeetingVO> boardList(Map<String, String> params) throws Exception;
	/**
	 * 미팅 정보
	 * @param params
	 * @return
	 */
	MeetingVO boardInfo(Map<String, String> params) throws Exception;
	/**
	 * 미팅 삽입
	 * @param meetingInfo
	 */
	void insertMeeting(MeetingVO meetingInfo) throws Exception;
	/**
	 * 미팅 수락
	 * @param params
	 * @return 
	 * @throws Exception
	 */
	int meetingAccept(Map<String, String> params) throws Exception;
	/**
	 * 미팅 거절
	 * @param params
	 * @return
	 * @throws Exception
	 */
	int meetingReject(Map<String, String> params) throws Exception;
	/**
	 * 미팅 accept 확인
	 * @param params
	 * @return
	 */
	String acceptChk(Map<String, String> params) throws Exception;
	/**
	 * 미팅 삭제
	 * @param params
	 */
	void deleteMeeting(Map<String, String> params) throws Exception;
	/**
	 * 미팅 게시판 수
	 * @param params
	 * @return
	 */
	int boardCount(Map<String, String> params) throws Exception;

}
