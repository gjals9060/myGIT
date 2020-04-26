package com.clover.p5.member.mapper;

import com.clover.p5.entity.Member;

public interface MemberMapper {

	int insertMember(Member member);
	
	Member selectMember(String email);
	
}
