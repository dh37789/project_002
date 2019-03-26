package kr.or.ddit.clReadyProject.service;

import java.util.Map;

import kr.or.ddit.clReadyProject.dao.ContractFileDao;
import kr.or.ddit.vo.Constract_fileVO;
import kr.or.ddit.vo.FileItemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("contractFileService")
public class ContractFileServiceImpl implements ContractFileService{

	@Autowired
	private ContractFileDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertContractFile(FileItemVO fileInfo) throws Exception {
		dao.insertContractFile(fileInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Constract_fileVO fileInfo(Map<String, String> params)
			throws Exception {
		return dao.fileInfo(params);
	}
}
