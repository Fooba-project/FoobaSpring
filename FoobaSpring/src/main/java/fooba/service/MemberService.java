package fooba.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao;
import fooba.dto.MemberVO;

@Service
public class MemberService {

	@Autowired
	IMemberDao mdao;

	public void insertMember(@Valid MemberVO mvo) {
		mdao.insertMember(mvo);
		
	}

	
	
}
