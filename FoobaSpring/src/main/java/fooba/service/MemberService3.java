package fooba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao3;

@Service
public class MemberService3 {

	@Autowired
	IMemberDao3 mdao;

	
	
}
