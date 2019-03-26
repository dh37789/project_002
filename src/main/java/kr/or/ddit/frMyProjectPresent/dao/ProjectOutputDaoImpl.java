package kr.or.ddit.frMyProjectPresent.dao;

import java.util.Map;

import kr.or.ddit.vo.Project_outputVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("projectOutputDao")
public class ProjectOutputDaoImpl implements ProjectOutputDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public void requestFile(Project_outputVO file) throws Exception {
		client.insert("projectOutput.insertRequestFile", file);
	}

	@Override
	public Project_outputVO fileInfo(Map<String, String> params)
			throws Exception {
		return (Project_outputVO) client.queryForObject("projectOutput.fileInfo", params);
	}

	@Override
	public void deleteFile(Map<String, String> params) throws Exception {
		client.update("projectOutput.deleteFile", params);
	}

	@Override
	public Project_outputVO downloadFile(Map<String, String> params)
			throws Exception {
		return (Project_outputVO) client.queryForObject("projectOutput.downloadFile", params);
	}
	
}
