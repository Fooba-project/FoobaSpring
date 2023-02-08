package fooba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao2;

@Service
public class MemberService2 {

	@Autowired
	IMemberDao2 mdao;
	
}
