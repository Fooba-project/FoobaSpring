package fooba.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.CartVO;

@Mapper
public interface IMemberDao2 {

	void getMember(HashMap<String, Object> prm);

	void SearchResList(HashMap<String, Object> sMap);

	void FimagebyRseq(HashMap<String, Object> prm);

	void searchKind(HashMap<String, Object> prm);

	void resInf(HashMap<String, Object> prm);

	void reviewList(HashMap<String, Object> prm);

	void cartList(HashMap<String, Object> prm);

	void getFoodDetail(HashMap<String, Object> prm);

	void insertCart(CartVO cvo);


}
