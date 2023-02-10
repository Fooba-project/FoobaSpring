package fooba.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MemberVO {
	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String id;
	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String pwd;
	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String name;
	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String phone;
	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String email;
	private String zip_num;
	private String address1;
	private String address2;
	private String address3;
	private Timestamp indate;
	private String nick;
	private String reid;
	private String userpwdchk;
}
