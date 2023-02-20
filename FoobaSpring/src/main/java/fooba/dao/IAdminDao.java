package fooba.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.QnaVO;

@Mapper
public interface IAdminDao {

	void getAdmin(HashMap<String, Object> prm);
	void adminList(HashMap<String, Object> prm);
	void admin_resOx(HashMap<String, Object> prm);
	void admin_orderLR(HashMap<String, Object> prm);
	void adminGetAllCount(HashMap<String, Object> prm);
	void adminQna(HashMap<String, Object> prm);
	void adminDetail(HashMap<String, Object> prm);
	void admin_bupdown(HashMap<String, Object> prm);
	void admin_bannerWrite(HashMap<String, Object> prm);
	void admin_bannerUpdate(HashMap<String, Object> prm);
	void admin_bannerDelete(HashMap<String, Object> prm);
	
}
