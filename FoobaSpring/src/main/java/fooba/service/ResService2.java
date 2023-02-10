package fooba.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao;
import fooba.dao.IResDao2;

@Service
public class ResService2 {

	@Autowired
	IResDao2 rdao;

	public void foodList(HashMap<String, Object> paramMap) {
		rdao.foodList(paramMap);
		
	}

	public void selectFood(HashMap<String, Object> paramMap) {
		rdao.selectFood(paramMap);
		
	}
	
	public void updateFoodMenu(HashMap<String, Object> paramMap) {
		rdao.updateFoodMenu(paramMap);
		
	}

	public void addFoodMenu(HashMap<String, Object> paramMap) {
		rdao.addFoodMenu(paramMap);
		
	}

	public void deleteFoodMenu(HashMap<String, Object> paramMap) {
		rdao.deleteFoodMenu(paramMap);
		
	}

	
	
}
