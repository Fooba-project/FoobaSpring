package fooba.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.CartVO;
import fooba.dto.MemberVO;
import fooba.dto.OrderVO;

@Mapper
public interface IMemberDao2 {

	void getMember(HashMap<String, Object> prm);

	void SearchResList(HashMap<String, Object> sMap);

	void FimagebyRseq(HashMap<String, Object> prm);

	void searchKind(HashMap<String, Object> prm);

	void resInf(HashMap<String, Object> prm);

	void reviewList(HashMap<String, Object> prm);

	void getFoodDetail(HashMap<String, Object> prm);

	void insertCart(CartVO cvo);

	void deletecart(HashMap<String, Object> prm);

	void cartList(HashMap<String, Object> prm);

	void lookupOseq(HashMap<String, Object> prm);

	void insertOrder_Detail(HashMap<String, Object> prm);

	void insertOrder(HashMap<String, Object> prm);

	void delCart(String cseq);

	void getOrderIngCount(HashMap<String, Object> prm);

	void selectOrdersIngById(HashMap<String, Object> prm);

	void selectOrderViewByOseq(HashMap<String, Object> rvo);



}
