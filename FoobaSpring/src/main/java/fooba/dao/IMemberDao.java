package fooba.dao;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.MemberVO;

@Mapper
public interface IMemberDao {

	void insertMember(@Valid MemberVO mvo);

	
}
