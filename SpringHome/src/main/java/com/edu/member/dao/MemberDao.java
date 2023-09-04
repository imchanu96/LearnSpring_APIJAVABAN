package com.edu.member.dao;

import java.util.List;

import com.edu.member.dto.MemberDto;

public interface MemberDao {

//	public List<MemberDto> memberSelectList();
	List<MemberDto> memberSelectList(int start, int end);
	
	public MemberDto memberExist(String email, String password);
	
	public int memberInsertOne(MemberDto memberDto);
	
	public MemberDto memberSelectOne(int no);

	public int memberUpdateOne(MemberDto memberDto);
	
	public int memberDeleteOne(int no);

	public int memberSelectTotalCount();

	
	
	

}