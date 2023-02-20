package fooba.dao;

import java.util.HashMap;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.CartVO;
import fooba.dto.MemberVO;
import fooba.dto.ReviewVO;

@Mapper
public interface IMemberDao {

	void getMember(HashMap<String, Object> paramMap);
	void insertMember(MemberVO mvo);
	void memberFindId(HashMap<String, Object> prm);
	void memberFindPw(HashMap<String, Object> prm);
	void memberQnaList(HashMap<String, Object> prm);
	void memberUpdate(HashMap<String, Object> prm);
	void withdrawalMember(String iD);
	void banner(HashMap<String, Object> prm);
	void getOrderbyOseq(HashMap<String, Object> prm);
	void selectOrderViewByOseq(HashMap<String, Object> prm);
	void getOrderReviewByOseq(HashMap<String, Object> prm);
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
	void getOrderCount(HashMap<String, Object> prm);
	void selectOrdersById(HashMap<String, Object> prm);
	void writeReview(ReviewVO vo);
	void reviewComplete(int oseq);
	
}
