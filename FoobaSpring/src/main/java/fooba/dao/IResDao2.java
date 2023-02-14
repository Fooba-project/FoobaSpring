package fooba.dao;

import java.util.HashMap;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.FoodmenuVO;

@Mapper
public interface IResDao2 {

	void foodList(HashMap<String, Object> paramMap);

	void selectFood(HashMap<String, Object> paramMap);
	
	void updateFoodMenu(FoodmenuVO vo);
	
	void addFoodMenu(FoodmenuVO vo);

	void deleteFoodMenu(HashMap<String, Object> paramMap);

	void restRes(HashMap<String, Object> paramMap);

	void nextOrderStatement(HashMap<String, Object> paramMap);
	

	

	

}
