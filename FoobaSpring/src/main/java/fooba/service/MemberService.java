package fooba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao;

@Service
public class MemberService {

	@Autowired
	IMemberDao mdao;
	
	
}
