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

	public void starAvg(HashMap<String, Object> paramMap) {
		HashMap<String ,Object>starMap=new HashMap<String,Object>();
		starMap.put("rseq",paramMap.get("rseq"));
		starMap.put("stars",0);
		starMap.put("orders",0);
		rdao.starAvg(starMap);
		
	} 
	
}
