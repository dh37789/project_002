package kr.or.ddit.alarm.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.alarm.dao.AlarmDao;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.Alarm_messageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired
	private AlarmDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public AlarmVO selectAlarm(Map<String, String> params) throws Exception {
		return dao.selectAlarm(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateAlarm(Map<String, String> params) throws Exception {
		dao.updateAlarm(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertAlarm(Map<String, String> params) throws Exception {
		dao.insertAlarm(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertAlarmMessage(Map<String, String> params) throws Exception {
		dao.insertAlarmMessage(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Alarm_messageVO> selectAlarmMessage(Map<String, String> params)
			throws Exception {
		return dao.selectAlarmMessage(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void hitArmsg(Map<String, String> params) throws Exception {
		dao.hitArmsg(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void checkArmsg(String armsg_num) throws Exception {
		dao.checkArmsg(armsg_num);
	}

	@Override
	public int countAlarm(String mem_id) throws Exception {
		return dao.countAlarm(mem_id);
	}
}
