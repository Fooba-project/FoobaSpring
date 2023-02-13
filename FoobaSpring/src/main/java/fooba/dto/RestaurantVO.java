package fooba.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class RestaurantVO {

	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String RID;
	@NotNull(message="비밀번호를 입력해주세요")
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String RPWD;
	@NotNull(message="가게이름을 입력해주세요")
	@NotEmpty(message="가게이름을 입력해주세요")
	private String RNAME;
	@NotNull(message="사업자이름을 입력해주세요")
	@NotEmpty(message="사업자이름을 입력해주세요")
	private String OWNERNAME;
	@NotNull(message="전화번호를 입력해주세요")
	@NotEmpty(message="전화번호를 입력해주세요")
	private String RPHONE;

	@NotNull(message="우편번호를 입력해주세요")
	@NotEmpty(message="우편번호를 입력해주세요")
	private String ZIP_NUM;
	
	@NotNull(message="사업장 주소를 입력해주세요")
	@NotEmpty(message="사업장 주소를 입력해주세요")
	private String RADDRESS;
	@NotNull(message="상세 주소를 입력해주세요")
	@NotEmpty(message="상세 주소를 입력해주세요")
	private String RADDRESS2;
	private String RADDRESS3;

	@NotNull(message="대표 이미지를를 넣어주세요")
	@NotEmpty(message="대표 이미지를 넣어주요")
	private String RIMAGE;

	@NotNull(message="가게 소개를 입력해주세요")
	@NotEmpty(message="가게 소개를 입력해주세요")
	private String CONTENT;

	@NotNull(message="해시태그를 입력해주세요")
	@NotEmpty(message="해시태그를 입력해주세요")
	private String HASH;
	private int RSEQ;

	@NotNull(message="사업자번호를 입력해주세요")
	@NotEmpty(message="사업자번호를 입력해주세요")
	private String RBIZNUM;
	@NotNull(message="카테고리를 입력해주세요")
	private int KIND;

	@NotNull(message="배달팁을 입력해주세요")
	private int RTIP;
	private int RYN;
	
	private String FIMAGE;
	
}
