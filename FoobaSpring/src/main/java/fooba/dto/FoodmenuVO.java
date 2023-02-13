package fooba.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class FoodmenuVO {

	private int RSEQ;
	
	private int FSEQ;
	@NotNull
	@NotEmpty
	private String FNAME;
	@NotNull
	private int FPRICE;
	@NotNull
	@NotEmpty
	private String FIMAGE;
	@NotNull
	@NotEmpty
	private String FCONTENT;
	@NotNull
	@NotEmpty
	private String FSIDE1;
	@NotNull
	private int FSIDEPRICE1;
	@NotNull
	@NotEmpty
	private String FSIDE2;
	@NotNull
	private int FSIDEPRICE2;
	@NotNull
	@NotEmpty
	private String FSIDE3;
	@NotNull
	private int FSIDEPRICE3;
	
	
}
