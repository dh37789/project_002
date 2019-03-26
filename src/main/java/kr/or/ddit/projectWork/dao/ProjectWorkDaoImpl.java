package kr.or.ddit.projectWork.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.WorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("projectWorkDao")
public class ProjectWorkDaoImpl implements ProjectWorkDao{

	@Autowired
	private SqlMapClient client;
	
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("work.totalCount", params);
	}

	@Override
	public List<WorkVO> boardList(Map<String, String> params) throws Exception {
		return this.client.queryForList("work.boardList", params);
	}

	@Override
	public void insertWork(WorkVO workInfo) throws Exception {
		this.client.insert("work.insertWork", workInfo);
	}

	@Override
	public WorkVO boardInfo(Map<String, String> params) throws Exception {
		return (WorkVO) this.client.queryForObject("work.boardInfo", params);
	}

	@Override
	public void deleteWork(Map<String, String> params) throws Exception {
		client.update("work.deleteWork", params);
	}

	@Override
	public void updateWork(WorkVO workInfo) throws Exception {
		client.update("work.updateWork", workInfo);
	}

	@Override
	public List<WorkVO> orderList(Map<String, String> params) throws Exception {
		return client.queryForList("work.orderList", params);
	}

	@Override
	public WorkVO orderInfo(Map<String, String> params) throws Exception {
		return (WorkVO) client.queryForObject("work.orderInfo", params);
	}

	@Override
	public List<WorkVO> chartList(Map<String, String> params) throws Exception {
		return client.queryForList("work.chartList", params);
	}

}
