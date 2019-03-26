package kr.or.ddit.frProjectMeeting.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MeetingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("meetingDao")
public class MeetingDaoImpl implements MeetingDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<MeetingVO> boardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("meeting.boardList", params);
	}

	@Override
	public MeetingVO boardInfo(Map<String, String> params) throws Exception {
		return (MeetingVO) client.queryForObject("meeting.boardInfo", params);
	}

	@Override
	public void insertMeeting(MeetingVO meetingInfo) throws Exception {
		client.insert("meeting.insertMeeting", meetingInfo);
	}

	@Override
	public int meetingAccept(Map<String, String> params) throws Exception {
		return client.update("meeting.meetingAccept", params);
	}

	@Override
	public int meetingReject(Map<String, String> params) throws Exception {
		return client.update("meeting.meetingReject", params);
	}

	@Override
	public String acceptChk(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("meeting.acceptChk", params);
	}

	@Override
	public void deleteMeeting(Map<String, String> params) throws Exception {
		client.update("meeting.deleteMeeting", params);
	}

	@Override
	public int boardCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("meeting.boardCount", params);
	}
}
