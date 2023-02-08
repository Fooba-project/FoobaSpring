package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {
		private Integer cseq;
		private Integer quantity;
		private String id;
		private Integer fseq;
		private String sideyn1;
		private String sideyn2;
		private String sideyn3;
		private int cprice;
		private Timestamp indate;
		private String cfname;
		private int rseq;
		


}
