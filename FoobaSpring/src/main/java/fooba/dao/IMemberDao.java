package fooba.dao;

import java.util.HashMap;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.MemberVO;

@Mapper
public interface IMemberDao {

	void getMember(HashMap<String, Object> paramMap);
	void insertMember(@Valid MemberVO mvo);

	
}
