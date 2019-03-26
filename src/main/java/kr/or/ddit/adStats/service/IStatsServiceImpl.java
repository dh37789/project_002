package kr.or.ddit.adStats.service;


import java.util.List;
import java.util.Map;

import kr.or.ddit.adStats.dao.IStatsDao;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("IStatsService")
public class IStatsServiceImpl implements IStatsService{
	@Autowired
	private IStatsDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public Map<String, String> totalSales() throws Exception {
		Map<String, String> totalSales = dao.totalSales();
		return totalSales;
	}

	@Override
	public Map<String, String> pureSales() throws Exception {
		Map<String, String> pureSales = dao.pureSales();
		return pureSales;
	}

	@Override
	public Map<String, String> categoryList() throws Exception {
		Map<String, String> categoryList = dao.categoryList();
		return categoryList;
	}

	@Override
	public Map<String, String> pjCondition() throws Exception {
		Map<String, String> pjCondition = dao.pjCondition();
		return pjCondition;
	}

	@Override
	public Map<String, String> pjCategory() throws Exception {
		Map<String, String> pjCategory = dao.pjCategory();
		return pjCategory;
	}

	@Override
	public Map<String, String> pjRegion() throws Exception {
		Map<String, String> pjRegion = dao.pjRegion();
		return pjRegion;
	}

	@Override
	public List<Map<String, String>> projectCnt() throws Exception {
		return dao.projectCnt();
	}

	@Override
	public List<Map<String, String>> projectPayment() throws Exception {
		return dao.projectPayment();
	}

	@Override
	public List<Map<String, String>> freeJoinProject() throws Exception {
		return dao.freeJoinProject();
	}

	@Override
	public List<Map<String, String>> freeSalary() throws Exception {
		return dao.freeSalary();
	}


}
