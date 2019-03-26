package kr.or.ddit.frMyProject.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("fMyProjectDao")
public class ProjectDaoImpl implements ProjectDao {

   @Autowired
   SqlMapClient client;

   @Override
   public ProjectVO myProjectInfo(Map<String, String> params) throws Exception {
      return (ProjectVO) client.queryForObject("project.myProjectInfo", params);
   }

   @Override
   public void updateGit(Map<String, String> params) throws Exception {
      client.update("project.updateGit", params);
   }

   @Override
   public List<ProjectVO> clMyproject(Map<String, String> params)
         throws Exception {
      return client.queryForList("project.clMyproject", params);
   }

   @Override
   public void updateContract() throws Exception {
      client.update("project.updateContract");
   }
   
   @Override
   public int updateEndCheck(Map<String, String> params) throws Exception {
      return client.update("project.updateEndCheck", params);
   }

   @Override
   public int updatePrStatus(Map<String, String> params) throws Exception {
      return client.update("project.updatePrStatus", params);
   }

   @Override
   public int countProjecting(Map<String, String> params) throws Exception {
      return (int) client.queryForObject("project.countProjecting", params);
   }

   @Override
   public int clCountRegisPr(Map<String, String> params) throws Exception {
      return (int) client.queryForObject("project.clCountRegisPr", params);
   }

   @Override
   public int clCountProjecting(Map<String, String> params) throws Exception {
      return (int) client.queryForObject("project.clCountProjecting", params);
   }

   @Override
   public int clCountEndPr(Map<String, String> params) throws Exception {
      return (int) client.queryForObject("project.clCountEndPr", params);
   }

   @Override
   public int clTotalPay(Map<String, String> params) throws Exception {
      return (int) client.queryForObject("project.clTotalPay", params);
   }

	@Override
	public int clCountContract(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.clCountContract", params);
	}

	@Override
	public void adverEndProject(Map<String, String> params) throws Exception {
		client.update("project.adverEndproject", params);
	}
}
