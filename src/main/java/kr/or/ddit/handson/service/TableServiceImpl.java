package kr.or.ddit.handson.service;

import java.util.Map;

import kr.or.ddit.handson.dao.TableDao;
import kr.or.ddit.vo.Table_dataVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

@Service("tableService")
public class TableServiceImpl implements TableService{

	@Autowired
	private TableDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Table_dataVO requestInfo(Map<String, String> params)
			throws Exception {
		return dao.requestInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertTable(Table_dataVO tableInfo) throws Exception {
		dao.insertTable(tableInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateTable(Table_dataVO tableInfo) throws Exception {
		dao.updateTable(tableInfo);
	}
}
