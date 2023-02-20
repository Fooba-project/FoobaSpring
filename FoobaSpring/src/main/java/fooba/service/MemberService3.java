package fooba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao3;
import fooba.dto.ReviewVO;

@Service
public class MemberService3 {

	@Autowired
	IMemberDao3 mdao;

	public void writeReview(ReviewVO vo) {
		mdao.writeReview(vo);
		
	}

	public void reviewComplete(int oseq) {
		mdao.reviewComplete(oseq);
		
	}

	
	
}
