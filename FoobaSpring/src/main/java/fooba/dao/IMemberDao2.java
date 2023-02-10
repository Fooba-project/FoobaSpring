package fooba.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao2 {

	void getMember(HashMap<String, Object> prm);

	void SearchResList(HashMap<String, Object> sMap);

	void FimagebyRseq(HashMap<String, Object> prm);

	void searchKind(HashMap<String, Object> prm);


}
