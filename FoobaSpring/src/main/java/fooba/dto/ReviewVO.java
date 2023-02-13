package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {

   private int REVIEW_SEQ;
   private String ID;
   private int RSEQ;
   private Timestamp INDATE;
   private int STAR;
   private String IMAGE;
   private String CONTENT;
   private int OSEQ;
   private String REPLY;
   private int REPLYYN;
   private String NICK;
   private String FNAMES;
   
   
   
}