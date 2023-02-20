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
	
	//레스토랑 회원 정보 획득
	public void getRes(HashMap<String, Object> paramMap) {
		paramMap.put("ref_cursor",null);
		rdao.getRes(paramMap);
		
	}
	
	//별점 평균 계산
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
	
	//아이디 찾기, 비밀번호 찾기
	public void resFindId(HashMap<String, Object> paramMap) {
		rdao.resFindId(paramMap);
		
	}
	
	//회원가입
	public void joinRes(RestaurantVO vo) {
		rdao.joinRes(vo);
		
	}
	
	//정보변경
	public void updateRes(RestaurantVO vo) {
		rdao.updateRes(vo);
		
	}
	
	//삭제
	public void withdrawal(String RID) {
		rdao.withdrawal(RID);
		
	}
	
	//리뷰 목록 획득
	public void selectReview(HashMap<String, Object> paramMap) {
		rdao.selectReview(paramMap);
		
	}

	//리뷰 변경
	public void updateReply(HashMap<String, Object> paramMap) {
		rdao.updateReply(paramMap);
		
	} 
	
	//주문단계 변경
	public void nextOrderStatement(int OSEQ) {
		rdao.nextOrderStatement(OSEQ);
		
	}
	
	//주문중인 주문 목록
	public void selectOrdersIngByRseq(HashMap<String, Object> paramMap) {
		rdao.selectOrdersIngByRseq(paramMap);
	}
	
	//전체 주문 목록
	public void selectOrdersAllByRseq(HashMap<String, Object> paramMap) {
		rdao.selectOrdersAllByRseq(paramMap);
		
	}	
	
	//음식 메뉴 리스트
	public void foodList(HashMap<String, Object> paramMap) {
		rdao.foodList(paramMap);
	}

	//메뉴 상세 정보 획득
	public void selectFood(HashMap<String, Object> paramMap) {
		rdao.selectFood(paramMap);
	}
	
	//메뉴 변경
	public void updateFoodMenu(FoodmenuVO vo) {
		rdao.updateFoodMenu(vo);		
	}
	
	//메뉴 추가
	public void addFoodMenu(FoodmenuVO vo) {
		rdao.addFoodMenu(vo);
	}

	//메뉴 삭제
	public void deleteFoodMenu(HashMap<String, Object> paramMap) {
		rdao.deleteFoodMenu(paramMap);
	}
	
	// 레스토랑 상태(영업중, 휴업) 변경
	public void restRes(HashMap<String, Object> paramMap) {
		rdao.restRes(paramMap);
	}
	
}
