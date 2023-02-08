package fooba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao;
import fooba.dao.IResDao2;

@Service
public class ResService2 {

	@Autowired
	IResDao2 rdao;
	
}
