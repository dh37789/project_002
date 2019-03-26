package kr.or.ddit.license.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.license.dao.ILicenseDao;
import kr.or.ddit.vo.LicenseVO;

@Service("licenseService")
public class ILicenseServiceImpl implements ILicenseService{

	@Autowired
	private ILicenseDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<LicenseVO> licenseList(Map<String, String> mem_id)
			throws Exception {
		return dao.licenseList(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateLicense(LicenseVO licenseVO) throws Exception {
		return dao.updateLicense(licenseVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int insertLicense(LicenseVO licenseVO) throws Exception {
		return dao.insertLicense(licenseVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteLicense(Map<String, String> param) throws Exception {
		return dao.deleteLicense(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<LicenseVO> licenseCheck(Map<String, String> mem_id)
			throws Exception {
		return dao.licenseCheck(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public LicenseVO licenseInfo(Map<String, String> param) throws Exception {
		return dao.licenseInfo(param);
	}

}
