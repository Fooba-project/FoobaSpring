/* Drop Tables */
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE order_detail CASCADE CONSTRAINTS;
DROP TABLE foodmenu CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE restaurant CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;

  CREATE TABLE cart
(
	cseq number(5) NOT NULL,
	quantity number(5) NOT NULL,
	indate date DEFAULT sysdate,
	id varchar2(20) NOT NULL,
	fseq number(5) NOT NULL,
	sideyn1 varchar2(50) ,
	sideyn2 varchar2(50) ,
	sideyn3 varchar2(50) ,
	cprice number(10),
	cfname varchar2(50),
	rseq number(5) not null,
	PRIMARY KEY (cseq)
);



CREATE TABLE admin
(
	id varchar2(20) NOT NULL,
	pwd varchar2(20) NOT NULL,
	name varchar2(30) NOT NULL,
	phone varchar2(20) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE foodmenu
(
	rseq number(5) NOT NULL,
	fseq number(5) NOT NULL,
	fname varchar2(100) NOT NULL,
	fprice number(10) DEFAULT 0 NOT NULL,
	fimage varchar2(200),
	fcontent varchar2(500) NOT NULL,
	fside1 varchar2(100),
	fsideprice1 number(10) DEFAULT 0,
	fside2 varchar2(100),
	fsideprice2 number(10) DEFAULT 0,
	fside3 varchar2(100),
	fsideprice3 number(10) DEFAULT 0,
	PRIMARY KEY (fseq)
);



CREATE TABLE member
(
	id varchar2(20) NOT NULL,
	pwd varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	phone varchar2(20) NOT NULL,
	email varchar2(50) NOT NULL,
	zip_num varchar2(10) NOT NULL,
	address1 varchar2(100) NOT NULL,
	address2 varchar2(100) NOT NULL,
	indate date DEFAULT sysdate,
	nick varchar2(100) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE orders
(
	oseq number(5) NOT NULL,
	indate date DEFAULT sysdate,
	id varchar2(20) NOT NULL,
	rideryn number(2) DEFAULT 0 NOT NULL,
	plasticyn number(2) DEFAULT 0 NOT NULL,
	payment number(2) DEFAULT 0 NOT NULL,
	result number(2) DEFAULT 0,
	address1 varchar2(100),
	address2 varchar2(100),
	totalprice number(7),
	phone varchar2(20),
	PRIMARY KEY (oseq)
);



CREATE TABLE order_detail
(
	odseq number(7) NOT NULL,
	quantity number(5) NOT NULL,
	oseq number(5) NOT NULL,
	fseq number(5) NOT NULL,
	sideyn1 number(2) DEFAULT 0,
	sideyn2 number(2) DEFAULT 0,
	sideyn3 number(2) DEFAULT 0,
	PRIMARY KEY (odseq)
);



CREATE TABLE qna
(
	qseq number(5) NOT NULL,
	subject varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	PRIMARY KEY (qseq)
);


CREATE TABLE restaurant
(
	rseq number(5) NOT NULL,
	rid varchar2(20) NOT NULL UNIQUE,
	rpwd varchar2(20) NOT NULL,
	rname varchar2(100) NOT NULL,
	rbiznum varchar2(20) NOT NULL,
	ownername varchar2(20) NOT NULL,
	rphone varchar2(20) NOT NULL,
	raddress varchar2(100) NOT NULL,
	kind varchar2(5) NOT NULL,
	rimage varchar2(50) NOT NULL,
	content varchar2(500) NOT NULL,
	hash varchar2(100),
	rtip number(10) DEFAULT 0 NOT NULL,
	ryn number(2) default 0,
	PRIMARY KEY (rseq)
);


CREATE TABLE review
(
	review_seq number(5) NOT NULL,
	id varchar2(20) NOT NULL,
	rseq number(5) NOT NULL,
	indate date DEFAULT sysdate,
	star number(1) DEFAULT 5 NOT NULL,
	image varchar2(100),
	content varchar2(500) NOT NULL,
	oseq number(5) NOT NULL,
	reply varchar2(1000),
	replyyn number(2) DEFAULT 0 NOT NULL,
	nick varchar2(100) not null,
	reviewyn number(2) DEFAULT 0 not null,
	PRIMARY KEY (review_seq)
);



/* Create Foreign Keys */

ALTER TABLE order_detail
	ADD FOREIGN KEY (fseq)
	REFERENCES foodmenu (fseq)
;

ALTER TABLE orders
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE review
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE order_detail
	ADD FOREIGN KEY (oseq)
	REFERENCES orders (oseq)
;

ALTER TABLE cart
	ADD FOREIGN KEY (fseq)
	REFERENCES foodmenu (fseq)
;




ALTER TABLE cart
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;

alter table cart
	add foreign key (rseq)
	references restaurant (rseq)
;


ALTER TABLE review
	ADD FOREIGN KEY (oseq)
	REFERENCES orders (oseq)
;


ALTER TABLE foodmenu
	ADD FOREIGN KEY (rseq)
	REFERENCES restaurant (rseq)
;


ALTER TABLE review
	ADD FOREIGN KEY (rseq)
	REFERENCES restaurant (rseq)
;



create or replace view order_view
as
select a.oseq, a.result, a.indate, a.id, a.rideryn, a.plasticyn, a.payment, a.address1 as oadd1, a.address2 as oadd2, a.phone as ophone, a.totalprice,
      b.odseq, b.quantity, b.fseq, b.sideyn1, b.sideyn2, b.sideyn3,
      c.nick, c.address1 as madd1, c.address2 as madd2, c.phone as mphone,
      d.fname, d.fprice, d.fside1, d.fside2, d.fside3, d.fsideprice1, d.fsideprice2, d.fsideprice3, d.fimage, d.fcontent,
      e.rname, e.rseq, e.rimage, e.rtip, e.ryn
from orders a, order_detail b, member c, foodmenu d, restaurant e
where a.oseq=b.oseq and a.id = c.id and b.fseq=d.fseq and d.rseq=e.rseq;

   ---------

--추가

 create or replace view search
   as
   select a.rseq, a.rname, a.hash, a.rimage, a.kind, a.ryn,
      b.fname, b.fimage
   from restaurant a, foodmenu b
   where a.rseq=b.rseq;