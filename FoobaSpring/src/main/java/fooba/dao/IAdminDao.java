package fooba.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAdminDao {

	void getAdmin(HashMap<String, Object> prm);

	void adminList(HashMap<String, Object> prm);

	void admin_resOx(HashMap<String, Object> prm);

}
