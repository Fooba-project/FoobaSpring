package fooba.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IResDao;

@Service
public class ResService {
	
	@Autowired
	IResDao rdao;

	public void getRes(HashMap<String, Object> paramMap) {
		rdao.getRes(paramMap);
		
	} 
	
}
