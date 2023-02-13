package fooba.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MemberVO {
	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String ID;
	@NotNull(message="비밀번호를 입력해주세요")
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String PWD;
	@NotNull(message="이름을 입력해주세요")
	@NotEmpty(message="이름을 입력해주세요")
	private String NAME;
	@NotNull(message="전화번호를 입력해주세요")
	@NotEmpty(message="전화번호를 입력해주세요")
	private String PHONE;
	@NotNull(message="이메일을 입력해주세요")
	@NotEmpty(message="이메일을 입력해주세요")
	private String EMAIL;
	private String ZIP_NUM;
	private String ADDRESS1;
	private String ADDRESS2;
	private String ADDRESS3;
	private Timestamp INDATE;
	private String NICK;
	private String REID;
	private String USERPWDCHK;
}
