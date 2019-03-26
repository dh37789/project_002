package kr.or.ddit.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.alarm.dao.AlarmDao;
import kr.or.ddit.vo.ApmeetingVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ApplyDaoImpl implements ApplyDao {
	@Autowired
	private SqlMapClient client;
	
	@Autowired
	private AlarmDao alarmDao;

	@Override
	public int countApply(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("apply.countApply",params);
	}

	@Override
	public int apply(Map<String, String> params) throws Exception {
		return (int) client.insert("apply.apply", params);
	}

	@Override
	public List<HashMap<String, Object>> conList(Map<String, String> params) throws Exception {
		return client.queryForList("apply.conList", params);
	}


	@Override
	public int checkApply(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("apply.checkApply",params);
	}



	@Override
	public ApplyVO applyInfo(Map<String, String> params) throws SQLException {
		return (ApplyVO) client.queryForObject("apply.applyInfo", params);
	}



	@Override
	public List<HashMap<String, Object>> selectList(Map<String, String> params) throws Exception {
		return client.queryForList("apply.selectList",params);
	}



	@Override
	public List<HashMap<String, Object>> appList(Map<String, String> params)
			throws Exception {
		return client.queryForList("apply.appList", params);
	}



	@Override
	public ApplyVO appInfo(Map<String, String> params) throws Exception {
		return (ApplyVO) client.queryForObject("apply.appInfo", params);
	}



	@Override
	public void insertAppMeeting(ApmeetingVO apMtInfo) throws Exception {
		client.insert("apmeeting.insertAppMeeting", apMtInfo);
	}



	@Override
	public void updateStatus(Map<String, String> params) throws Exception {
		client.update("apply.updateStatus", params);
	}



	@Override
	public ApmeetingVO mtInfo(Map<String, String> params) throws Exception {
		return (ApmeetingVO) client.queryForObject("apmeeting.mtInfo", params);
	}

	@Override
	public void frUpdateStatus(Map<String, String> params) throws Exception {
		client.update("apply.frUpdateStatus", params);
	}

	@Override
	public void updateMtStatus(Map<String, String> params) throws Exception {
		client.update("apmeeting.updateMtStatus", params);
	}

	@Override
	public void sorryApply(Map<String, String> params) throws Exception {
		client.update("apply.sorryApply", params);
	}

	@Override
	public void frCancelStatus(Map<String, String> params) throws Exception {
		client.update("apply.frCancelStatus", params);
		deleteMt(params);
	}

	@Override
	public void deleteMt(Map<String, String> params) throws Exception {
		client.delete("apmeeting.deleteMt", params);
	}

	@Override
	public void okayApply(Map<String, String> params) throws Exception {
		client.update("apply.okayApply",params);
	}
	
}
