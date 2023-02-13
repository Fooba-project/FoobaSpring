package fooba.service;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao;
import fooba.dto.MemberVO;

@Service
public class MemberService {

	@Autowired
	IMemberDao mdao;

	
	public void getMember(HashMap<String, Object> paramMap) {
		mdao.getMember(paramMap);
	}

	public void insertMember(MemberVO mvo) {
		mdao.insertMember(mvo);
		
	}

	public void memberFindId(HashMap<String, Object> prm) {
		mdao.memberFindId(prm);
		
	}

	public void memberFindPw(HashMap<String, Object> prm) {
		mdao.memberFindPw(prm);
		
	}
		
	}


