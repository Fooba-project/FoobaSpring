package fooba.dao;

import org.apache.ibatis.annotations.Mapper;

import fooba.dto.ReviewVO;

@Mapper
public interface IMemberDao3 {

	void writeReview(ReviewVO vo);

	void reviewComplete(int oseq);


}
