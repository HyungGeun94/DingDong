package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.LoginVO;
import kr.co.dingdong.domain.Member;
import kr.co.dingdong.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public Member login(LoginVO loginVO) {
		Member member = memberRepository.login(loginVO);
		
		if(member != null) {
//			탈퇴 여부 확인
			if(member.getDel() != 0) {
				return null;
			}
		}
		
		return member;
		
	}

	@Override
	public Member selectOne(String id) {
		
		Member member = memberRepository.selectOne(id);
		
		if(member != null) {
			if(member.getProfile() == null) {
				member.setProfile("default_profile.jpg");
			}
		}
		
		
		return member;
	}

	@Override
	public int insert(Member member) {
		return memberRepository.insert(member);
	}

	@Override
	public int update(Member member) {
		return memberRepository.update(member);
	}

	@Override
	public int quit(Member member) {
		return memberRepository.quit(member);
	}

	@Override
	public int loginDateUpdate(String id) {
		return memberRepository.loginDateUpdate(id);
	}
	

	@Override
	public Member findByEmail(String email) {
		return memberRepository.findByEmail(email);
	}

	@Override
	public int updateProfile(Member member) {
		return memberRepository.updateProfile(member);
	}

	@Override
	public List<CommunityVO> myCommunityBoard(String id) {
		return memberRepository.myCommunityBoard(id);
	}

	@Override
	public Member findByIdx(int idx) {
		return memberRepository.findByIdx(idx);
	}

	@Override
	public List<CommunityVO> otherCommunityBoard(int idx) {
		return memberRepository.otherCommunityBoard(idx);
	}
	
	@Override
	public int report(String reportee) {
		return memberRepository.report(reportee);
	}

	

}
