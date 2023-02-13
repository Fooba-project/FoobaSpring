package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderViewVO {
	private int OSEQ;
	private int RESULT;
	private Timestamp INDATE;
	private String ID;
	private int RIDERYN;
	private int PLASTICYN;
	private int PAYMENT;
	private String OADD1;
	private String OADD2;
	private String OPHONE;
	private int TOTALPRICE;
	
	private int ODSEQ;
	private int QUANTITY;
	private int FSEQ;
	private int SIDEYN1;
	private int SIDEYN2;
	private int SIDEYN3;

	private String NICK;
	private String MADD1;
	private String MADD2;
	private String MPHONE;
	
	private String FNAME;
	private int FPRICE;
	private String FSIDE1;
	private int FSIDEPRICE1;
	private String FSIDE2;
	private int FSIDEPRICE2;
	private String FSIDE3;
	private int FSIDEPRICE3;
	private String FIMAGE;
	private String FCONTENT;
	
	private String RNAME;
	private int RSEQ;
	private String RIMAGE;
	private int RTIP;
	private int RYN;
	
	
}
