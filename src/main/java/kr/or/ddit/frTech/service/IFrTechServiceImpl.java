package kr.or.ddit.frTech.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.frTech.dao.IFrTechDao;
import kr.or.ddit.vo.TechniqueVO;

@Service("frTechService")
public class IFrTechServiceImpl implements IFrTechService{

	@Autowired
	private IFrTechDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<TechniqueVO> techList(Map<String, String> mem_id) throws Exception {
		return dao.techList(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateTech(TechniqueVO techVO) throws Exception {
		return dao.updateTech(techVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int insertTech(TechniqueVO techVO) throws Exception {
		return dao.insertTech(techVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteTech(Map<String, String> param) throws Exception {
		return dao.deleteTech(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countTech(Map<String, String> param) throws Exception {
		return dao.countTech(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int waitDeleteTech(Map<String, String> param) throws Exception {
		return dao.waitDeleteTech(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int calcenDeleteTech(Map<String, String> param) throws Exception {
		return dao.calcenDeleteTech(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<TechniqueVO> techCheck(Map<String, String> mem_id) throws Exception {
		return dao.techCheck(mem_id);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateRepre(Map<String, String> param) throws Exception {
		return dao.updateRepre(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateTotalRepre(Map<String, String> param) throws Exception {
		return dao.updateTotalRepre(param);
	}

}
