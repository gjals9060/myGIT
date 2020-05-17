package com.clover.p5.member.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.clover.p5.member.dto.Member;
import com.clover.p5.member.dto.NewMemberDTO;
import com.clover.p5.member.dto.ProfilePhoto;
import com.clover.p5.member.dto.ProfilePhotoVO;

public interface MemberMapper {
	
	// 회원정보 저장
	int insertMember(NewMemberDTO newHost);
	// 회원정보 검색(이메일로)
	Member selectMemberByEmail(String email);
	// 이메일로 회원ID 검색
	int selectMemberId(String email);
	// 회원정보 검색(ID로)
	Member selectMember(int memberId);
	
	// 회원정보 수정 - 이름, 성
	int updateName(@Param("memberId") int memberId,
					@Param("firstName") String firstName,
					@Param("lastName") String lastName);
	// 회원정보 수정 - 생년월일
	int updateBirthDate(@Param("memberId") int memberId,
						@Param("birthDate") Date birthDate);
	// 회원정보 수정 - 휴대전화 번호
	int updateMobilePhone(@Param("memberId") int memberId,
						@Param("mobilePhone") String mobilePhone);
	// 비밀번호 변경
	int updatePassword(@Param("memberId") int memberId,
						@Param("newPassword") String newPassword);
	
	
	
	
	
	// 휴대전화 인증 여부 검색
	String selectMobileAuthentication(int memberId);
	// 휴대전화 인증으로 수정
	int updateMobileAuthentication(int memberId);
	

	
	
	
	// 프로필 사진 검색
	List<ProfilePhoto> selectProfilePhotoList(int memberId);
	// 프로필 사진 유무만을 검색
	int selectProfilePhotoCount(int memberId);
	// 프로필 사진 등록
	int insertProfilePhoto(ProfilePhotoVO vo);
	// 프로필 사진 삭제
	int deleteProfilePhoto(int profilePhotoId);
	// 삭제된 프로필 사진 채우기
	int updateAutoProfile(int memberId);
	// 프로필 사진 해제
	int updateIsProfileN(int memberId);
	// 프로필 사진 적용
	int updateIsProfileY(int profilePhotoId);
	
	
	
}
