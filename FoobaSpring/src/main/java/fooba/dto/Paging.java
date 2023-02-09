package fooba.dto;

import lombok.Data;

@Data
public class Paging {
	
		private int page = 1;
		private int totalCount;
		private int displayRow = 10;
		private int displayPage = 10;
		private int beginPage; 
		private int endPage; 
		private boolean prev; 
		private boolean next; 
		private int startNum; 
		private int endNum; 
		
		public void paging() {
			double temp = page / (double)displayPage;
			temp = Math.ceil(temp);
			endPage = (int)(temp*displayPage);
			endPage = ( (int)( Math.ceil( page/(double)displayPage ) )*displayPage );
			beginPage = endPage - (displayPage-1);
			int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
			if (totalPage < endPage ) { 
				endPage = totalPage;
				next = false; 
			} else {next = true;}
			prev = (beginPage==1)? false:true; 
			startNum = (page-1)*displayRow+1;
			endNum = page*displayRow;
		}
	

}
