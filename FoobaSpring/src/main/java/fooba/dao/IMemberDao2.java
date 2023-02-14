package fooba.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	void CartList(HashMap<String, Object> prm);

	void insertOrders(OrderVO ovo);

	void insertOrder(HashMap<String, Object> item , String id);

	void cartList(HashMap<String, Object> prm);



}
