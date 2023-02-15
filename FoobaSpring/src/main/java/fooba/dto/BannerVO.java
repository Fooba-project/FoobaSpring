package fooba.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class BannerVO {
	
	private int BSEQ;
	private int ORDER;
	@NotNull
	@NotEmpty
	private String BNAME;
	private String BIMAGE;
	private Timestamp INDATE;
	
}
