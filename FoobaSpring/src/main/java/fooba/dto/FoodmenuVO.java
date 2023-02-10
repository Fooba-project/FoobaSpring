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
	@NotEmpty
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
	@NotEmpty
	private int fsideprice1;
	@NotNull
	@NotEmpty
	private String fside2;
	@NotNull
	@NotEmpty
	private int fsideprice2;
	@NotNull
	@NotEmpty
	private String fside3;
	@NotNull
	@NotEmpty
	private int fsideprice3;
	
	
}
