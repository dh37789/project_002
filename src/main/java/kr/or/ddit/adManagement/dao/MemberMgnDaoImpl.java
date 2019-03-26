package kr.or.ddit.adManagement.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.utils.AttacheMemberFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.Portfolio_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("memberMgnDao")
public class MemberMgnDaoImpl implements MemberMgnDao {
	@Autowired
	private SqlMapClient client;
	@Autowired
	private AttacheMemberFileMapper mapper;
	@Autowired
	private IMemberDao dao;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 클라이언트 리스트 출력	
	 */
	@Override
	public List<MemberVO> clientList(Map<String, String> params) throws Exception {
		return client.queryForList("member.clientList", params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 프리랜서 리스트 출력	
	 */
	@Override
	public List<MemberVO> freelancerList(Map<String, String> params) throws Exception {
		return client.queryForList("member.freelancerList", params);
	}
	
	@Override
	public List<MemberVO> blackList(Map<String, String> params)	throws Exception {
		return client.queryForList("member.blackList",params);
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트(클라이언트) 출력	
	 */
	@Override
	public List<MemberVO> cl_blackList(Map<String, String> params)	throws Exception {
		return client.queryForList("member.cl_blackList", params);
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트(프리랜서) 출력	
	 */
	@Override
	public List<MemberVO> free_blackList(Map<String, String> params) throws Exception {
		return client.queryForList("member.free_blackList", params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원 블랙리스트 추가(클라이언트, 프리랜서 페이지)	
	 */
	@Override
	public void addBlack(Map<String, String> params) throws Exception {
		client.update("member.addBlack", params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원 블랙리스트 제거(블랙리스트 페이지)	
	 */
	@Override
	public void removeBlack(Map<String, String> params) throws Exception {
		client.update("member.removeBlack", params);
		
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 탈퇴 신청자 승인	
	 */
	@Override
	public void deleteMember(Map<String, String> params) throws Exception {
		client.update("member.deleteMember", params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 숫자 카운팅	
	 */
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("member.totalCount", params);
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트) 숫자 카운팅	
	 */
	@Override
	public int clientCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("member.clientCount", params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(프리랜서) 숫자 카운팅	
	 */
	@Override
	public int freelancerCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("member.freelancerCount", params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 상세 정보
	 */
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 정보 수정	
	 */
	@Override
	public void updateMember(MemberVO memberInfo) throws Exception {
		client.update("member.updateMember", memberInfo);
		String mem_id = memberInfo.getMem_id();
		if (memberInfo.getMemberFile() != null) {
			if (!memberInfo.getMemberFile().getOriginalFilename().equals("")) {
				String saveName = mapper.mapping(memberInfo.getMemberFile(), mem_id);
				Map<String, String> param = new HashMap<String, String>();
				param.put("mem_id", mem_id);
				param.put("mem_picture", saveName);
				dao.insertMemPic(param);
			}
		}
	}


}
