package fooba.service;

import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao;
import fooba.dto.MemberVO;

@Service
public class MemberService {

	@Autowired
	IMemberDao mdao;

	
	public void getMember(HashMap<String, Object> paramMap) {
		mdao.getMember(paramMap);
	}

	public void insertMember(MemberVO mvo) {
		mdao.insertMember(mvo);
		
	}

	public void memberFindId(HashMap<String, Object> prm) {
		mdao.memberFindId(prm);
		
	}

	public void memberFindPw(HashMap<String, Object> prm) {
		mdao.memberFindPw(prm);
		
	}

	public void memberQnaList(HashMap<String, Object> prm) {
		mdao.memberQnaList(prm);
		
	}


	public void memberUpdate(HashMap<String, Object> prm) {
		mdao.memberUpdate(prm);
		
	}

	public void withdrawalMember(String ID) {
		mdao.withdrawalMember(ID);
		
	}

	public void banner(HashMap<String, Object> prm) {
		mdao.banner(prm);
		
	}

	public void getOrderDetail(HashMap<String, Object> prm) {
		mdao.getOrderbyOseq(prm);
		mdao.selectOrderViewByOseq(prm);
		mdao.getOrderReviewByOseq(prm);
	}



		
	}


