package kr.or.ddit.alarm.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.Alarm_messageVO;

public interface AlarmService {
	public AlarmVO selectAlarm(Map<String, String> params) throws Exception;
	
	public void updateAlarm(Map<String, String> params)throws Exception;
	
	public void insertAlarm(Map<String,String>params)throws Exception;
	
	public void insertAlarmMessage(Map<String, String> params) throws Exception;
	
	public List<Alarm_messageVO> selectAlarmMessage(Map<String, String> params)throws Exception;
	
	public void hitArmsg(Map<String, String> params) throws Exception;
	
	public void checkArmsg(String armsg_num) throws Exception;

	public int countAlarm(String mem_id) throws Exception;
}
