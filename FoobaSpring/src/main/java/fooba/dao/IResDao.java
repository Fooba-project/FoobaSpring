package fooba.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.RestaurantVO;

@Mapper
public interface IResDao {

	void getRes(HashMap<String, Object> paramMap);

	void starAvg(HashMap<String, Object> starMap);

	void resFindId(HashMap<String, Object> paramMap);

	void joinRes(RestaurantVO vo);

	void updateRes(RestaurantVO vo);

	void withdrawal(String RID);

	void selectReview(HashMap<String, Object> paramMap);

	void updateReply(HashMap<String, Object> paramMap);
	

}
