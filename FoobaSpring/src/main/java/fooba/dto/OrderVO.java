package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private int OSEQ;
	private int RSEQ;
	private String ID;
	private int RIDERYN;
	private int PLASTICYN;
	private int PAYMENT;
	private String ADDRESS1;
	private String ADDRESS2;
	private String ADDRESS3;
	private String PHONE;
	private int TOTALPRICE;
	private int RESULT;
	private String ONAME;
	private Timestamp INDATE;
	
	private String NICK;
	private String RIMAGE;
	private String RNAME;

	
}
