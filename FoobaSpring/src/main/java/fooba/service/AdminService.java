package fooba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IAdminDao;

@Service
public class AdminService {

	@Autowired
	IAdminDao adao;
	
}
