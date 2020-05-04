package com.clover.p5.member.mapper;

import com.clover.p5.entity.Member;
import com.clover.p5.member.dto.NewMemberDTO;

public interface MemberMapper {

	int insertMember(NewMemberDTO newMemberDto);
	
	int selectMemberId(String email);
	Member selectMember(int userId);
	
	String selectMobileAuthentication(int userId);
	
	int updateMobileAuthentication(int userId);
	
	
}
