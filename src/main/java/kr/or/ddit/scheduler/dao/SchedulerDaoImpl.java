package kr.or.ddit.scheduler.dao;

import java.util.ArrayList;
import java.util.List;






import java.util.Map;

import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SchduleVO;
import kr.or.ddit.vo.WorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;
import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("schedulerDao")
public class SchedulerDaoImpl implements SchedulerDao {

	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<ProjectVO> getEvent(Map<String, String> param) throws Exception {
		return client.queryForList("scheduler.getEvent", param);
	}
	
	@Override
	public List<WorkVO> workSchedule(Map<String, String> param)
			throws Exception {
		return client.queryForList("work.workSchedule", param);
	}

	@Override
	public List<MeetingVO> meetSchedule(Map<String, String> param)
			throws Exception {
		return client.queryForList("meeting.meetSchedule", param);
	}
	
	@Override
	public void updateEvent(SchduleVO schedule) throws Exception{
		client.update("scheduler.updateEvent", schedule);
	}

	@Override
	public void insertEvent(SchduleVO schedule) throws Exception{
		client.insert("scheduler.insertEvent", schedule);
	}

	@Override
	public void deleteEvent(Map<String, String> param) throws Exception {
		client.delete("scheduler.deleteEvent", param);
	}

	@Override
	public List<ProjectVO> clGetEvent(Map<String, String> params)
			throws Exception {
		return client.queryForList("scheduler.clGetEvent", params);
	}

	

}