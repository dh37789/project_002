package kr.or.ddit.license.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.LicenseVO;

@Repository("licenseDao")
public class ILicenseDaoImpl implements ILicenseDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public List<LicenseVO> licenseList(Map<String, String> mem_id)
			throws Exception {
		return client.queryForList("license.licenseList", mem_id);
	}

	@Override
	public int updateLicense(LicenseVO licenseVO) throws Exception {
		return client.update("license.updateLicense", licenseVO);
	}

	@Override
	public int insertLicense(LicenseVO licenseVO) throws Exception {
		int cnt = 0;
		String key = (String) client.insert("license.insertLicense", licenseVO);
		if (key != null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int deleteLicense(Map<String, String> param) throws Exception {
		return client.delete("license.deleteLicense", param);
	}

	@Override
	public List<LicenseVO> licenseCheck(Map<String, String> mem_id)
			throws Exception {
		return client.queryForList("license.licenseCheck", mem_id);
	}

	@Override
	public LicenseVO licenseInfo(Map<String, String> param) throws Exception {
		return (LicenseVO) client.queryForObject("license.licenseInfo", param);
	}

	

}
