package kr.or.ddit.handson.dao;

import java.util.Map;

import kr.or.ddit.vo.Table_dataVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("tableDao")
public class TableDaoImpl implements TableDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public Table_dataVO requestInfo(Map<String, String> params)
			throws Exception {
		return (Table_dataVO) client.queryForObject("tableData.requestInfo", params);
	}

	@Override
	public void insertTable(Table_dataVO tableInfo) throws Exception {
		client.insert("tableData.insertTable", tableInfo);
	}

	@Override
	public void updateTable(Table_dataVO tableInfo) throws Exception {
		client.update("tableData.updateTable", tableInfo);
	}
	
	
}
