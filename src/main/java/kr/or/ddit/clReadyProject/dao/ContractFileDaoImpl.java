package kr.or.ddit.clReadyProject.dao;

import java.util.Map;

import kr.or.ddit.vo.Constract_fileVO;
import kr.or.ddit.vo.FileItemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("contractFileDao")
public class ContractFileDaoImpl implements ContractFileDao{

	@Autowired
	private SqlMapClient client;

	@Override
	public void insertContractFile(FileItemVO fileInfo) throws Exception {
		client.insert("contractFile.insertContractFile", fileInfo);
	}

	@Override
	public Constract_fileVO fileInfo(Map<String, String> params) throws Exception {
		return (Constract_fileVO) client.queryForObject("contractFile.fileInfo", params);
	}
}
