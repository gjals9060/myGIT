package com.clover.p5.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.clover.p5.member.dto.Member;
import com.clover.p5.member.dto.NewMemberDTO;
import com.clover.p5.member.dto.ProfilePhoto;
import com.clover.p5.member.dto.ProfilePhotoVO;

public interface MemberMapper {
	
	// 회원정보 저장
	int insertMember(NewMemberDTO newMemberDto);
	// 회원정보 검색(이메일로)
	Member selectMemberByEmail(String email);
	// 이메일로 회원ID 검색
	int selectMemberId(String userEmail);
	// 회원정보 검색(ID로)
	Member selectMember(int userId);
	
	
	
	// 비밀번호 변경
	int updatePassword(@Param("userId") int userId,
						@Param("newPassword") String newPassword);
	
	
	
	
	
	// 휴대전화 인증 여부 검색
	String selectMobileAuthentication(int userId);
	// 휴대전화 인증으로 수정
	int updateMobileAuthentication(int userId);
	

	
	
	
	// 프로필 사진 검색
	List<ProfilePhoto> selectProfilePhotoList(int memberId);
	// 프로필 사진 유무만을 검색
	int selectProfilePhotoCount(int memberId);
	// 프로필 사진 등록
	int insertProfilePhoto(ProfilePhotoVO vo);
	// 프로필 사진 삭제
	int deleteProfilePhoto(int photoId);
	// 프로필 사진 해제
	int updateIsProfileN(int memberId);
	// 프로필 사진 적용
	int updateIsProfileY(int photoId);
	
	
	
	
}
