package fooba.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IResDao2;
import fooba.dto.FoodmenuVO;

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
	
	public void updateFoodMenu(FoodmenuVO vo) {
		rdao.updateFoodMenu(vo);		
	}

	public void addFoodMenu(FoodmenuVO vo) {
		rdao.addFoodMenu(vo);
	}

	public void deleteFoodMenu(HashMap<String, Object> paramMap) {
		rdao.deleteFoodMenu(paramMap);
	}

	public void restRes(HashMap<String, Object> paramMap) {
		rdao.restRes(paramMap);
	}

	public void nextOrderStatement(int OSEQ) {
		rdao.nextOrderStatement(OSEQ);
		
	}

	public void selectOrdersIngByRseq(HashMap<String, Object> paramMap) {
		rdao.selectOrdersIngByRseq(paramMap);
	}

	public void selectOrdersAllByRseq(HashMap<String, Object> paramMap) {
		rdao.selectOrdersAllByRseq(paramMap);
		
	}	
	
}
