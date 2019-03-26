package kr.or.ddit.scheduler.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SchduleVO;
import kr.or.ddit.vo.WorkVO;

import com.dhtmlx.planner.DHXEv;

public interface SchedulerDao {

	/**
	 * 박시찬
	 * 프로젝트 일정 데이터를 가져오는 메서드
	 */
	public List<ProjectVO> getEvent(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 일감 일정 데이터를 가져오는 메서드
	 */
	public List<WorkVO> workSchedule(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 미팅 일정 데이터를 가져오는 메서드
	 */
	public List<MeetingVO> meetSchedule(Map<String, String> param) throws Exception;

	/**
	 * 박시찬
	 * 일정을 업데이트하는 메서드
	 */
	public void updateEvent(SchduleVO schedule) throws Exception;

	/**
	 * 박시찬
	 * 일정을 추가하는 메서드
	 */
	public void insertEvent(SchduleVO schedule) throws Exception;

	/**
	 * 박시찬
	 * 일정을 삭제하는 메서드
	 */
	public void deleteEvent(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 클라이언트 진행중인 프로젝트 일정을 가져오는 메서드
	 */
	public List<ProjectVO> clGetEvent(Map<String, String> params) throws Exception;
}






