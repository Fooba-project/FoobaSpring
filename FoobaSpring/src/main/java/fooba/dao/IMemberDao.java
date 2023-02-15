package fooba.dao;

import java.util.HashMap;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.MemberVO;

@Mapper
public interface IMemberDao {

	void getMember(HashMap<String, Object> paramMap);
	void insertMember(MemberVO mvo);
	void memberFindId(HashMap<String, Object> prm);
	void memberFindPw(HashMap<String, Object> prm);
	void memberQnaList(HashMap<String, Object> prm);
	void memberUpdate(HashMap<String, Object> prm);
	void withdrawalMember(String iD);
	void banner(HashMap<String, Object> prm);

	
}
