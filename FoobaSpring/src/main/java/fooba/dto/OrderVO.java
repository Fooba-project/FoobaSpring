package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private int OSEQ;
	private Timestamp INDATE;
	private String ID;
	private int RIDERYN;
	private int PLASTICYN;
	private int PAYMENT;
	private int RESULT;
	private String ONAME;
	private String ADDRESS1;
	private String ADDRESS2;
	private String ADDRESS3;
	private int TOTALPRICE;
	private String PHONE;
	private String RNAME;
	private String RIMAGE;
	private int RSEQ;
	private String NICK;

	
}
