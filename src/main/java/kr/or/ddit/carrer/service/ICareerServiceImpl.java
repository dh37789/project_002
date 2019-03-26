package kr.or.ddit.carrer.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.carrer.dao.ICareerDao;
import kr.or.ddit.vo.CareerVO;

@Service("careerService")
public class ICareerServiceImpl implements ICareerService{

	@Autowired
	private ICareerDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CareerVO> careerList(Map<String, String> mem_id) throws Exception {
		return dao.careerList(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateCareer(CareerVO careerVO) throws Exception {
		return dao.updateCareer(careerVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int insertCareer(CareerVO careerVO) throws Exception {
		return dao.insertCareer(careerVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteCareer(Map<String, String> param) throws Exception {
		return dao.deleteCareer(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CareerVO> careerCheck(Map<String, String> mem_id)
			throws Exception {
		return dao.careerCheck(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CareerVO careerInfo(Map<String, String> param) throws Exception {
		return dao.careerInfo(param);
	}

}
