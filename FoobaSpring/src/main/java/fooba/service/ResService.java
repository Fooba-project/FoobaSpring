package fooba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao;
import fooba.dao.IResService;

@Service
public class ResService {
	
	@Autowired
	IResService rdao;
	
}
