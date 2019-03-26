package kr.or.ddit.academic.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.academic.dao.IAcademicDao;
import kr.or.ddit.vo.AcademicVO;
import kr.or.ddit.vo.LicenseVO;

@Service("academicService")
public class IAcademicServiceImpl implements IAcademicService{

	@Autowired
	private IAcademicDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<AcademicVO> academicList(Map<String, String> mem_id)
			throws Exception {
		return dao.academicList(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateAcademic(AcademicVO academicVO) throws Exception {
		return dao.updateAcademic(academicVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int insertAcademic(AcademicVO academicVO) throws Exception {
		return dao.insertAcademic(academicVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteAcademic(Map<String, String> param) throws Exception {
		return dao.deleteAcademic(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<AcademicVO> academicCheck(Map<String, String> mem_id)
			throws Exception {
		return dao.academicCheck(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public AcademicVO academicInfo(Map<String, String> param) throws Exception {
		return dao.academicInfo(param);
	}

}
