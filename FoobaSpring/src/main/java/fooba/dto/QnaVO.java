package fooba.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class QnaVO {

	private int QSEQ;
	@NotNull(message="제목을 입력해주세요")
	@NotEmpty(message="제목을 입력해주세요")
	private String SUBJECT;
	@NotNull(message="내용을 입력해주세요")
	@NotEmpty(message="내용을 입력해주세요")
	private String CONTENT;
	
}
