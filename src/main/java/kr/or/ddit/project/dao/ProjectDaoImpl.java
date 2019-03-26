package kr.or.ddit.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.Portfolio_fileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ProjectDaoImpl implements ProjectDao {
	@Autowired
	private SqlMapClient client;
	@Autowired
	private AttacheFileMapper mapper;
	@Autowired
	private ProjectFileDao itemDao;
	
	@Override
	public List<ProjectVO> projectList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.projectList",params);
	}


	@Override
	public int totalCount() throws Exception {
		return (int) client.queryForObject("project.totalCount");
	}

	@Override
	public int countProject(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.countProject",params);
	}


	@Override
	public ProjectVO projectView(Map<String, String> params) throws Exception {
		return (ProjectVO) client.queryForObject("project.projectView", params);
	}


	@Override
	public List<ProjectVO> readyList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.readyList", params);
	}


	@Override
	public int cntClientProject(String mem_id) throws Exception {
		return (int) client.queryForObject("project.cntClientProject",mem_id);
	}


	@Override
	public int cntApplyProject(String mem_id) throws SQLException {
		return (int) client.queryForObject("project.cntApplyProject",mem_id);
	}


	@Override
	public ProjectVO projectInfo(Map<String, String> params) throws SQLException {
		return (ProjectVO) client.queryForObject("project.myProjectInfo", params);
	}


	@Override
	public void insertProject(ProjectVO project) throws Exception {
		String pr_num=(String) client.insert("project.insertProject", project);
		if (!project.getProjectFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(project.getProjectFile(), pr_num);
			Project_fileVO file = new Project_fileVO();
			file.setPr_num(pr_num);
			file.setPrfile_name(item.getFile_name());
			file.setPrfile_save_name(item.getFile_save_name());
			file.setPrfile_size(item.getFile_size());
			file.setPrfile_type(item.getFile_content_type());;
			itemDao.insertFile(file);
		}
		if(project.getTechnique().size()>0){
			Map<String, String> params = new HashMap<String, String>();
			for(String tech:project.getTechnique()){
				params.put("name", tech);
				params.put("pr_num",pr_num);
				client.insert("project_tech.insertTech", params);
			}
		}
	}


	@Override
	public List<ProjectVO> inspectionProject(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.inspectionProject",params);
	}


	@Override
	public void saveProject(ProjectVO project) throws Exception {
		 String pr_num =(String) client.insert("project.saveProject", project);
		 if (!project.getProjectFile().getOriginalFilename().equals("")) {
				FileItemVO item = mapper.mapping(project.getProjectFile(), pr_num);
				Project_fileVO file = new Project_fileVO();
				file.setPr_num(pr_num);
				file.setPrfile_name(item.getFile_name());
				file.setPrfile_save_name(item.getFile_save_name());
				file.setPrfile_size(item.getFile_size());
				file.setPrfile_type(item.getFile_content_type());;
				itemDao.insertFile(file);
			}
		 if (project.getTechnique() != null) {
			if(project.getTechnique().size()>0){
				Map<String, String> params = new HashMap<String, String>();
				for(String tech:project.getTechnique()){
					params.put("name", tech);
					params.put("pr_num",pr_num);
					client.insert("project_tech.insertTech", params);
				}
			}
		 }
		
	}


	@Override
	public List<Map<String, Object>> temporaryList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.temporaryList",params);
	}


	@Override
	public void deleteProject(String pr_num) throws Exception {
		client.update("project.deleteProject", pr_num);
	}
	@Override
	public void payOk(Map<String, String> params) throws Exception {
		client.update("project.payOk", params);
	}

	@Override
	public void updateProject(ProjectVO project) throws Exception {
		client.update("project.updateProject", project);
		String pr_num=project.getPr_num();
		if (!project.getProjectFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(project.getProjectFile(), pr_num);
			Project_fileVO file = new Project_fileVO();
			file.setPr_num(pr_num);
			file.setPrfile_name(item.getFile_name());
			file.setPrfile_save_name(item.getFile_save_name());
			file.setPrfile_size(item.getFile_size());
			file.setPrfile_type(item.getFile_content_type());;
			itemDao.insertFile(file);
		}if(project.getTechnique()!=null){
			Map<String, String> params = new HashMap<String, String>();
			params.put("pr_num",pr_num);
			client.delete("project_tech.deleteTech", params);
			for(String tech:project.getTechnique()){
				params.put("name", tech);
				client.insert("project_tech.insertTech", params);
			}
		}
		
	}



	@Override
	public List<Map<String, Object>> chatMemberList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.chatMemberList",params);
	}


	@Override
	public List<Map<String, Object>> chatFreeProjectList(
			Map<String, String> params) throws Exception {
		return client.queryForList("project.chatFreeProjectList",params);
	}


	@Override
	public List<Map<String, Object>> chatClientProjectList(
			Map<String, String> params) throws Exception {
		return client.queryForList("project.chatClientProjectList",params);
	}


	@Override
	public List<ProjectVO> mainProList() throws Exception {
		return client.queryForList("project.mainProList");
	}


	@Override
	public List<ProjectVO> stbyProList() throws Exception {
		return client.queryForList("project.stbyProList");
	}


	@Override
	public List<ProjectVO> projectingList() throws Exception {
		return client.queryForList("project.projectinList");
	}


	@Override
	public int endCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.clEndCount", params);
	}


	@Override
	public int proing(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.proing", params);
	}


	@Override
	public int proMoney(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.proMoney", params);
	}


	@Override
	public int frEndCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.frEndCount", params);
	}


	@Override
	public int frProing(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("contract.myProjectCount", params);
	}


	@Override
	public int frProMoney(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.frProMoney", params);
	}
	
	
}
