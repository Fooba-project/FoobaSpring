package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private int oseq;
	private Timestamp indate;
	private String id;
	private int rideryn;
	private int plasticyn;
	private int payment;
	private int result;
	private String Oname;
	private String address1;
	private String address2;
	private int totalprice;
	private String phone;
	private String rname;
	private String rimage;
	private int rseq;
	private String nick;

	
}
