package kr.or.ddit.frMyProject.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.frMyProject.dao.ProjectDao;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("fMyProjectService")
public class ProjectServiceImpl implements ProjectService {

   @Autowired
   private ProjectDao dao;
   
   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public ProjectVO myProjectInfo(Map<String, String> params) throws Exception{
      return dao.myProjectInfo(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   @Override
   public void updateGit(Map<String, String> params) throws Exception {
      dao.updateGit(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public List<ProjectVO> clMyproject(Map<String, String> params)
         throws Exception {
      return dao.clMyproject(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   @Override
   public void updateContract() throws Exception {
      dao.updateContract();
   }
   
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   @Override
   public int updateEndCheck(Map<String, String> params) throws Exception {
      return dao.updateEndCheck(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   @Override
   public int updatePrStatus(Map<String, String> params) throws Exception {
      return dao.updatePrStatus(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public int countProjecting(Map<String, String> params) throws Exception {
      return dao.countProjecting(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public int clCountRegisPr(Map<String, String> params) throws Exception {
      return dao.clCountRegisPr(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public int clCountProjecting(Map<String, String> params) throws Exception {
      return dao.clCountProjecting(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public int clCountEndPr(Map<String, String> params) throws Exception {
      return dao.clCountEndPr(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public int clTotalPay(Map<String, String> params) throws Exception {
      return dao.clTotalPay(params);
   }

	@Override
	public int clCountContract(Map<String, String> params) throws Exception {
		return dao.clCountContract(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void adverEndProject(Map<String, String> params) throws Exception {
		dao.adverEndProject(params);
	}
	
}