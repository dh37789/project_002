package kr.or.ddit.frProjectMeeting.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MeetingVO;

public interface MeetingDao {

	List<MeetingVO> boardList(Map<String, String> params) throws Exception;

	MeetingVO boardInfo(Map<String, String> params) throws Exception;

	void insertMeeting(MeetingVO meetingInfo) throws Exception;

	int meetingAccept(Map<String, String> params) throws Exception;

	int meetingReject(Map<String, String> params) throws Exception;

	String acceptChk(Map<String, String> params) throws Exception;

	void deleteMeeting(Map<String, String> params) throws Exception;

	int boardCount(Map<String, String> params) throws Exception;

}
