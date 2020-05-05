package com.clover.p5.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.clover.p5.entity.Member;
import com.clover.p5.member.dto.NewMemberDTO;

public interface MemberMapper {

	int insertMember(NewMemberDTO newMemberDto);
	
	
	
	int selectMemberId(String userEmail);
	Member selectMember(int userId);
	
	
	
	int updatePassword(@Param("userId") int userId,
						@Param("newPassword") String newPassword);
	
	
	
	String selectMobileAuthentication(int userId);
	int updateMobileAuthentication(int userId);
	
	
}
