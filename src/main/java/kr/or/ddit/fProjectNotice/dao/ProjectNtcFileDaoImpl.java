package kr.or.ddit.fProjectNotice.dao;

import java.util.Map;

import kr.or.ddit.vo.Project_notice_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("projectNtcFileDao")
public class ProjectNtcFileDaoImpl implements ProjectNtcFileDao {

	@Autowired
	private SqlMapClient client;

	@Override
	public void insertNtcFile(Project_notice_fileVO file) throws Exception {
		client.insert("project_notice_file.insertNtcFile",file);
	}

	@Override
	public Project_notice_fileVO boardFileInfo(Map<String, String> params)
			throws Exception {
		return (Project_notice_fileVO) client.queryForObject("project_notice_file.boardFileInfo", params);
	}

	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return client.update("project_notice_file.deleteFile", params);
	}

	@Override
	public Project_notice_fileVO fileInfo(Map<String, String> params)
			throws Exception {
		return (Project_notice_fileVO) client.queryForObject("project_notice_file.fileInfo", params);
	}
}
