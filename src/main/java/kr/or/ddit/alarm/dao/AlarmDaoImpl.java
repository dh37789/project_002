package kr.or.ddit.alarm.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.Alarm_messageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class AlarmDaoImpl implements AlarmDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public AlarmVO selectAlarm(Map<String, String> params) throws Exception {
		return (AlarmVO) client.queryForObject("alarm.selectAlarm",params);
	}

	@Override
	public void updateAlarm(Map<String, String> params) throws Exception {
		client.update("alarm.updateAlarm", params);
	}

	@Override
	public void insertAlarm(Map<String, String> params) throws Exception {
		client.insert("alarm.insertAlarm", params);
	}

	@Override
	public void insertAlarmMessage(Map<String, String> params) throws Exception {
		client.insert("alarm.insertAlarmMessage", params);
		
	}

	@Override
	public List<Alarm_messageVO> selectAlarmMessage(Map<String, String> params)
			throws Exception {
		return client.queryForList("alarm.selectAlarmMessage",params);
	}

	@Override
	public void hitArmsg(Map<String, String> params) throws Exception {
		client.update("alarm.hitArmsg",params);
	}

	@Override
	public void checkArmsg(String armsg_num) throws Exception {
		client.update("alarm.checkArmsg",armsg_num);
	}

	@Override
	public int countAlarm(String mem_id) throws Exception {
		return (int) client.queryForObject("alarm.countAlarm", mem_id);
	}
	
	

}
