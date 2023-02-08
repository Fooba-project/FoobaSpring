package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderViewVO {
	private int oseq;
	private int result;
	private Timestamp indate;
	private String id;
	private int rideryn;
	private int plasticyn;
	private int payment;
	private String oadd1;
	private String oadd2;
	private String ophone;
	private int totalprice;
	
	private int odseq;
	private int quantity;
	private int fseq;
	private int sideyn1;
	private int sideyn2;
	private int sideyn3;

	private String nick;
	private String madd1;
	private String madd2;
	private String mphone;
	
	private String fname;
	private int fprice;
	private String fside1;
	private int fsideprice1;
	private String fside2;
	private int fsideprice2;
	private String fside3;
	private int fsideprice3;
	private String fimage;
	private String fcontent;
	
	private String rname;
	private int rseq;
	private String rimage;
	private int rtip;
	private int ryn;
	
	
}
