package fooba.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class FoodmenuVO {

	private int rseq;
	
	private int fseq;
	@NotNull
	@NotEmpty
	private String fname;
	@NotNull
	private int fprice;
	@NotNull
	@NotEmpty
	private String fimage;
	@NotNull
	@NotEmpty
	private String fcontent;
	@NotNull
	@NotEmpty
	private String fside1;
	@NotNull
	private int fsideprice1;
	@NotNull
	@NotEmpty
	private String fside2;
	@NotNull
	private int fsideprice2;
	@NotNull
	@NotEmpty
	private String fside3;
	@NotNull
	private int fsideprice3;
	
	
}
