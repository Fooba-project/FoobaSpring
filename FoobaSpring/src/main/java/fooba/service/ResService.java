package fooba.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IResDao;

@Service
public class ResService {
	
	@Autowired
	IResDao rdao;

	public void getRes(HashMap<String, Object> paramMap) {
		paramMap.put("ref_cursor",null);
		rdao.getRes(paramMap);
		
	}

	public void starAvg(HashMap<String, Object> paramMap) {
		HashMap<String ,Object>starMap=new HashMap<String,Object>();
		starMap.put("rseq",paramMap.get("rseq"));
		starMap.put("ref_cursor",null);
		rdao.starAvg(starMap);
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) starMap.get("ref_cursor");
		int stars=0;
		int sum=0;
		double star=0;
		for(HashMap<String,Object> rvvo:list) {
			stars=stars+Integer.parseInt(rvvo.get("STAR")+"");
			sum=sum+1;
		}
		if(sum!=0)star=(double)stars/sum;
		int intstar=(int)star;
		double doublestar=(int)(star*10)/(double)10;
		paramMap.put("intstar", intstar);
		paramMap.put("doublestar", doublestar);
		
	}

	public void resFindId(HashMap<String, Object> paramMap) {
		rdao.resFindId(paramMap);
		
	} 
	
}
