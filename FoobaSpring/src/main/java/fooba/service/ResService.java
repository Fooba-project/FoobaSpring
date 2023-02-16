package fooba.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IResDao;
import fooba.dto.FoodmenuVO;
import fooba.dto.RestaurantVO;

@Service
public class ResService {
	
	@Autowired
	IResDao rdao;

	public void getRes(HashMap<String, Object> paramMap) {
		paramMap.put("ref_cursor",null);
		rdao.getRes(paramMap);
		
	}

	public void starAvg(HashMap<String, Object> paramMap) {
		
		rdao.starAvg(paramMap);
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
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

	public void joinRes(RestaurantVO vo) {
		rdao.joinRes(vo);
		
	}

	public void updateRes(RestaurantVO vo) {
		rdao.updateRes(vo);
		
	}

	public void withdrawal(String RID) {
		rdao.withdrawal(RID);
		
	}

	public void selectReview(HashMap<String, Object> paramMap) {
		rdao.selectReview(paramMap);
		
	}

	
	public void updateReply(HashMap<String, Object> paramMap) {
		rdao.updateReply(paramMap);
		
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
	
}
