package kr.or.ddit.frMyProject.service;

import java.util.Map;

import kr.or.ddit.frMyProject.dao.Free_typeDao;
import kr.or.ddit.vo.Free_TypeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("free_typeService")
public class Free_typeServiceImpl implements Free_typeService {

	@Autowired
	private Free_typeDao fTypeDao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Free_TypeVO typeStatus(Map<String, String> params) throws Exception {
		return fTypeDao.typeStatus(params);
	}
}
