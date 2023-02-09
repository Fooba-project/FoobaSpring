package fooba.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao2;

@Service
public class MemberService2 {

	@Autowired
	IMemberDao2 mdao;

	public void getMember(HashMap<String, Object> prm) {
		mdao.getMember(prm);
		
	}

	public void searchKey(HashMap<String, Object> prm) {
		mdao.searchKey(prm);
		
	}
	
}
