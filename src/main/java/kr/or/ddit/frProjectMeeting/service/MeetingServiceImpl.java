package kr.or.ddit.frProjectMeeting.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.frProjectMeeting.dao.MeetingDao;
import kr.or.ddit.vo.MeetingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("meetingService")
public class MeetingServiceImpl implements MeetingService{
	
	@Autowired
	private MeetingDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MeetingVO> boardList(Map<String, String> params)
			throws Exception {
		return dao.boardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MeetingVO boardInfo(Map<String, String> params) throws Exception {
		return dao.boardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertMeeting(MeetingVO meetingInfo) throws Exception {
		dao.insertMeeting(meetingInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int meetingAccept(Map<String, String> params) throws Exception {
		return dao.meetingAccept(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int meetingReject(Map<String, String> params) throws Exception {
		return dao.meetingReject(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String acceptChk(Map<String, String> params) throws Exception {
		return dao.acceptChk(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteMeeting(Map<String, String> params) throws Exception {
		dao.deleteMeeting(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int boardCount(Map<String, String> params) throws Exception {
		return dao.boardCount(params);
	}

}
