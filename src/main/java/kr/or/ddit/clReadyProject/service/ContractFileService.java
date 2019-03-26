package kr.or.ddit.clReadyProject.service;

import java.util.Map;

import kr.or.ddit.vo.Constract_fileVO;
import kr.or.ddit.vo.FileItemVO;

public interface ContractFileService {

	void insertContractFile(FileItemVO fileInfo) throws Exception;

	Constract_fileVO fileInfo(Map<String, String> params) throws Exception;

}
