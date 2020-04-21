package com.clover.p5.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.p5.entity.Member;
import com.clover.p5.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	
	
	
	
	
	@Override
	public boolean insertMember(Member member) {
		if(memberMapper.insertMember(member) == 1) {
			return true;
		}
		return false;
	}

	
}
