package fooba.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {

   private int review_seq;
   private String id;
   private int rseq;
   private Timestamp indate;
   private int star;
   private String image;
   private String content;
   private int oseq;
   private String reply;
   private int replyyn;
   private String nick;
   private String fnames;
   
   
   
}