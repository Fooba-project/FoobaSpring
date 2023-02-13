package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {
		private Integer CSEQ;
		private Integer QUANTITY;
		private String ID;
		private Integer FSEQ;
		private String SIDEYN1;
		private String SIDEYN2;
		private String SIDEYN3;
		private int CPRICE;
		private Timestamp INDATE;
		private String CFNAME;
		private int RSEQ;
	

}
