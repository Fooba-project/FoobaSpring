package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {

	   private String id;
	   private String pwd;
	   private String name;
	   private String phone;
	   private String email;
	   private String zip_num;
	   private String address1;
	   private String address2;
	   private Timestamp indate;
	   private String nick;
	   
}
