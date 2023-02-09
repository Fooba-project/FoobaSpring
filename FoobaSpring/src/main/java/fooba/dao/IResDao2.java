package fooba.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IResDao2 {

	void foodList(HashMap<String, Object> paramMap);

	void selectFood(HashMap<String, Object> paramMap);

}
