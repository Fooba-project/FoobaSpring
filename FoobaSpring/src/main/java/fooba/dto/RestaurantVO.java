package fooba.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class RestaurantVO {

	@NotNull(message="아이디를 써주세요")
	@NotEmpty(message="아이디를 써주세요")
	private String rid;
	@NotNull(message="비밀번호를 써주세요")
	@NotEmpty(message="비밀번호를 써주세요")
	private String rpwd;
	@NotNull(message="이름을 써주세요")
	@NotEmpty(message="이름을 써주세요")
	private String rname;
	private String ownername;
	@NotNull(message="전화번호를 써주세요")
	@NotEmpty(message="전화번호를 써주세요")
	private String rphone;
	private String raddress;
	private String rimage;
	private String content;
	private String hash;
	private int rseq;
	private String rbiznum;
	private int kind;
	private int rtip;
	private int ryn;
	private String fimage;
	
}
