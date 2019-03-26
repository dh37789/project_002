package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.utils.AttacheMemberFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.MemberVO;

// <bean name="memberService"
//		class="kr.or.ddit.member.service.IMemberServiceImpl">
@Service("memberService")
public class IMemberServiceImpl implements IMemberService{
	@Autowired
	private IMemberDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception{
		return dao.memberInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateSelfInfo(MemberVO membervo) throws Exception {
		dao.updateSelfInfo(membervo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int insertMember(MemberVO memberInfo) throws Exception {
		return dao.insertMember(memberInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO selectClient(String mem_id) throws Exception {
		return dao.selectClient(mem_id);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countFree(Map<String, String> params) throws Exception {
		return dao.countFree(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MemberVO> freeList(Map<String, String> params) throws Exception {
		return dao.freeList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String selfInfoCheck(Map<String, String> mem_id) throws Exception {
		return dao.selfInfoCheck(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertMemPic(Map<String, String> param) throws Exception {
		dao.insertMemPic(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteMemPic(Map<String, String> param) throws Exception {
		return dao.deleteMemPic(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCountFree() throws Exception {
		return dao.totalCountFree();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<LanguageVO> repreTech(Map<String, String> params) throws Exception {
		return dao.repreTech(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int checkIden(Map<String, String> params) throws Exception {
		return dao.checkIden(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MemberVO> reMember() throws Exception {
		return  dao.reMember();
	}

	@Override
	public void updateLogin(Map<String, String> params) throws Exception {
		dao.updateLogin(params);
	}

	@Override
	public void updateLogout(Map<String, String> params) throws Exception {
		dao.updateLogout(params);
	}

}