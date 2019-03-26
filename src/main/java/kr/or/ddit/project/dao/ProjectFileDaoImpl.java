package kr.or.ddit.project.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.Project_fileVO;

@Repository
public class ProjectFileDaoImpl implements ProjectFileDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertFile(Project_fileVO pr_file) throws Exception {
		client.insert("project_file.insertFile", pr_file);

	}

	@Override
	public Project_fileVO fileInfo(Map<String, String> params) throws Exception {
		return (Project_fileVO) client.queryForObject("project_file.fileInfo", params);
	}

}
