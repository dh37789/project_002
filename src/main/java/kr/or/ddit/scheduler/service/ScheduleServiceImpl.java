package kr.or.ddit.scheduler.service;


import java.util.List;
import java.util.Map;

import kr.or.ddit.scheduler.dao.SchedulerDao;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SchduleVO;
import kr.or.ddit.vo.WorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dhtmlx.planner.DHXEv;

@Service("schedulerService")
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private SchedulerDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> getEvent(Map<String, String> param) throws Exception {
		return dao.getEvent(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<WorkVO> workSchedule(Map<String, String> param)
			throws Exception {
		return dao.workSchedule(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MeetingVO> meetSchedule(Map<String, String> param)
			throws Exception {
		return dao.meetSchedule(param);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateEvent(SchduleVO schedule) throws Exception {
		dao.updateEvent(schedule);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertEvent(SchduleVO schedule) throws Exception {
		dao.insertEvent(schedule);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteEvent(Map<String, String> param) throws Exception {
		dao.deleteEvent(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> clGetEvent(Map<String, String> params)
			throws Exception {
		return dao.clGetEvent(params);
	}


}