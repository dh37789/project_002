package kr.or.ddit.frMyProject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.frMyProject.dao.CategoryDao;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.Free_TypeVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CategoryVO categoryStatus(Map<String, String> params)
			throws Exception {
		return dao.categoryStatus(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CategoryVO selectCategory(Map<String, String> params)
			throws Exception {
		return dao.selectCategory(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Free_TypeVO> category() throws Exception {
		return dao.category();
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String,String>> detail(String ftype_num) throws Exception {
		return dao.detail(ftype_num);
	}
	

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CategoryVO cateInfo(Map<String, String> params) throws Exception {
		return dao.cateInfo(params);
	}

}
