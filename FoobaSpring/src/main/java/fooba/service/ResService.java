package fooba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IResDao;

@Service
public class ResService {
	
	@Autowired
	IResDao rdao; 
	
}
