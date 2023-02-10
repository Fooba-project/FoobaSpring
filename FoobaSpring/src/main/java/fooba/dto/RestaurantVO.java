package fooba.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class RestaurantVO {

	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String rid;
	@NotNull(message="비밀번호를 입력해주세요")
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String rpwd;
	@NotNull(message="가게이름을 입력해주세요")
	@NotEmpty(message="가게이름을 입력해주세요")
	private String rname;
	@NotNull(message="사업자이름을 입력해주세요")
	@NotEmpty(message="사업자이름을 입력해주세요")
	private String ownername;
	@NotNull(message="전화번호를 입력해주세요")
	@NotEmpty(message="전화번호를 입력해주세요")
	private String rphone;

	@NotNull(message="우편번호를 입력해주세요")
	@NotEmpty(message="우편번호를 입력해주세요")
	private String zip_num;
	
	@NotNull(message="사업장 주소를 입력해주세요")
	@NotEmpty(message="사업장 주소를 입력해주세요")
	private String raddress;
	@NotNull(message="상세 주소를 입력해주세요")
	@NotEmpty(message="상세 주소를 입력해주세요")
	private String raddress2;
	private String raddress3;

	@NotNull(message="대표 이미지를를 넣어주세요")
	@NotEmpty(message="대표 이미지를 넣어주요")
	private String rimage;

	@NotNull(message="가게 소개를 입력해주세요")
	@NotEmpty(message="가게 소개를 입력해주세요")
	private String content;

	@NotNull(message="해시태그를 입력해주세요")
	@NotEmpty(message="해시태그를 입력해주세요")
	private String hash;
	private int rseq;

	@NotNull(message="사업자번호를 입력해주세요")
	@NotEmpty(message="사업자번호를 입력해주세요")
	private String rbiznum;
	@NotNull(message="카테고리를 입력해주세요")
	private int kind;

	@NotNull(message="배달팁을 입력해주세요")
	private int rtip;
	private int ryn;
	
	private String fimage;
	
}
