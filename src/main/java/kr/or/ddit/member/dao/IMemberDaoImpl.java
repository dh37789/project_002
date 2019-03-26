package kr.or.ddit.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.alarm.dao.AlarmDao;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.MemberVO;

// <bean name="memberDao"
//	class="kr.or.ddit.member.dao.IMemberDaoImpl">
@Repository("memberDao")
public class IMemberDaoImpl implements IMemberDao{
	@Autowired
	private SqlMapClient client;
	@Autowired
	private AlarmDao dao;

	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}

	@Override
	public void updateSelfInfo(MemberVO membervo) throws Exception {
		client.update("member.updateSelfInfo", membervo);
	}

	@Override
	public int insertMember(MemberVO memberInfo) throws Exception {
		String result = (String) client.insert("member.insertMember", memberInfo);
		Map<String,String> params = new HashMap<String, String>();
		params.put("mem_id", memberInfo.getMem_id());
		dao.insertAlarm(params);
		if(result==null){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public MemberVO selectClient(String mem_id) throws Exception {
		
		return (MemberVO) client.queryForObject("member.selectClient", mem_id);
	}

	@Override
	public int countFree(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("member.countFree", params);
	}

	@Override
	public List<MemberVO> freeList(Map<String, String> params) throws Exception {
		return client.queryForList("member.freeList", params);
	}

	@Override
	public String selfInfoCheck(Map<String, String> mem_id) throws Exception {
		return (String) client.queryForObject("member.selfInfoCheck", mem_id);
	}

	@Override
	public void insertMemPic(Map<String, String> param) throws Exception {
		client.update("member.insertMemPic", param);
	}

	@Override
	public int deleteMemPic(Map<String, String> param) throws Exception {
		return client.update("member.deleteMemPic", param);
	}

	@Override
	public int totalCountFree() throws Exception {
		return (int) client.queryForObject("member.totalCountFree");
	}

	@Override
	public List<LanguageVO> repreTech(Map<String, String> params) throws Exception {
		return client.queryForList("language.repreTech", params);
	}

	@Override
	public int checkIden(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("member.checkIden", params);
	}

	@Override
	public List<MemberVO> reMember() throws Exception {
		return  client.queryForList("member.reMember");
	}

	@Override
	public void updateLogin(Map<String, String> params) throws Exception {
		client.update("member.updateLogin", params);
	}

	@Override
	public void updateLogout(Map<String, String> params) throws Exception {
		client.update("member.updateLogout", params);
	}



}