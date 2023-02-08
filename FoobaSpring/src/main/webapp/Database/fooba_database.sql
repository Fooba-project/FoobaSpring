--------------------시퀀스 생성---------------------------
drop sequence qna_seq;
create sequence qna_seq start with 1;	

drop sequence orders_seq;
create sequence orders_seq start with 1;

drop sequence order_detail_seq;
create sequence order_detail_seq start with 1;

drop sequence review_seq_seq;
create sequence review_seq_seq start with 1;

drop sequence cart_seq;
create sequence cart_seq start with 1;

drop sequence restaurant_seq;
create sequence restaurant_seq start with 1;

drop sequence foodmenu_seq;
create sequence foodmenu_seq start with 1;

------ 샘플 데이터 입력--------

-- 관리자 입력(2명)

insert into admin values('admin', 'admin', '관리자1', '010-3757-7878');
insert into admin values('scott', 'tiger', '관리자2', '010-6511-8521');

-- 회원입력(5명)

insert into member(id, pwd, name, phone, email, zip_num, address1,address2,nick)
values('bsc1234','1234','김원일','010-1234-2345','bsc1234@naver.com', '133-110', '서울시 성동구 성수동1가', '1번지21호','중식러버');

insert into member(id, pwd, name, phone, email, zip_num, address1,address2,nick)
values('abc1234','1234','최육오','010-9512	-6789','abc1234@naver.com', '135-512', '서울시 강남구 역삼2동', '진달래아파트10동 1001호','맛나면 짖는개');

insert into member(id, pwd, name, phone, email, zip_num, address1,address2,nick)
values('aaa1111','1234','한더블','010-1111-2894','aaa1111@naver.com','130-120', '서울시 송파구 잠실2동', '리센츠 아파트 201동505호','떡럽');

insert into member(id, pwd, name, phone, email, zip_num, address1,address2,nick)
values('bbb2222','1234','최순경','010-7539-8645','bbb2222@naver.com', '130-120', '서울시 송파구 잠실2동', '리센츠 아파트 202동702호','피카츄큐트');

insert into member(id, pwd, name, phone, email, zip_num, address1,address2,nick)
values('ccc2222','1234','한시바','010-1234-2345','ccc222@naver.com', '135-512', '서울시 강남구 역삼2동', '진달래아파트15동 905호','시바견주인');


insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 1, 'bibim', 'bibim', '통큰 비빔밥', '123-12-12345',
'최비빔' ,'070-1111-7878', '용산구 이태원동 225-67, 1층', '25.jpg', 
'한국인의 소울푸드, 한국인의 대표 음식 비빔밥 전문점', '한식맛집', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 1, '갈비듬뿍통큰비빔밥',10500,'4-_05d0cac08d0a808f26cd2ea0530889ef1669213724.jpg',
'갈비비빔밥+비빔장+된장국','고기추가',4000,'비빔장 추가',500,'된장국 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 1, '쭈꾸미듬뿍통큰비빔밥',9500,'1-_1908c02a56f29870c067467aabead93f1669213709.jpg',
'쭈꾸미비빔밥+비빔장+된장국','쭈꾸미추가',3000,'비빔장 추가',500,'된장국 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 1, '삼겹듬뿍통큰비빔밥',10500,'2_b5a76f395cf1caf9b8130342eb02ef671669272796.jpg',
'삼겹비빔밥+비빔장+된장국','고기추가',4000,'비빔장 추가',500,'된장국 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 1, '참치듬뿍통큰비빔밥',9500,'2-_7399ddb2f83bd8814d6bb10442e2aa581669213895.jpg',
'참치비빔밥+비빔장+된장국','참치추가',2000,'비빔장 추가',500,'된장국 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 1, '새싹듬뿍통큰비빔밥',8500,'_f342e92ddaca09692c18b8cb713d99ec1669272801.jpg',
'새싹비빔밥+비빔장+된장국','새싹추가',1000,'비빔장 추가',500,'된장국 추가',1000);

-- 한식(1) -- 고돼지

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 1, 'pigmeat', 'pigmeat', '고돼지',  '124-13-11345',
'박돼지' ,'070-2222-9595', '서울특별시 마포구 서강로20길 32', '26.jpg', 
'높은 퀄리티의 한끼 식사를 편안하고 합리적인 가격에 제공하는 직화구이 전문점 고돼지 입니다.', '소울푸드', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 2, '삼겹/목살1인 도시락',16000,'1_96dd24c2c6e2e2dc37cbe35618af06511660184949.jpg',
'기본구성 : 메인고기+김치찌개+5칸반찬+상추+공깃밥+콜라','고기추가(100g)',3500,'공깃밥 추가',1000,'쌈 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 2, '삼겹/목살2인 도시락',23000,'__6ed3370f4725b668c400a881b1bc577d1660184990.jpg',
'기본구성 : 메인고기+김치찌개+5칸반찬+상추+공깃밥+콜라','고기추가(100g)',3500,'공깃밥 추가',1000,'쌈 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 2, '돼지 짜글이',10000,'_44a366c79e5bac9b9f6ef8ae1e0306721660184736.jpg',
'짜글이+공깃밥+계란후라이+ 김가루','계란 추가',1000,'김 추가',1000,'공깃밥 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 2, '직화(고기200g)+쫄면',11500,'_de251ddd688fd4823b25653d81ea77291660185130.jpg',
'고기(200g)+쫄면+쌈장','고기추가(100g)',3500,'쌈장 추가',500,'쫄면 (100g)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 2, '직화 고기만 (고기 300g)',12000,'_91451cbde97be2651b3ef9b53f356a881660184740.jpg',
'고기(300g)+쌈장','고기추가(100g)',3500, '고기추가(200g)',7000, '쌈장 추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 2, '고돼지 막창 (230g)',17500,'_f342e92ddaca09692c18b8cb713d99ec1669272801.jpg',
'훈제막창','막창추가(100g)',5000,'막창추가(200g)',10000,'쌈장 추가',500);

-- 한식(1) -- 고향생각

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 1, 'hometown', 'hometown', '고향생각',  '223-12-12345',
'최시골' ,'070-9787-8686', '서울특별시 서대문구 신촌로 90 1층', '27.jpg', 
'고향생각을 나게 하는 어머니의 손맛 한식집입니다.', '매워요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 3, '제육볶음',23000,'jeyuk-bokkum_08e929fda8f551aa3f40d0c5603287921667986897.jpg',
'기본구성 : 반찬 4가지 (공기밥 별도)','공깃밥추가',1000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 3, '갈비탕',14000,'galbitang_9dde5da98c01bb4c058bd1779da1e9b31667986854.jpg',
'반찬 4가지 (공기밥 포함)','공깃밥추가',1000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 3, '우렁이된장찌개 (약간 얼큰)',12000,'ulrungi-doenjangjiggae_09c1b17c77617e28dfa4e0c90e9116391667986802.jpg',
'반찬 4가지 (공기밥 포함)','우렁이추가',4000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 3, '소불고기 덮밥',14000,'bulgogi_92e8f76893a650a2ce54d45530686bd11667986814.jpg',
'반찬 3가지 + 공기밥 + 국','공깃밥 추가',1000,'국 추가',1000,'계란 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 3, '제육덮밥',13000,'jeyuk-dopbap_94b54bfc2b8c1a81f2e38cefaf5713381667986910.jpg',
'반찬 3가지 + 공기밥 + 국','공깃밥 추가',1000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 3, '부대찌개',13000,'buddaejiggae_c1ff047b9711ebc8f8aa47ac43b3d5571667986709.jpg',
'반찬 4가지 (공기밥 포함)','햄추가',3000,'공깃밥추가',1000,'치즈 추가',1500);

-- 한식(1) -- 동이네 덮밥촌

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 1, 'dong', 'dong', '동이네 덮밥촌',  '133-22-12645',
'동동이' ,'070-7896-8365', '서울특별시 서대문구 연세로로 90 2층', '28.jpg', 
'정통 한식 덮밥을 저렴하고 푸짐하게 즐기세요 여러분에 새로운 맛과 경험을 보여드리겠습니다.', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 4, '정통비빔밥 (고추장소스따로)',13000,'1_011acb7ec0cb94896338d06125433cb41612771043.jpg',
'다양한 야채 와 밥을 비벼먹는 한국의 대표음식','공깃밥추가',1000,'소스추가',500, '사이다 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 4, '해물덮밥',12000,'3_e0b3d1d08be427f86ff0aedf4a8d86dc1612772769.jpg',
'간장과 굴소스로 만든 해물과 덮밥','공깃밥추가',1000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 4, '제육덮밥',12000,'ulrungi-doenjangjiggae_09c1b17c77617e28dfa4e0c90e9116391667986802.jpg',
'고추장양념 돼지고기와 덮밥','공깃밥추가',1000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 4, '청경채마라새우덮밥',12000,'5_84e3efecdf4c19705515b6d93a8db8d01612773001.jpg',
'간장과 굴소스 마라소스가 들어간 알새우 덮밥','공깃밥추가',1000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 4, '낙지덮밥',12000,'6_c1169d78c2028fe2f94c228122c2620d1612773084.jpg',
'고추장양념 낙지 덮밥','공깃밥 추가',1000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 4, '오징어삼겹살덮밥',12000,'7_f4cd5fa498f39d3602d058b664c455181612773857.jpg',
'고추장양념 오징어 삼겹살 덮밥','공깃밥 추가',1000,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

-- 한식(1) -- 원조마포할머니빈대떡

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 1, 'mapo', 'mapo', '원조 마포 할머니 빈대떡',  '124-16-10347',
'마빈대' ,'070-8506-3578', '서울특별시 마포구 만리재로 23 (1층 5호)', '29.jpg', 
'공덕시장 마포할머니빈대떡', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 5, '종합 A (전50%, 튀김50%)',25000,'chunghopjeon-and-twikim_1382a32377eddb58b415e95a5f364fbb1620029409.jpg',
'전과 튀김을 함께 드시고 싶으신분들께 권합니다', '소스추가',500,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 5, '종합 B (전70%, 튀김30%)',25000,'chunghopjeon-and-twikim_1382a32377eddb58b415e95a5f364fbb1620029409.jpg',
'전과 튀김의 양을 반대로 하셔도 됩니다 예를들어 튀김의 양을 70% 로 주문하셔도 가능하십니다', '소스추가',500,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 5, '매운부추전',14000,'maeun-buchujeon_820c6191c35236e7255896a78757b5de1620029468.jpg',
'(즉석조리) 부추에 매운 청량고추를 넣었습니다.', '소스추가',500,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 5, '굴전',17000,'guljeon_b55eee62b322f7fd2cb23c9e7645c1aa1620029429.jpg',
'주문시 바로조리 (단품전)','소스추가',500,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 5, '해물녹두빈대떡',17000,'haemul-bidaeduh_d99d0176b0cefd3b233849cbbe5eaad91620029444.jpg',
'녹두빈대떡에 해물(오징어, 새우, 홍합 조갯살) 을 넣어 주문시 바로 조리합니다 (즉석 조리)','소스추가',500,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 5, '모듬튀김',14000,'modum-twikim_a95a0b553a8f788604f76ab28d5252c31620029471.jpg',
'오징어, 고추, 고구마, 새우, 김말이, 야채튀김, 만두종류','소스추가',500,'사이다 추가(500ml)',1500,'콜라 추가(500ml)',1500);

-- 한식(1) -- 족발집
insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 1, 'bestfoot', 'bestfoot', '가장 맛있는 족발',  '920-25-12615',
'사돼지' ,'070-8506-3578', '용산구 한남대로 21길 32', '30.jpg', 
'세상에 이런 맛은 없었다 이건 족발인가 신의 음식인가', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 6, '족발',30000,'1_7c54dc6785a30e679c6155cbe408f3a81561687717.jpg',
'앞발 / 뒷발', '앞발',0,'뒷발',5000,'쌈 추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 6, '보쌈',28000,'1_9fd48cf7f8800329eac2e3298fa112ac1561687736.jpg',
'건강한 재료로 사랑을 담아 삶습니다.', '매운 소스추가',1000,'보쌈용 김치 추가',1500,'주먹밥 추가',3000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 6, '직화불족발',32000,'1_801c6d7f52069b0c1b88e7a11049cc881561687763.jpg',
'가맛족의 특제 비법 매운소스로 조리합니다.', '주먹밥 추가',3000,'보쌈용 김치 추가',1500,'쌈 추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 6, '가족의 족보',53000,'1_ef1fcce2b654148b892847c4144db10f1561687814.jpg',
'족발 + 보쌈','소스추가',500,'쌈 추가',1500,'보쌈용 김치 추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 6, '반반족발',40000,'1_52f0569b93ad70bd2081c3416a272cc61561687872.jpg',
'족발 + 불족','소스추가',500,'쌈 추가',1500,'보쌈용 김치 추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 6, '쟁반국수',13000,'1_909d78c0cc81f5e54b04b935bb53832f1561687887.jpg',
'견과류와 특제소스로 새콤달콤 쟁반국수','사이즈 업',2500,'소스추가',500,'콜라 추가(500ml)',1500);


-- 중식(2) -- 마라

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 2, 'mara', 'mara', '마라',  '136-17-12965',
'마리오' ,'070-4598-7598', '서울특별시 용산구 이태원로 243 4층', '7.jpg', 
'사천식 중국 본토의 맛을 그대로 살린 마라샹궈입니다. ', '매워요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 7, '마라샹궈',39000,'mara-menu-02_819c02c79368b2cca1704185631826f01610029252.jpg',
'마라와 다양한 재료를 넣어 중국 본토의 맛을 살렸습니다.', '공기밥',1000,'미니 꿔바로우',10000,'크림새우(4p)',15000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 7, '훠궈',30000,'1_9fd48cf7f8800329eac2e3298fa112ac1561687736.jpg',
'*2인 이상 주문만 가능', '공기밥',1000,'미니 꿔바로우',10000,'크림새우(4p)',15000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 7, '꿔바로우',25000,'mara-menu-03_91b7409f52e44cf88c37b14df82c3c961610029324_a26d0af4829c72ebeea6160bf41155061613708072.jpg',
'국내산 돼지등심으로 쫀득하고 바삭하게 튀겨낸 북경식 탕수육.', '공기밥',1000,'미니 꿔바로우',10000,'크림새우(4p)',15000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 7, '꿍바오지딩',22000,'mara-menu-08_4f2e89eb393477fb175b1763aab741491610029606.jpg',
'북경식 순살 닭가슴살 볶음요리','공기밥',1000,'미니 꿔바로우',10000,'크림새우(4p)',15000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 7, '해삼전가복',56000,'mara-menu-11_e129810b855a37ee3b2c1c88a6147f561610029802.jpg',
'해삼, 전복, 새우, 관자 등','전복추가(1미)',3500,'해삼 추가(50g)',5000,'새우(3p)',3000);

-- 중식(2) -- 면빨

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 2, 'myeon', 'myeon', '면빨',  '113-16-12865',
'조미연' ,'070-7694-3709', '서울특별시 용산구 이태원로 225 2층', '8.jpg', 
'면이 끝내주는 중국요리입니다. ', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 8, '짬뽕',9000,'jampong_0d2f1635e69b2bab017aa642c9c83a7d1649305323.jpg',
'국물과 면을 개별포장으로 제공', '공기밥',1000,'미니 탕수육',10000,'군만두 추가(2p)',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 8, '짜장면',8000,'r658x041.jpg',
'소스와 면을 개별포장으로 제공', '공기밥',1000,'미니 탕수육',10000,'군만두 추가(2p)',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 8, '우동',8000,'udon_ef36dceee75eb481fb6aea262eb4c5141649305321.jpg',
'국물과 면을 개별포장으로 제공', '공기밥',1000,'미니 탕수육',10000,'군만두 추가(2p)',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 8, '탕수육',24000,'tangsuyuk_b8b095d2facadbf9435e69e3029ff7641649305521.jpg',
'주방장이 직접 만든 소스가 제공됩니다','공기밥',1000,'미니 탕수육',10000,'군만두 추가(2p)',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 8, '군만두',7000,'mandu_2663345214883183e45230395839d03d1649305309.jpg',
'매장에서 직접 빚은 군만두','비법소스',1000,'미니 탕수육',10000,'군만두 추가(2p)',3500);

-- 중식(2) -- 삼부자 교동짬뽕

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 2, 'buja', 'buja', '삼부자 교동짬뽕',  '333-61-11545',
'강부자' ,'070-7394-3548', '서울특별시 서대문구 창천동 31-8', '9.jpg', 
'마음과 정성으로 요리하는 삼부자교동짬뽕 입니다. ', '가성비', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 9, '삼부자 짬뽕',8000,'jjampong_fa80bab8dbf569fd19dbe4ff9d3fafdc1588043326.jpg',
'홍합듬뿍 시원 짬뽕', '공기밥',1000,'미니 탕수육',10000,'곱빼기',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 9, '짜장면',7000,'jajangmyeong_355c5fb40daab39f2cb595b0a68900fa1588043293.jpg',
'소스와 면을 개별포장으로 제공', '공기밥',1000,'미니 탕수육',10000,'면추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 9, '새우볶음밥',12000,'shrimp-bokumbap_7cc13dd2c481df35cd6e0a36e65b493b1588043345.jpg',
'새우가 가득 새우볶음밥', '곱빼기',1000,'미니 탕수육',10000,'군만두 추가(2p)',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 9, '탕수육',20000,'tangsuyuk_ec0214680310d0ddebed28ce46b04ec41588043379.jpg',
'주방장이 직접 만든 소스가 제공됩니다','사이즈 업',5000,'멘보샤(3p)',8000,'군만두 추가(2p)',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 9, '멘보샤',25000,'shrimp-membosha_21b18802371c9e940045b7e655c63e1a1588043367.jpg',
'다진 새우를 식빵사이에 끼워 튀겨 소스에 찍어먹는 멘보샤','비법소스',1000,'미니 탕수육',10000,'군만두 추가(2p)',3500);


-- 중식(2) -- 웍셔너리

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 2, 'wokwok', 'wokwok', '웍셔너리',  '163-62-12132',
'아호원' ,'070-8789-3597', '서울특별시 강남구 도산대로53길 12', '10.jpg', 
'미국스타일 중식. ', '소울푸드', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 10, '뱡뱡면',11000,'h320h_f503b57dc3b948fc3e268ffa349a719e1625456264.jpg',
'빨간칠리 + 누들', '공기밥',1000,'미니 오렌지치킨',8000,'곱빼기',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 10, '스파이시 시푸드 차오미엔',12000,'_d35e02936e9c7dca6d45ebb0b93a38721627984463.jpg',
'매콤한 불맛에 다양한 해물을 볶아 불향을 느낄 수 있는 중국식볶음면', '공기밥',1000,'미니 오렌지치킨',8000,'곱빼기',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 10, '몽골리안 비프',25000,'b320b_a750505741f0958371a99b003c96066a1625456081.jpg',
'몽골에서 먹던 그 맛', '곱빼기',1000,'미니 오렌지치킨',8000,'고기 추가',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 10, '오렌지 치킨',16000,'f320f_ddc42d50e41cf7ef7db9dc854bb210411625456217.jpg',
'웍셔너리의 시그니처 메뉴','사이즈 업',5000,'에그 드랍 슾',4800,'공기밥',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 10, '차오미엔',11000,'i320i_e8a31879e479bfb4839fd6fa0613027d1625456284.jpg',
'웍셔너리의 대표메뉴 중국식 볶음면','공기밥',1000,'미니 오렌지치킨',8000,'곱빼기',1000);

-- 중식(2) -- 유박사 차이나
insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 2, 'ubaksa', 'ubaksa', '유박사 차이나',  '115-17-12845',
'박박사' ,'070-5689-9154', '서울특별시 강남구 도산대로52길 10', '11.jpg', 
'여기는 유박사 차이나입니다! ', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 11, '챠오멘',9000,'vegetable-chow-mein_12af2e9d0f3181e5655f295d8962182a1552449910.jpg',
'볶음면, 양배추, 양파, 호박, 숙주나물', '곱빼기',1000,'미니 오렌지치킨',5000,'크림 치즈 만두',4500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 11, '볶음밥',9000,'shrimp-fried-rice-1_cd4dff1b91daffa9bd02ce2d5d8f6f451552450147.jpg',
'계란, 당근, 호박, 양파와 새우를 넣은 볶음밥', '곱빼기',1000,'미니 오렌지치킨',5000,'크림 치즈 만두',4500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 11, '가지튀김',13500,'fried-eggplant_10366e2d906f885f27a59bda85443f571553224514.jpg',
'센불에 빠르게 볶은 가지깐풍기', '곱빼기',1000,'미니 오렌지치킨',5000,'크림 치즈 만두',4500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 11, '오렌지 치킨',16000,'_3f60c4225a60b077739c8b1ef7ef3aed1558688403_2320d3a81d473a7d5fe83326d43d04ba1558712488.jpg',
'닭가슴살 마늘','사이즈 업',4000,'크림 치즈 만두',4500, '미니 춘권',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 11, '크림 치즈 만두',4500,'cream-cheese-wonton-4_18b181b32e11b49edd32db7acbb9a1de1552449951.jpg',
'4개의 만두—크림치즈, 대파','4p추가',4500,'미니 오렌지치킨',8000,'미니 춘권',3500);


-- 중식(2) -- 차이나는 쭝식

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 2, 'china', 'china', '차이나는 쭝식',  '116-13-10945',
'서찬희' ,'070-7691-5863', '서울특별시 서대문구 연세로12길 9,1층', '12.jpg', 
'중식 조리기능사 자격증을 갖춘 셰프의 차이 나는 중화요리. 비교불가! ', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 12, '교동짬뽕',9000,'jampong_abeea57900b311beb8d6a2b5a7cf37b81629262627.jpg',
'매콤한 교동짬뽕', '곱빼기',1000,'미니 탕수육',6000,'크림 새우',6000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 12, '짜장면',9000,'jajangmyeon_407c06ea4784db10e2242ee91cb4df051629262613.jpg',
'불맛이 아는 맛있는 짜장면','곱빼기',1000,'미니 탕수육',6000,'크림 새우',6000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 12, '짜장밥',9500,'jajang-rice_8f5950aa952bdd1d33aca86960e0f76e1629262609.jpg',
'계란후라이가 올라간 짜장밥', '곱빼기',1000,'미니 탕수육',6000,'크림 새우',6000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 12, '탕수육',16000,'tangsuyuk_be7024beacfe9a9a0e190ea5b0c344b51629262636.jpg',
'바삭바삭 탕수육','사이즈업',6000,'짬뽕국물',2000,'크림 새우',6000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 12, '크림새우',4500,'fried-shrimp_d27a46e8ab695a60a9b780c071d9e4a71629262599.jpg',
'레몬소스에 찍어먹는 크림새우','사이즈업',6000,'미니 탕수육',6000,'짬뽕국물',2000);


-- 양식(3) -- 5일장 햄버거

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 3, 'fiveham', 'fiveham', '5일장 햄버거',  '135-71-11245',
'햄스타' ,'070-7698-1065', '서울 서대문구 연세로2마길 17 1층', '43.jpg', 
'고급스러운 재료로 만든 오일장버거 ', '소울푸드', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 13, '빅 오일장햄버거',5500,'-_2e6c3c8505f4baad457d3e8337b8fe221671363790.jpg',
'브리오슈번 + 피클 + 양배추 + 5일장햄버거소스 + 와규함박패티', '패티추가',2000,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 13, '빅 매운버거',5500,'_10bd3f06a48c571381193a56c84fe40f1671363667.jpg',
'브리오슈번 + 피클 + 양배추 + 5일장햄버거소스 + 와규함박패티 + 매운소스','패티추가',2000,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 13, '빅 새우버거',5900,'_adcb32b65649ead095a2b717e4bf1c881671363517.jpg',
'브리오슈번 + 피클 + 양배추 + 5일장햄버거소스 + 통새우패티', '새우패티추가',2000,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 13, '빅 머쉬룸버거',7000,'_2079a41608599d05ae2bb551d7989c6a1671363453.jpg',
'브리오슈번 + 피클 + 양배추 + 5일장햄버거소스 + 와규함박패티 +체다치즈 + 계란후라이 + 구운양파 + 구운버섯','패티추가',2000,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 13, '빅 스페셜버거',6500,'--_df3f549f6d096f9b2f0c8d0ae86d3aa81671363923.jpg',
'브리오슈번 + 피클 + 양배추 + 5일장햄버거소스 + 와규함박패티 +체다치즈 + 계란후라이','패티추가',2000,'감자튀김',2000,'펩시(500ml)',2000);
		
-- 양식(3) -- 뚜띠쿠치나

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 3, 'steakpa', 'steakpa', '뚜띠쿠치나',  '125-75-11325',
'파슷아' ,'070-7398-0987', '서울특별시 마포구 마포대로12길 58', '44.jpg', 
'만족스러운 웃음, 뚜띠쿠치나! 뚜띠쿠치나는 이탈리안 피자, 파스타 그리고 스테이크를 전문적으로 만듭니다.', '인증샷', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 14, '연여샐러드',13300,'_cf21a9f3d18d5bd21e6fd365dc541e761627276418.jpg',
'연어, 케이퍼, 올리브', '연어추가',6000,'샐러드추가',3000,'치즈추가',3000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 14, '오리지널 마르게리따 피자',17900,'_837ca43d3b087fa705eddae152c002c81627276440.jpg',
'후레쉬 모짜렐라 치즈, 바질, EX버진 올리브 오일' ,'치즈추가',3000,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 14, '고르곤졸라 피자',15900,'_166296d1214c68f7abf7511ee6865c8a1627276444.jpg',
'오징어먹물 도우, 고르곤졸라 치즈, 모짜렐라 치즈', '꿀 추가',2000,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 14, '대하 해산물 토마토 파스타',16500,'_cda75232b6368bc5ec208fb638e340231627280055.jpg',
'대하 외 각종 해산물, 지중해 야채(가지, 호박, 피망), 마늘','곱빼기',2000,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 14, '매콤 아라비아따 파스타',14500,'--_df3f549f6d096f9b2f0c8d0ae86d3aa81671363923.jpg',
'수제 베이컨, 지중해 야채(가지, 호박, 피망), 올리브','곱빼기',2000,'감자튀김',2000,'펩시(500ml)',2000);

-- 양식(3) -- 버거인뉴욕

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 3, 'newyork', 'newyork', '버거 인 뉴욕',  '161-13-16945',
'누요커' ,'070-7695-1987', '서울 서대문구 신촌로 109 르메이에르신촌 1층', '45.jpg', 
'뉴욕의 감성과 건강한 버거를 원하신다면 바로 “버거인뉴욕"으로 오시면 됩니다!', '가성비', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 15, '뉴욕버거',10000,'new-york-burger_990c07dc5cc5732a8dd34d5b10d7a4c91554862675.jpg',
'기본 치즈버거와 신선한 토마토 위에 소스로 상큼하고 담백함을 느낄 수 있는 기본버거','치즈추가',1500,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 15, '베이컨치즈버거',10000,'bacon-cheese-burger_9155423a1b0b3689ac3fb3b1f469e4ee1554862768.jpg',
'기본 치즈버거와 그릴에 구운 베이컨, 양파로 패티의 진한 맛을 느낄 수 있는 버거' ,'치즈추가',1500,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 15, '스페셜 버거',11000,'special-burger_ef2b46ff4604ccafced075e24e87ca0c1554862854.jpg',
'뉴욕버거와 베이컨 치즈버거의 만남, 신선한 야채와 진한 패티가 베이컨과 어우러진 버거', '치즈추가',1500,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 15, '쉐프초이스버거',13000,'chef-choice-burger_d2befc111bffbd33f3798d7ac1e0ca0a1554863156.jpg',
'그날의 신선한 재료로 만든 버거인뉴욕만의 특별한 맛','베이컨추가',3000,'감자튀김',2000,'펩시(500ml)',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 15, '시카고 핫도그',14500,'chicago-hotdog_21b9bbaa49afd57036851737734aa6551554863179.jpg',
'육즙 좔좔 흐르는 소세지와 촉촉한 핫도그빵의 조합','치즈추가',1500,'감자튀김',2000,'펩시(500ml)',2000);

-- 양식(3) -- 빅터스 바베큐

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 3, 'bigter', 'bigter', '빅터스바베큐',  '923-13-15245',
'박빅터' ,'070-9075-1807', '서울 서대문구 연세로4길 6 2층', '46.jpg', 
'로우 앤 슬로우 기법으로 낮은 온도에서 오랜 시간 굽는 텍사스 스타일 바베큐 전문점 빅터스 바베큐입니다. ', '소울푸드', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 16, '풀드포크 & 브리스켓 (200g)',19000,'pulled-pork-and-brisket-for-1_e2c7ac458d4ccfef559824626c8c548d1639475369.jpg',
'풀드포크와 브리스켓을 함께 즐길 수 있습니다.','빵추가(2개)',1000,'스프라이트',2000,'코카콜라',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 16, '풀드포크 (200g)',18000,'pulled-pork-for-1_0923fe1eeb51a2e3e5b383a4a7924b8b1639475372.jpg',
'8시간 이상 훈연한 풀드포크' ,'빵추가(2개)',1000,'스프라이트',2000,'코카콜라',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 16, '스모크 치킨',15000,'smoked-chicken-for-1_bcae9b14d6608488bf4ab5e5dea074b91639475375.jpg',
'2조각', '빵추가(2개)',1000,'스프라이트',2000,'코카콜라',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 16, '풀드포크 (400g) ',35000,'pulled-pork-for-1_0923fe1eeb51a2e3e5b383a4a7924b8b1639475372.jpg',
'8시간 이상 훈연한 풀드포크를 2배로', '빵추가(2개)',1000,'스프라이트',2000,'코카콜라',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 16, '풀드포크 & 브리스켓 (400g)',38000,'pulled-pork-and-brisket-for-1_e2c7ac458d4ccfef559824626c8c548d1639475369.jpg',
'풀드포크와 브리스켓를 2배로 함께 즐길 수 있습니다.', '빵추가(2개)',1000,'스프라이트',2000,'코카콜라',2000);

-- 양식(3) -- 스티브쿡

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 3, 'steave', 'steave', '스티브 쿡',  '116-81-13445',
'스티브' ,'070-8888-9575', '서울 마포구 연남로1길 11 1층', '47.jpg', 
'제 이름을 걸고 항상 신선하고 맛있는 스테이크를 만드는 데 최선을 다하겠습니다. -스티브 ', '소울푸드', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 17, '스때끼(200g)',10000,'full-steak_7839d61dfbf2e9e01206f267e0f095641619079122.jpg',
'정성으로 구운 스테이크','빵추가(2개)',1000,'버터추가',1000,'아스파라거스 추가',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 17, '스때끼 (400g)',20000,'full-steak_7839d61dfbf2e9e01206f267e0f095641619079122.jpg',
'정성으로 구운 스테이크' ,'빵추가(2개)',1000,'버터추가',1000,'아스파라거스 추가',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 17, '스닭(200g)',7000,'chicken_dbdb34303614f18e58dd168839abdbf61619079126.jpg',
'정성으로 구운 닭 스테이크', '빵추가(2개)',1000,'소스추가',500,'아스파라거스 추가',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 17, '스닭(400g)',14000,'chicken_dbdb34303614f18e58dd168839abdbf61619079126.jpg',
'정성으로 구운 닭 스테이크', '빵추가(2개)',1000,'소스추가',500,'아스파라거스 추가',2000);

-- 양식(3) -- 타바스바

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 3, 'tapas_bar', 'tapas_bar', '타파스 바',  '713-32-12615',
'다봐스' ,'070-7777-9191', '서울 용산구 이태원로27가길 49 지상 1층(이태원동)', '48.jpg', 
'이태원에서 가장 빠르게 스페인을 만나보실 수 있는 타파스바입니다. ', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 18, '토마토미트볼',10000,'albondigas-con-tomate_ea8cb3256f1d1d00ba3d65eeea1d0a7d1557481434.jpg',
'타파스바만의 특제 토마토소스를 사용하였고, 약간의 매운맛을 내기 위해 베트남 고추를 넣어 만든 미트볼 타파스 메뉴',
'미트볼추가(1p)',1500,'면추가',1000,'코카콜라',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 18, '하몬 이베리코 40g',20000,'jamon-iberico_a8def530d22d47bd773b3ee11f4f4c371557481511.jpg',
'도토리를 먹여서 키운 스페인산 흑돼지 이베리코 뒷다리를 12개월 이상 염장해 만든 고급 스페인 생 햄' ,
'빵추가(2개)',1000,'하몬추가(10g)',5000,'미니 하몬크로킷 추가',4000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 18, '감바스 알 아히요',12000,'gambas-al-ajillo_dc5783a1e7ad0be1e974e8cd97dde74f1557481623.jpg',
'새우와 마늘을 올리브오일에 튀기듯 구워낸 음식으로 스페인 선술집에서 쉽게 접할수 있는 대표적인 타파스 메뉴', '빵추가(2개)',1000,'새우추가',3000,'면추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 18, '판콘 토마테',5000,'pancon-tomate_611b37bf9499a53a3af3cfd54fbd3bea1557481475.jpg',
'후레쉬한 토마토 퓨레, 마늘향이 가득하여 식전음식으로 제격인 타파스 메뉴', '판콘 토마테 추가(2p)',1500,'소스추가',1000,'미니 하몬크로킷 추가',4000);

-- 일식(4) -- 모미모미

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 4, 'momimomi', 'momimomi', '모미모미',  '183-13-12685',
'모미지' ,'070-5555-7676', '서울특별시 용산구 청파로45길 24', '19.jpg', 
'타 매장과 비교도 할수없는 연어의 퀄리티를 보여 드리겠습니다. ', '건강한 맛집', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 19, '생연어와 갓 지은 밥',13000,'_20221202_145520475_99346284098b63684898b081c360a72a1669974378.jpg',
'생연어, 양파','연여100g 추가',6000,'밥 추가',1500,'날치알 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 19, '생연어와 갓 지은 밥 곱빼기',16000,'_20221202_145520475_99346284098b63684898b081c360a72a1669974378.jpg',
'생연어, 양파','연여100g 추가',6000,'밥 추가',1500,'날치알 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 19, '연어장과 갓 지은 밥',13000,'_20221202_145521063_dc94677d48c9d42f8f7ad22d5990b0741669974388.jpg',
'연어장, 양파', '연여장80g 추가',6000,'밥 추가',1500,'날치알 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 19, '연어장과 갓 지은 밥 곱빼기',16000,'_20221202_145521063_dc94677d48c9d42f8f7ad22d5990b0741669974388.jpg',
'연어장, 양파', '연여장80g 추가',6000,'밥 추가',1500,'날치알 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 19, '새우장과 갓 지은 밥',13000,'_20221202_145521708_cd212ad5c7855410d292be8b777722271669974398.jpg',
'새우장, 양파', '새우장(2p)',3000,'밥 추가',1500,'날치알 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 19, '새우장과 갓 지은 밥 곱빼기',16000,'_20221202_145521708_cd212ad5c7855410d292be8b777722271669974398.jpg',
'새우장, 양파', '새우장(2p)',3000,'밥 추가',1500,'날치알 추가',1000);

-- 일식(4) -- 스시랑 회랑

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 4, 'sushirang', 'sushirang', '스시랑회랑',  '183-22-16845',
'김초밥' ,'070-8486-7636', '서울 서대문구 연세로5다길 10', '20.jpg', 
'오마카세 수준의 고급초밥과 고급 숙성사시미를 합리적인 가격으로 드실 수 있습니다. ', '건강한 맛집', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 20, '숙성연어직화초밥',20000,'salmon_317d049bdeaba4cd58f556e292ae02711660639010.jpg',
'10개. 숙성된 연어를 토치로 알맞게 구워 정말 부드러운 연어의 참맛을 즐기실 수가 있습니다.','연어초밥 2개 추가',4000,'간장추가',1000,'연어소스 추가',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 20, '숙성소고기스테이크초밥',30000,'suksung-sogogi-steaki-chobap_26bfe9b57189e8f4c7012b302f5c78f91660022724.jpg',
'10개.알맞게 숙성된 부드러운 소고기를 스테이크 처럼 구워만든 고급 초밥입니다. ','소고기초밥 2개 추가',6000,'락교 추가',1000,'초생강 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 20, '직화새우초밥',25000,'chickhwa-seyu_3b6172ff01b745a9fa7e12c19e1e08701660022757.jpg',
'10개. ','직화새우초밥 2개 추가',5000,'락교 추가',1000,'초생강 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 20, '민물장어덮밥',20000,'eel-box__307f8d617e2a7dbfae43135af8d055971660022769.jpg',
'자연산 민물장어로 만든 덮밥', '장어100g 추가',10000,'밥 추가',1500,'락교 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 20, '초밥 세트',30000,'c-set_8d5c4b14a5de2007086b8ca6278516731660022643.jpg',
'활어4, 연어1, 참다랑어뱃살1, 황새치1, 참치2, 직화1, 소고기1, 민물장어1, 간장새우1', '락교 추가',1000,'초생강 추가',1000 , '초장 추가',1000);

-- 일식(4) -- 오늘은 카레


insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 4, 'kare', 'kare', '오늘은 카레',  '712-32-57245',
'김오늘' ,'070-7389-1758', '서울 서대문구 명물길 58-8', '21.jpg', 
'맛있는 일식카레를 자부합니다! ', '소울푸드', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 21, '등심돈까스카레',9500,'1-_7c8a2550e6c662955e456c407ac64c861671362595.jpg',
'고품격 카레와 고품격 수제 등심돈까스의 만남 단언컨데 카레와 돈카츠는 최고의 조합입니다','등심돈까스 추가',3000,'계란후라이 추가',1000,'마늘후레이크 추가',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 21, '치즈돈까스카레',11000,'1-_b45fd304935802e9b9670beff3ceb7b81671362616.jpg',
'고품격 카레와 고품격 수제 치즈까스의 만남 입에서 녹는다는 느낌은 바로 이런것이다','치즈 돈까스 추가',2500,'계란후라이 추가',1000,'마늘후레이크 추가',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 21, '닭튀김카레 (4pcs)',9500,'1-_e62f0e8021f507bbbb863d664ab7813b1671362643.jpg',
'고품격 카레와 고품격 수제 닭튀김의 만남 겉바속촉 닭튀김과 카레의 완벽한 조화','가라아게 4pcs',3000,'계란후라이 추가',1000,'마늘후레이크 추가',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 21, '고로케카레 (3pcs)',9500,'1--3_29c70a9e4e8ed37ea6d13e20fc2a57e61671362667.jpg',
'고품격 카레와 고품격 감자고로케의 만남 포슬포슬한 감자고로케와 카레의 환상궁합','고로케 추가',3000,'계란후라이 추가',1000,'마늘후레이크 추가',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 21, '새우튀김카레 (2pcs)',9500,'1--_9de07b22594714d7886f28317c68051b1671362687.jpg',
'고품격 카레와 고품격 새우튀김의 만남 단언컨데 카레와 새우튀김 최고의 조합입니다','왕새우튀김 (2pcs)',2500,'계란후라이 추가',1000,'마늘후레이크 추가',2000);

-- 일식(4) -- 오니기리와 이규동

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 4, 'onigiri', 'onigiri', '오니기리와 이규동',  '613-22-12579',
'오길이' ,'070-8464-8787', '서울 서대문구 연희로 92', '22.jpg', 
'맛있는 오니기리와 규동 맛집으로 모십니다!!', '건강한맛집', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 22, '계란규동',7000,'beef-over-rice_b4f477d3194428819ee47ea3cd2356311572833519.jpg',
'오니기리와 이규동의 인기메뉴 소고기 샤브 덮밥','미니우동',4000,'계란 추가',1000,'새우튀김 (2pcs)',3000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 22, '보쌈 규동',8000,'bossam_8a8e01cacaa12a3ae77e09910e763a021562834827.jpg',
'일본식 샤브 소불고기와 상큼하고 아삭한 보쌈무를 함께 즐길수 있는 규동','미니우동',4000,'보쌈 추가',3000,'치즈 추가',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 22, '챠슈 데리야끼동',7500,'chashu_be2f6447eebe2a8b2bea6238fb6ded6b1562841609.jpg',
'돼지고기에 특제간장소스를 세차례 덧입혀 맛을 낸 일본식 돼지고기 덮밥','미니우동',4000,'차슈 추가',2000,'새우튀김 (2pcs)',3000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 22, '후리가케',2000,'1-1__e4cf0e8c14bf203ee793faef003a73ed1669107828.jpg',
'*오니세트 (오니기리1 + 미니우동)','미니우동',4000,'새우튀김 (2pcs)',3000,'치킨가라아게 (5pcs)',4000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 22, '보쌈김치',2300,'1-1__e4cf0e8c14bf203ee793faef003a73ed1669107828.jpg',
'*오니세트 (오니기리1 + 미니우동)','미니우동',4000,'새우튀김 (2pcs)',3000,'치킨가라아게 (5pcs)',4000);


-- 일식(4) -- 오모야

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 4, 'omoya', 'omoya', '오모야',  '612-35-71579',
'어머야' ,'070-8464-8787', '서울 강남구 강남대로 438 스타플렉스 210호', '23.jpg', 
'속이 허하다면 진한 육수의 오모야 시그니처 라멘과 곁들여도 좋아요.', '건강한맛집', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 23, '스페셜 연어 샐러드',12000,'salmon-salad_5cc64a1325fd448f2164e71cd6a159211588153505.jpg',
'달콤새콤한 맛의 오모야 특제소스로 만든 연어 샐러드','미니우동',4000,'새우튀김 추가',9000,'게살튀김',9000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 23, '콤비네이션 (19pcs)',24000,'assorted-sushi_a4fa7e6fb098db684ebfb064cde31c421588153488.jpg',
'연어초밥 (6pcs), 새우초밥 (6pcs), 문어초밥 (4pcs), 기타 (3pcs)','미니우동',4000,'새우튀김 추가',9000,'게살튀김',9000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 23, '닭고기 미소라멘',11000,'chicken-ramen_d4f7f4a4a7d9aa523984a386c03b44e31588153420.jpg',
'진한 육수에 일본 된장(Miso)이 어우러져 조리되는 일식 라멘 요리','미니우동',4000,'차슈 추가',2000,'새우튀김 추가',9000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 23, '일본식 카레',9000,'chicken-curry_1cb10680cd5a6c455c8a8be0140aff131588153449.jpg',
'부드러운 맛의 일본식 카레, 치킨 토핑을 추가할 수 있습니다','미니우동',4000,'새우튀김 추가',9000,'게살튀김',9000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 23, '소고기 덮밥',11000,'pork-over-rice_05d2b99d3091446b364079cd28ca396d1588153397.jpg',
'달콤한 특제소스로 만든 소고기 덮밥','미니우동',4000,'새우튀김 추가',9000,'게살튀김',9000);

-- 일식(4) -- 참 맛있는 돈까스

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 4, 'chamdon', 'chamdon', '참 맛있는 돈까스',  '542-17-04212',
'차돈돈' ,'070-6143-8167', '서울 서대문구 연세로4길 62', '24.jpg', 
'겉바속촉이 무엇인지 보여드리겠습니다.', '소울푸드', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 24, '수제 왕돈까스',11000,'giant-cutlet_47b2fd5e58a07a4d7dcc43fcfc74fbec1567472475.jpg',
'오리지날 왕 돈까스를 맛보세요','미니우동',3000,'소스추가',500,'쫄면추가',6500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 24, '수제 생선까스',10000,'fish-cutlet_4a51e093d82d3b1641dff40a54d0e7921567472510.jpg',
'생선까스를 맛보세요','미니우동',3000,'소스추가',500,'쫄면추가',6500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 24, '치즈 돈까스',10000,'cheese-pork-cutlet_9ae0b5f549e9a74ea6d0baced11e33581567472538.jpg',
'치즈가 쭉 늘어나는 치즈 돈까스','미니우동',3000,'소스추가',500,'쫄면추가',6500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 24, '쫄면',6500,'spicy-noodles_531b2477fe2718f68e233f56045f9d751567472646.jpg',
'새콤달콤 맛있는 쫄면','미니우동',3000,'소스추가',500,'쫄면추가',6500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 24, '수제통치즈돈까스',11000,'20200122_151405_919c21e045587e4c262484c5759f8c361580114913.jpg',
'치즈가 한가득! 맛있는 치즈 돈까스','미니우동',4000,'새우튀김 추가',9000,'게살튀김',9000);

--피자(5) 로쏘 1924
insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 5, 'rosso', 'rosso', '로쏘 1924',  '945-65-16758',
'이로손' ,'070-1616-3467', '서울특별시 마포구 홍익로 29', '31.jpg', 
'정통 나폴리 장작화덕 피자 전문점.', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 25, '마리나라 피자',8900,'marinara_f25422c733b2f015df2f8788b7c409581601881639.jpg',
'토마토 소스, 오레가노, 올리브오일, 마늘로 만든 나폴리 피자','파타타',3000,'살시차',4900,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 25, '마르게리타 피자',12000,'margherita__c2bb913bd0f6effe80443dfd60080ad01601881633.jpg',
'그라나파다노, 치즈, 토마토소스, 올리브오일, 바질','파타타',3000,'살시차',4900,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 25, '쿼트로 포르마지 피자',18000,'quattro-fromagio_9b363b39ab84f32a159caa7f8002bb5a1601881679.jpg',
'모짜렐라, 고르곤졸라, 리코타, 그라나파다노, 바질','파타타',3000,'살시차',4900,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 25, '파스쿠알레 피자',17500,'pasquale_d43a3e7eaa5bd8b6e9dcc5e1042b411c1601881647.jpg',
'살시차(수제 소시지)와 프리아리엘리, 프로볼라를 올려 구운 비앙카 계열의 피자','파타타',3000,'살시차',4900,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 25, '돌체 피자',12000,'_27abaa2109027cbab852a823e4bd8bb01641442133.jpg',
'헤이즐넛 초코렛과 아몬드 슬라이스를 올리고 구워낸 달콤한 디저트 피자','파타타',3000,'살시차',4900,'피클',1000);

--피자(5) 매덕스피자

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 5, 'maddux', 'maddux', '매덕스 피자',  '768-05-67985',
'마동덕' ,'070-1967-3195', '이태원동 129-9 2층 ', '32.jpg', 
'3대천왕에 나왔던 그 피자, 매덕스 피자!', '인증샷', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 26, '치즈',6700,'cheese_da44dadd71eaa59f39c0a4e651cd4a46.jpg',
'토마토 소스, 모짜렐라','감자튀김',3000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 26, '마르게리타 피자',7000,'margherita_97b878f574a9a1354c3e9a9e88ebab07.jpg',
'토마토 소스, 모짜렐라, 프레쉬 모짜렐라, 올리브오일, 파마산, 프레쉬 바질','감자튀김',3000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 26, '하와이안',7000,'hawaiin_ed9416d8d9d22d70659ebe76d1dc6ca3.jpg',
'토마토 소스, 모짜렐라, 햄, 파인애플','감자튀김',3000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 26, '맥앤치즈 베이컨',7500,'mac-and-cheese-with-bacon_663e14863b82d4f0723c9b8ac3895d6b.jpg',
'토마토 소스, 맥앤치즈, 베이컨','감자튀김',3000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 26, '페퍼로니',54000,'pepperoni_5cb7b69c04050e136f22ad5c2a045327.jpg',
'토마토 소스, 모짜렐라, 페퍼로니','감자튀김',3000,'핫소스',1000,'피클',1000);


--피자(5) 모타운 피자

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 5, 'motown', 'motown', '모타운 피자',  '612-65-67425',
'서다운' ,'070-1177-1325', '서울 마포구 신촌로 94 그랜드플라자 5층', '33.jpg', 
'1946년, 디트로이트 스타일의 피자가 미시간주 디트로이트의 버디즈 피자에서 탄생했습니다. ', '인증샷', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 27, '더블 페퍼로니 피자',23000,'detroit-red-pepperoni_9637ef3a889c2b8ecb71f5b955ac7cf01646120977.jpg',
'오리지널 디트로이트 레드피자에 페퍼로니 2배 더 올려 드립니다.','홈 메이드 랜치 딥',1000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 27, '치즈 피자',20000,'four-brothers-cheese_5a24927c13f62c30f503b241d25a5f401646120960.jpg',
'다양한 치즈 토핑한 피자위에 수제 마리나라 소스가 뿌려져 제공됩니다.','홈 메이드 랜치 딥',1000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 27, '이탈리안 피자',21000,'detroit-partnership-italian_38f976a807c4f28ee5469ea1c703903e1646121394.jpg',
'매장에서 직접만든 이탈리안 소시지, 하우스 블렌드한 치즈, 신선한 방울 토마토, 파마산 치즈를 토핑','홈 메이드 랜치 딥',1000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 27, '버팔로 치킨 피자',22000,'detroit-soul-buffalo_2f29ebfbb74eab0660f9ad28ce394c741646121007.jpg',
'할라피뇨를 뿌리고 그 위에 시원한 렌치소스와 따뜻한 버팔로 소스를 조화!','홈 메이드 랜치 딥',1000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 27, '치즈 스틱 (8개)',8500,'cheese-sticks_5f1869e4c3171e15025dce785b8120421646121110.jpg',
'바삭바삭한 골든 브라운 치즈 스틱','홈 메이드 랜치 딥',1000,'마리나라 소스',1000,'페스토 소스',1000);

--피자(5) 우르새피자

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 5, 'ursae', 'ursae', '우르새피자',  '619-36-17994',
'사우르' ,'070-7287-7346', '서울 서대문구 신촌로 139-1 1층', '34.jpg', 
'바삭 촉촉한 페이스트리 도우를 피자에 입혔다', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 28, '치즈 피자',21900,'0220181023095059_684f90d035ba31ee770ea4c70d6ba42e1599458407.jpg',
'치즈가 듬뿍, 치즈매니아에게 추천하는 메뉴','치즈오븐스파게티',7000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 28, '하와이안 피자',22000,'hawaiin-pizza_b8835b4e63aa826749bc2dd89e8aaafa1600074017.jpg',
'파인애플과 소세지가 토핑되어 있으며 파인애플의 상큼함을 느낄수 있는 피자','치즈오븐스파게티',7000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 28, '페페로니 피자',21000,'pepperoni-pizza_111904266440addd660651889a8680141600074023.jpg',
'치즈위에 페페로니가 더해져 짭쪼름한 페페로니 맛을 느낄수 있는 피자','치즈오븐스파게티',7000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 28, '불고기 피자',24000,'0220181022161331_fe521c41b2bad4492916935186a733e01599458158.jpg',
'한국인이 좋아하는 양념 불고기가 토핑되어 있는 피자','치즈오븐스파게티',7000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 28, '고르곤졸라 피자',22500,'gorgonzola-pizza_6e2338494fe5e14e0b0a7229ee1e08661600074010.jpg',
'고르곤졸라 치즈의 특별함과 달콤한 꿀차가 만나 부담없이 즐길수 있는 피자','치즈오븐스파게티',7000,'핫소스',1000,'피클',1000);


--피자(5) 피자에땅

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 5, 'pizzaett', 'pizzaett', '피자에땅',  '846-67-10894',
'준비땅' ,'070-6352-1745', '서울 서대문구 모래내로 464', '35.jpg', 
'정직하면 통한다!피자에땅', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 29, '신세개피자 2021',24000,'2_cf9dbc507c37da9a6a64e70dbd6eab481607409161.jpg',
'인절미, 살라미, 폭찹스테이크 - 서로다른 세개가 만나 새로운 세개','치킨텐더(5개)',6000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 29, '달피자',24000,'_87af1afa6ed1b7da5e4716f54aa61c901607409118.jpg',
'랜치소스, 크림치즈무스, 제니코크림치즈, 리코타, 알새우, 구운통마늘, 파인애플','치킨텐더(5개)',6000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 29, '맵피자',24000,'_bc9f82b4e6879ec8e90259656ca048951607409149.jpg',
'매운피자소스, 양념반달감자, 핫바비큐토핑, 로스트3종야채, 파인애플, 랜치소스, 파슬리','치킨텐더(5개)',6000,'핫소스',1000,'피클',1000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 29, '마불피자',24000,'_3770657ee7f979c1c58383772d6872db1607409130.jpg',
'로스트 갈릭, 갈릭 프레이크, 리얼불고기, 스리라차소스','치킨텐더(5개)',6000,'핫소스',1000,'피클',10000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 29, '맵고달고피자',26000,'_242e6130c2c037fef63c6fa533a163ba1607409288.jpg',
'맵단맵단 끊을 수 없는 매력','치킨텐더(5개)',6000,'핫소스',1000,'피클',1000);


--피자(5) 피자파는집

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 5, 'pizzabuy', 'pizzabuy', '피자 파는집',  '643-66-16664',
'정피파' ,'070-8487-1875', '서울특별시 마포구 성미산로 58 보영퍼펙트 102호 ', '36.jpg', 
'토핑 듬뿍 들어간 맛있는 피자를 즐기실 수 있는 피자집!', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 30, '베이컨포테이토',19000,'_c3e7d1795337785cb093a46f816651de1593161339.jpg',
'영양만점 포테이토와 고소한 베이컨의 케미가 폭발','버팔로윙',6000,'마약옥수수',5000,'체다웨지감자',7000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 30, '달콤딥고구마',19000,'sweet-potato-pizza_424412960912e1c179cec629e654623d1593506033.jpg',
'달콤한 수제고구마 무스의 깊은 담백함과 치즈의 하모니가 예술','버팔로윙',6000,'마약옥수수',5000,'체다웨지감자',7000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 30, '불닭바베큐',19000,'_6f3c4593c903ff665fd516e4ee9c4fd21593161370.jpg',
'매콤한 불닭바베큐 토핑이 치즈와 만나 한국인의 입맛에 딱!','버팔로윙',6000,'마약옥수수',5000,'체다웨지감자',7000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 30, '로멘틱 하와이안',19000,'_c19ed9aaba7b36d5746927444e16dff21593161389.jpg',
'새콤달콤 파인애플과 담백한 햄의 로멘틱한 만남','버팔로윙',6000,'마약옥수수',5000,'체다웨지감자',7000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 30, '페페로니',18000,'pepperoni-pizza_caafca77f4c071fe5a103494442a80101593505990.jpg',
'쫄깃한 식감의 정통 이탈리안 피자로 페페로니가 듬뿍','버팔로윙',6000,'마약옥수수',5000,'체다웨지감자',7000);

--치킨(6) bbq
insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 6, 'bbqlove', 'bbqlove', 'BBQ',  '700-10-10064',
'김형서' ,'070-7658-1155', '서울 서대문구 연세로7안길 13 1층 ', '1.jpg', 
'BBQ는 그 이름처럼 최고의 원재료만을 사용하여 맛은 물론 고객의 건강까지 생각합니다', '나눠먹어요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 31, '황금올리브치킨',24000,'23000_72606988a4ff18e71f4f7f82d5ef75b31615794552.jpg',
'육즙 가득한 BBQ 대표 메뉴','크림치즈볼',6000,'황금알치즈볼',5000,'20cm 새우스틱',7000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 31, '황금올리브양념순살',27000,'25000_2892eded7927c2366b1e9d55a090ce8c1615794557.jpg',
'양념도 순살로 먹자!','크림치즈볼',6000,'황금알치즈볼',5000,'20cm 새우스틱',7000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 31, '황금올리브닭다리',25000,'24000_5c7ca9e1bb6c3214ade25acb158f29bb1615794635.jpg',
'블록버스터급 쫄깃함','크림치즈볼',6000,'황금알치즈볼',5000,'20cm 새우스틱',7000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 31, '황금올리브핫윙',24000,'24000_82c04da66737ff36739867ad7454643d1615794531.jpg',
'미인들의 인기메뉴, 황금올리브핫윙','크림치즈볼',6000,'황금알치즈볼',5000,'20cm 새우스틱',7000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 31, '순살크래커',26000,'24000_65e41c1c12e8ed3aad989a7bf154b4261615794336.jpg',
'건강한 우리 아이 간식 (닭다리살)','크림치즈볼',6000,'황금알치즈볼',5000,'20cm 새우스틱',7000);

--치킨(6) 교촌치킨
 
insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 6, 'kyochon', 'kyochon', '교촌치킨',  '811-46-18864',
'교집합' ,'070-8615-7625', '서울 서대문구 명물길 21 ', '2.jpg', 
'우리의 정직한 이야기가 담긴, 정직한 맛을 소비자에게 전달하겠다는 이 슬로건은 우리가 지키고 이끌어나가야 할 약속입니다.', '나눠먹어요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 32, '교촌오리지날',16000,'_list_15-10-231120_bc62f092a19fd14db8633794ed3befb51576225069.jpg',
'한마리','교촌웨지감자',3500,'교촌치즈볼',5000,'교촌꽈배기',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 32, '교촌 콤보',19000,'_list_15-10-2310721_69e847b091f9ff4ab08d5854deeba4711576224861.jpg',
'마늘 간장 소스의 풍부한 맛에 가장 인기있는 부위인 날개와 다리를 함께 즐길 수 있는 메뉴','교촌웨지감자',3500,'교촌치즈볼',5000,'교촌꽈배기',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 32, '교촌레드오리지날',16000,'_8e8222e3167de55ed123868e760142fe1611913560.jpg',
'국내산 청양 홍고추의 매콤함이 일품인 한 마리 치킨','교촌웨지감자',3500,'교촌치즈볼',5000,'교촌꽈배기',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 32, '교촌레드콤보',17000,'_2ea617f66afa371a8c24693930d25f001619770282.jpg',
'국내산 청양 홍고추의 매콤한 맛에 날개와 다리를 함께 즐길 수 있는 메뉴','교촌웨지감자',3500,'교촌치즈볼',5000,'교촌꽈배기',3500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 32, '교촌허니콤보',20000,'_list_15-10-231098_27ef65e7d53774cdb508827353ce02031576225323.jpg',
'달콤한 허니 소스에 쫄깃한 날개와 담백한 다리가 만난 메뉴','교촌웨지감자',3500,'교촌치즈볼',5000,'교촌꽈배기',3500);


--치킨(6) 굽네치킨

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 6, 'goobne', 'goobne', '굽네치킨',  '945-16-12534',
'최고닭' ,'070-8456-7689', '서울 서대문구 연세로9길 34-4 1층 ', '3.jpg', 
'튀긴 치킨은 찾아보기 쉽지만, 기름기를 쏙 뺀 오븐구이 치킨을 판매하고 있습니다.', '나눠먹어요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 33, '굽네 오리지널',16000,'original-chicken_38030663f42d717cfc4b623052f41d0e1589122020.jpg',
'치킨이 먹는데 살이 왜쪄 굽네는 살이 안쪄 단백질이야~','갈릭 크림 바게트볼',3500,'웨지감자',5000,'소스추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 33, '굽네 고추 바사삭',19000,'pepper-crispy-chicken_cf7ac2c5356bfe2123e691aa014d47241589121959.jpg',
'고추바사삭은 마약이다 왜 마약인지 먹어보면 알거야','갈릭 크림 바게트볼',3500,'웨지감자',5000,'소스추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 33, '바비큐 시카고딥디쉬피자',19000,'sweet-potato-honey-mellow-pizza_cb985b452539fa3f410c9c416adc28d31589122272.jpg',
'풍성한 치즈에 큼직한 바비큐 포크가 퐁당~ 치즈케이크 무스로 엣지까지 특별한 시카고 피자','갈릭 크림 바게트볼',3500,'웨지감자',5000,'소스추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 33, '그릴드 비프 갈비천왕 피자',19000,'grilled-beef-galbi-king-pizza_694443f1dc7483181b754465a3c1a2251589122294.jpg',
'포테이토에 갈비천왕 소스 듬뿍~~ 그릴드 비프의 환상조합 와 맛있다','갈릭 크림 바게트볼',3500,'웨지감자',5000,'소스추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 33, '볼케이노 치밥',7000,'chicken-rice_87c6682770fcfa23efae5cb73187796a1589122363.jpg',
'볼케이노치밥! 치밥 위에 치즈가 샤르르~~','갈릭 크림 바게트볼',3500,'웨지감자',5000,'소스추가',500);


--치킨(6) 지코바

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 6, 'zicobar', 'zicobar', '지코바',  '768-35-91675',
'지아코' ,'070-0095-7833', '서울 서대문구 연세로7길 25 1층 ', '4.jpg', 
'엄선된 최고 품질의 재료로 만든 어느누구도 흉내 낼수 없는 양념 맛.', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 34, '순살 양념구이 치킨',20000,'_805e740c79e67b4d33561ab28fd2fe981553149803_7c7e8bbcaa4557c91f5499df8c6c894d1670386145.jpg',
'누구도 모방할 수 없는 지코바 치킨 소스로 맛을 낸 순살 맛은 특별합니다','햇반',1500,'마요네즈(2개)',500,'무추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 34, '순살 소금구이 치킨',19000,'_e842db7ab72328b7c3f11853f9773db81553149649_90a26093e9d4f8cde0d017129b2b331c1670386160.jpg',
'고추바사삭은 마약이다 왜 마약인지 먹어보면 알거야','햇반',1500,'마요네즈(2개)',500,'무추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 34, '뼈양념구이',19000,'_805e740c79e67b4d33561ab28fd2fe981553149803_7c7e8bbcaa4557c91f5499df8c6c894d1670386145.jpg',
'양념 소스를 곁들인 한 마리를 잘라 오븐에 구워 나갑니다','햇반',1500,'마요네즈(2개)',500,'무추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 34, '뼈소금구이',19000,'_e842db7ab72328b7c3f11853f9773db81553149649_90a26093e9d4f8cde0d017129b2b331c1670386160.jpg',
'닭한마리를 잘라 오븐에 구워 나갑니다','햇반',1500,'마요네즈(2개)',500,'무추가',500);


--치킨(6) 푸라닭

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 6, 'purapura', 'purapura', '푸라닭 치킨',  '164-25-98745',
'맹품다' ,'070-7335-7612', '서울 서대문구 신촌로 223-1 1층 ', '5.jpg', 
'푸라닭 치킨은 스페인어로 순수한이라는 뜻을 가진 PURA와 닭을 뜻하는 DAK의 합성어로 순수한 마음의 사람들이 만드는 치킨 브랜드입니다.', '나눠먹어요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 35, '푸라닭 치킨',16000,'__4d28a6203f7d73a15f4c72908fb46e6f1612840017.jpg',
'오븐에 조리 후 후라이드하여 속은 촉촉하고 겉은 바삭한 푸라닥 오븐 후라이드 메뉴.','지파이',4000,'콘소메 지파이',5900,'크레이프롤',4900);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 35, '달콤양념 치킨',19000,'__8aeb99e141c6cf2e741d2af718efed0e1612839371.jpg',
'푸라닭만의 양념으로 깔끔&달콤한 맛이 매력적인 중독성 강한 양념치킨! ','지파이',4000,'콘소메 지파이',5900,'크레이프롤',4900);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 35, '고추마요 치킨',19000,'__42a3abc9133b4d91ef1da39e1e47066c1612839877.jpg',
' 맵다, 부드럽다, 고소하다, 달콤하다, 새콤하다. 맛의 조합이 환상적인 강추메뉴','지파이',4000,'콘소메 지파이',5900,'크레이프롤',4900);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 35, '블랙알리오 치킨',19000,'__87770562fed616761733a1e4a61e00a81612839457.jpg',
'깊고 진한 간장의 풍미와 고소하면서 담백한 마늘의 만남, 치킨을 넘어 진정한 요리를 느낄 수 있는 메뉴','지파이',4000,'콘소메 지파이',5900,'크레이프롤',4900);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 35, '파불로 치킨',18000,'__2a96afe071354c5a3fd6b0961f22f0bc1612839490.jpg',
'불고기의 진한 맛과 아삭한 파의 하모니, 파불고기 치킨, 푸라닭의 치킨은 요리다!','지파이',4000,'콘소메 지파이',5900,'크레이프롤',4900);


--치킨(6) 후라이드참잘하는집

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 6, 'huraidbest', 'huraidbest', '후라이드참잘하는집',  '171-86-76654',
'하동훈' ,'070-3589-1975', '서울 마포구 독막로 151 ', '6.jpg', 
'후라이드참잘하는집 치킨은 기본적으로 살짝 매콤한 맛이 있습니다.', '나눠먹어요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 36, '겉바속촉 후라이드',15000,'_7ab0b100b5f6b9d779dfe9929c3bb2131618194443.jpg',
'아이들이 먹기엔 살짝 매콤합니다.','눈꽃치즈 핫도그',4000,'치즈볼',4000,'감자튀김',6000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 36, '양념치킨',16000,'screenshot_20210331-201112_afe6b9ef22d3c7121a60bcc36d81c1801617192897.jpg',
'후참잘만의 소스로 만든 양념치킨 ','눈꽃치즈 핫도그',4000,'치즈볼',4000,'감자튀김',6000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 36, '핫토스치킨',17000,'screenshot_20210331-201044_51e51070f761cc2d9ebae786e928827e1617189695.jpg',
'추억의 맛 x토스 맛이 나는 치킨','눈꽃치즈 핫도그',4000,'치즈볼',4000,'감자튀김',6000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 36, '허니버터치킨',17000,'screenshot_20210331-201102_b6e34cc3430b9ecadf6a3070891456ea1617192626.jpg',
'당신이 상상하는 맛 그 이상','눈꽃치즈 핫도그',4000,'치즈볼',4000,'감자튀김',6000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 36, '간장치킨',16000,'screenshot_20210331-201107_d10ba84a25aa554eadaa507475c3b6261617192717.jpg',
'단짠의 정석 간장치킨!','눈꽃치즈 핫도그',4000,'치즈볼',4000,'감자튀김',6000);


-- 분식(7) 고봉민 김밥

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 7, 'gimbab', 'gimbab', '고봉민 김밥',  '765-75-71354',
'고봉민' ,'070-7579-3758', '서울 마포구 독막로 151 ', '37.jpg', 
'또한 좋은 재료, 좋은 레시피를 통해 내 아이와 우리 가족 모두가 믿고 먹을 수 있는 음식을 만들어 드릴 것을 약속 드립니다.', '소울푸드', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 37, '고봉민김밥',3000,'_1ac8d2d2d6b52442d4654c6014ae03fa1611885561.jpg',
'쫀득하게 조려진 우엉의 풍미가 일품인 속은 알차고 맛은 깔끔한 기본김밥','납작 탕수육',8000,'단무지',1000,'샐러드',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 37, '고봉민 돈까스',4000,'donkatsu_aa616931933ffbb6619f65e99337c73a1611716257.jpg',
'신선한 돼지고기에 영양 가득한 튀김 옷을 입혀 바삭하게 튀겨낸 고급수제 돈까스','납작 탕수육',8000,'단무지',1000,'샐러드',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 37, '순두부찌개',7500,'sundubu-jiggae_c9b12b47b25b344550b24567fabd751c1611716161.jpg',
'소고기와 해물이 들어가 시원하고 칼칼한 국물이 일품인 순두부찌개','납작 탕수육',8000,'단무지',1000,'샐러드',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 37, '쫄면',7000,'menu2_3on_a0d48c449430ebf054bcdb339adcb7681612003659.jpg',
'매콤한 소스에 쫄깃한 면발과 아삭한 야채가 어우러진 쫄면','납작 탕수육',8000,'단무지',1000,'샐러드',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 37, '육개장한상',8000,'01_5e59ccbba1b3a199a11e9a0bd31de5801611885902.jpg',
'사태살+양지살이 가득한 육개장 & 반찬3종까지 알찬 구성의 식사류', '납작 탕수육',8000,'단무지',1000,'샐러드',2000);

-- 분식(7) 불스떡볶이

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 7, 'bulldduk', 'bulldduk', '불스 떡볶이',  '115-98-76765',
'김화인' ,'070-7085-9665', '서울 마포구 숭문길 55 ', '38.jpg', 
'매콤 달콤한 한국의 맛 떡볶이', '매워요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 38, '불스떡볶이',16000,'copy_655608dbf738b6a6d369daf4cb29fa4f1648017877.jpg',
'시그니처 떡볶이','차돌 추가',6000,'매콤누드순대',4000,'누룽지탕',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 38, '치즈차돌박이떡볶이',21000,'_459082a79fc23a2c66a61225021185921648017749.jpg',
'치즈와차돌과의 환상조합','차돌 추가',6000,'매콤누드순대',4000,'누룽지탕',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 38, '불스치즈꿀고구마떡볶이',15000,'_42ac7edb355bedc2b2d5bfd60ddc79c51648017801.jpg',
'소고기와 해물이 들어가 시원하고 칼칼한 국물이 일품인 순두부찌개','차돌 추가',6000,'매콤누드순대',4000,'누룽지탕',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 38, '불스치즈페퍼로니',15000,'_4863e07cccbfb6193acf0dd080526c721648017783.jpg',
'매콤한 소스에 쫄깃한 면발과 아삭한 야채가 어우러진 쫄면','차돌 추가',6000,'매콤누드순대',4000,'누룽지탕',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 38, '불치3~4인',24000,'_7b14e0ed236aa1bdbe080c004bcda1851648017896.jpg',
'불스(떡볶이or오뎅)+크리스피치킨+(콜라小or쿨피스)중 선택', '차돌 추가',6000,'매콤누드순대',4000,'누룽지탕',5000);


-- 분식(7) 신전떡볶이

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 7, 'sinsin', 'sinsin', '신전 떡볶이',  '161-71-72365',
'고리수' ,'070-6424-9555', '서울 서대문구 이화여대1길 28 ', '39.jpg', 
'주문과 동시에 조리를 하며,신속한 배달을 지향합니다.', '매워요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 39, '치즈떡볶이',6000,'cheese-teokbokki_db1f56b68fe2f3d072993e9d7acc48db1623053938.jpg',
'신전떡볶이 베스트 떡볶이','순대 추가',4000,'삶은 계란',1500,'맑은 오뎅탕',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 39, '떡볶이',21000,'teokbokki_532cedea5da90db33ec18b5d26671a441623054154.jpg',
'카레맛 솔솔 떡볶이','순대 추가',4000,'삶은 계란',1500,'맑은 오뎅탕',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 39, '순대',5000,'_26224899cd56ca180115954ad40f414c1604040148.jpg',
'내장 없음','순대 추가',4000,'삶은 계란',1500,'맑은 오뎅탕',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 39, '신전치즈김밥',4500,'_c5966b2ef196c6363d461d5f129f7a601623739431.jpg',
'매운 치즈김밥','순대 추가',4000,'삶은 계란',1500,'맑은 오뎅탕',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 39, '모듬튀김',9500,'__c6a053f01f902badf3a03712923b0f881623739383.jpg',
'튀오뎅 (2개) + 잡채말이 (2개) + 김말이 (2개) + 단호박 (2개) + 감자 (1개) + 치킨링 (4)개 + 치즈스틱 (1개) + 치즈볼 (1개)', '순대 추가',4000,'삶은 계란',1500,'맑은 오뎅탕',5000);


-- 분식(7) 아딸떡볶이

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 7, 'abba', 'abba', '아딸 떡볶이',  '611-54-57865',
'아바달' ,'070-0894-6758', '서울 마포구 숭문길 55 ', '40.jpg', 
'아빠 튀김, 딸 떡볶이', '매워요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 40, '국물 면떡이',10000,'soup_76953aa34d2b5b9a23f7b810f56e57541562202583.jpg',
'면처럼 긴 떡으로 만든 국물떡볶이','순대 추가',4000,'삶은 계란',1500,'어묵탕',5500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 40, '아딸 떡볶이',21000,'addal-rice_11cc94b7050e2ab760d03363ce3363ba1562202366.jpg',
'아빠가 딸을 위해 만든 떡볶이','순대 추가',4000,'삶은 계란',1500,'어묵탕',5500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 40, '아딸범벅',5000,'1622438538407_e05d6dd78be933e39f782eca4d71e6ee1623048084.jpg',
'떡볶이+김말이2+만두1','순대 추가',4000,'삶은 계란',1500,'어묵탕',5500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 40, '모듬 허브튀김',5000,'17_364dac4534c0cf59bf4f79113c8634461623395941.jpg',
'1인분','순대 추가',4000,'삶은 계란',1500,'어묵탕',5500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 40, '꼬마김밥',4500,'10_4dca60f9f5c64af25baece2a155b33af1623395828.jpg',
'작지만 맛있다!', '순대 추가',4000,'삶은 계란',1500,'어묵탕',5500);


-- 분식(7) 아빠분식
insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 7, 'daddy', 'daddy', '아빠분식',  '151-56-57535',
'나아지' ,'070-7658-0645', '서울 서대문구 신촌로 61-1 1층 ', '41.jpg', 
' 내 가족이 먹는다 생각하며 매일매일 싱싱한 재료로 정성껏 요리합니다. ', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 41, '뼈해장국',11000,'download-2_d743560e90043c70c3fc25d9491eafb31665466267.jpg',
'사골로 끓인 뼈해장국','칠성사이다',2000,'밀키스',2000,'펩시',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 41, '뼈 참숯 소금구이',21000,'download-2_fcf887f0405ba73bc129b98e9673f1421655280918.jpg',
'참숯으로 구워 맛있습니다','칠성사이다',2000,'밀키스',2000,'펩시',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 41, '뼈 참숯 양념구이',22000,'download-5-2_2b7db794072b2e4c5a419ce6f552d6c11655281464.jpg',
'참숯으로 구워 맛있습니다','칠성사이다',2000,'밀키스',2000,'펩시',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 41, '부대찌개 (2인 기본)',15000,'budaejiggae_0fc2c80d6693b9dfec06502fc2f557ab1596435296.jpg',
'소세지,햄,쇠고기,김치','칠성사이다',2000,'밀키스',2000,'펩시',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 41, '치즈라면',4500,'cheese-ramen_4743ce66869458517bb1295e224a4c671596435345.jpg',
'꼬들꼬들 맛있는 라면에 치즈', '칠성사이다',2000,'밀키스',2000,'펩시',2000);

-- 분식(7) 이대 깻잎떡볶이

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 7, 'ihwadduk', 'ihwadduk', '이대 깻잎 떡볶이',  '173-57-50955',
'이덕후' ,'070-7087-7654', '서울특별시 서대문구 신촌역로 22-5 신촌박스퀘어 1층 21호 ', '42.jpg', 
' 내 가족이 먹는다 생각하며 매일매일 싱싱한 재료로 정성껏 요리합니다. ', '푸짐해요', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 42, '치즈떡볶이',7500,'download-2_d743560e90043c70c3fc25d9491eafb31665466267.jpg',
'모짜렐라치즈가 듬뿍 치즈 떡볶이','칠성사이다',2000,'밀키스',2000,'펩시',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 42, '깻잎떡볶이',5000,'download-2_fcf887f0405ba73bc129b98e9673f1421655280918.jpg',
'깻잎 떡볶이','오뎅',2000,'밀키스',2000,'펩시',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 42, '찰순대—순대만',5000,'download-5-2_2b7db794072b2e4c5a419ce6f552d6c11655281464.jpg',
'내장이 없는 순대','오뎅',2000,'밀키스',2000,'펩시',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 42, '수제 모듬튀김',8000,'budaejiggae_0fc2c80d6693b9dfec06502fc2f557ab1596435296.jpg',
'다양한 모듬튀김','오뎅',2000,'밀키스',2000,'펩시',2000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 42, '야채김밥',3500,'cheese-ramen_4743ce66869458517bb1295e224a4c671596435345.jpg',
'신선한 야채김밥', '오뎅',2000,'밀키스',2000,'펩시',2000);

-- 디저트(8)	-- 도너츠 윤

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 8, 'yoondn', 'yoondn', ' 도너츠 윤',  '122-52-22255',
'윤도넛' ,'070-8455-3158', '서울 서대문구 연세로7안길 1 1층 도너츠 윤', '13.jpg', 
' 당일생산 당일판매를 원칙으로 방부제와 합성보존료를 첨가하지 않은 건강한 먹거리 도너츠윤 입니다. ', '인증샷', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 43, '누텔라초코 찹쌀도너츠',1800,'d1.jpg',
'달콤한 누텔라가 가득~ 도넛','달고나카페라떼',3000,'아메리카노',2000,'달고나우유',4000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 43, '팥크림 찹쌀도너츠',1800,'d6.jpg',
'팥크림 가득~ 도넛','달고나카페라떼',3000,'아메리카노',2000,'달고나우유',4000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 43, '녹차크림 찹쌀도너츠',1800,'d2.jpg',
'녹차크림 가득~ 도넛','달고나카페라떼',3000,'아메리카노',2000,'달고나우유',4000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 43, '크림치즈 찹쌀도너츠',1800,'d4.jpg',
'크림치즈 가~득 도넛','달고나카페라떼',3000,'아메리카노',2000,'달고나우유',4000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 43, '콩크림 찹쌀도너츠',1800,'d5.jpg',
'콩크림이 가득~ 도넛', '달고나카페라떼',3000,'아메리카노',2000,'달고나우유',4000);

-- 디저트(8)	-- 디저트 킹덤

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 8, 'dkingdom', 'dkingdom', '디저트킹덤',  '378-57-54878',
'구기런' ,'070-7698-3578', '서울 서대문구 연세로11길 20 2층', '14.jpg', 
'마카롱, 뚱카롱, 킹카롱, 조각케이크 등등 디저트가 한 곳에 다 모인 디저트 킹덤 입니다', '인증샷', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 44, '당근케이크',7000,'_8662719b0589ae31cde4b8b6486407ab1635403320.jpg',
'꾸덕한 당근케이크','버블 밀크티',5000,'초코 버블티',5000,'타로 버블티',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 44, '레드벨벳 케이크',7000,'_b900ee7ed8f47b1f24d406f7d24f980a1635403317.jpg',
'빨간맛~ 궁금해 허니','버블 밀크티',5000,'초코 버블티',5000,'타로 버블티',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 44, '오레오 케이크',7000,'_8de601f02e6d0e9f934ee02133ff0d611635403309.jpg',
'오~레오레오~ 케이크','버블 밀크티',5000,'초코 버블티',5000,'타로 버블티',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 44, '킹마카롱—딸기우유',3000,'king-macaroon-10-strawberry-milk_f76a57c933bc9648403be73a4355cd271635399271.jpg',
'어피치모양 마카롱','버블 밀크티',5000,'초코 버블티',5000,'타로 버블티',5000);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 44, '킹마카롱—순수우유',3000,'king-macaroon-04-pure-milk_0980d098cbde52298a5cc12b023e7d971635399275.jpg',
'네오 모양 마카롱', '버블 밀크티',5000,'초코 버블티',5000,'타로 버블티',5000);

-- 디저트(8)	-- 비건씨의 헬스농장

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 8, 'healthfarm', 'healthfarm', '비건씨의 헬스농장',  '612-73-16187',
'나비건' ,'070-6123-7133', '서울특별시 서대문구 연희맛로 33 2층', '15.jpg', 
'운동을 좋아하거나 채식을하는 사람들이 집에서도 간편하게 즐길 수 있도록 만든 배달 음료 브랜드입니다. ', '건강한 맛집', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 45, '헬린이 닭가슴살 쉐이크',7000,'super-green_9564eff5cbde2862181e8af614efeda21598593992.jpg',
'닭가슴살 100g과 상큼한 과일(청포도, 귤, 바나나)을 함께 갈아 맛있는 닭가슴살 쉐이크','타피오카펄 추가',1000,'프로틴 추가',1000,'오이시꾸나레',0);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 45, '3대500 닭가슴살 쉐이크',8000,'shake-2_881cab1d42821d18e444598721fd97781598593959.jpg',
'닭가슴살 200g과 채소, 과일을 갈아만든 고단백 닭가슴살 쉐이크','타피오카펄 추가',1000,'프로틴 추가',1000,'오이시꾸나레',0);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 45, '비타민가득 오렌지',7000,'vitamin-orange_993c3aab42deb4f109cff7eef321f2d11598594014.jpg',
' 피로회복에 좋은 100% 착즙 클렌즈주스','타피오카펄 추가',1000,'프로틴 추가',1000,'오이시꾸나레',0);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 45, '이너뷰티 옐로우',7000,'inner-beauty-yellow_e17e57fd8a557c72a7db32e84aebda131598593939.jpg',
'몸 속부터 가벼워지는 100% 착즙 클렌즈주스','타피오카펄 추가',1000,'프로틴 추가',1000,'오이시꾸나레',0);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 45, '슈퍼클린 그린',7000,'shake-1_155e2a3909f21881f92dcd316b8a416b1598593963.jpg',
'몸 속 노폐물 제거에 탁월한 100% 착즙 클렌즈주스', '타피오카펄 추가',1000,'프로틴 추가',1000,'오이시꾸나레',0);

-- 디저트(8)	-- 이디야 커피

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 8, 'ediya', 'ediya', '이디야 커피',  '122-61-13787',
'아이디' ,'070-7698-1579', '서울 서대문구 신촌로 87-20 1층', '16.jpg', 
'품질 좋고 맛있는 커피를 합리적인 가격에 제공해 고객의 만족을 최우선으로 생각하는 이디야 커피입니다.', '가성비', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 46, '아메리카노',3000,'black-coffee.jpg',
'최고급 원두만 사용한 아메리카노','샷 추가',500,'각설탕 추가',500,'우유추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 46, '카라멜 마끼아또',4500,'ice__8e08173.jpg',
'달콤함이 가득한 카라멜 마끼아또','샷 추가',500,'각설탕 추가',500,'우유추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 46, '흑당 콜드브루',7000,'_c2bc4e6eead15a83f0d528bf2c8c9.jpg',
'*아이스만 가능','샷 추가',500,'타피오카펄 추가',500,'우유추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 46, '망고 플래치노',5000,'_da1b9e9ec611c95f76a995259c0b5eab1611405387_03e26b19cf80167cbfc551298cf9e3361642471008.jpg',
'*아이스만 가능','샷 추가',500,'각설탕 추가',500,'망고추가',500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 46, '요거트 플래치노',7000,'_91caedb1366fae10453d31f63c7df1b01611484196_e8e528f836ee0a656422d92e06e8721e1642471253.jpg',
'*아이스만 가능', '샷 추가',500,'각설탕 추가',500,'파우더추가',500);

-- 디저트(8)	-- 크로앙쥬

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 8, 'croffle', 'croffle', '크로앙쥬',  '570-67-71237',
'노쥬쥬' ,'070-7698-1579', '서울 마포구 신촌로 82 1층 103호', '17.jpg', 
'천연버터의 풍미가 가득한 플레인 크로플과 다양한 커피&음료를 즐겨보세요', '가성비', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 47, '딸기 생크림 크로플',5500,'1669699117022_3138cad0a9068a3ad03a48ce5df8553c1669701250.jpg',
'시즌메뉴','초코크림 추가',500,'바나나 추가',1500,'딸기추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 47, '누텔라 크림치즈 크로플',4500,'_17bfdc7adfa410a96d4a3e3beb593cfe1666241432.jpg',
'누텔라와 크림치즈의 조합','초코크림 추가',500,'바나나 추가',1500,'딸기추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 47, '플레인 크로플',3000,'_06481289545fba9ace97b1f2b34fe1f91666241701.jpg',
'100퍼센트 천연버터만 사용한 고퀄리티 크로플','초코크림 추가',500,'바나나 추가',1500,'딸기추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 47, '허니갈릭 크로플',5000,'_9242d5cb13708a408ccd94426992df7e1666241787.jpg',
'달콤 고소한 마늘빵맛','초코크림 추가',500,'바나나 추가',1500,'딸기추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 47, '오레오 크로플',7000,'_b8b457ebfccb459b3607a40609c357051666241799.jpg',
'오레오 크림이 가득 크로플', '초코크림 추가',500,'바나나 추가',1500,'딸기추가',1500);

-- 디저트(8)	-- 휙휙쉐이크

insert into restaurant(rseq, kind, rid, rpwd, rname, rbiznum, ownername,rphone, raddress, rimage, content, hash, rtip, ryn)
values(restaurant_seq.nextVal, 8, 'huick', 'huick', '휙휙 쉐이크',  '171-71-23451',
'휘파람' ,'070-7618-1359', '서울 마포구 백범로1길 16', '18.jpg', 
'안녕하세요 고객님~밀크쉐이크 전문점 HUICKHUICK 입니다^^', '가성비', 1000, 1);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 48, '민트초코 밀크쉐이크',6000,'_4d593c57255a434531f8fa3ca38fa67a1581903765.jpg',
'민트를 사랑하는 모든분들을 만족시켜드릴 민트초코밀크쉐이크','덜 달게',0,'초코칩 추가',500,'휘핑추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 48, '딸초돼지바 밀크쉐이크',6000,'_8ae587bae82051889875a3758495a7cc1581904237.jpg',
'돼지바맛을 연상하게 하는 딸초돼지바밀크쉐이크','덜 달게',0,'초코칩 추가',500,'휘핑추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 48, '다크초코 밀크쉐이크',6000,'_4ebda98d431e9f4c660e286da1b60f131581903744.jpg',
'진한 초콜렛소스를 블랜딩하여 여러분의 엔돌핀을 촉진시켜 드리는 다크초코밀크쉐이크','덜 달게',0,'초코칩 추가',500,'휘핑추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 48, '메론아 밀크쉐이크',5000,'_d47158336a1c7a1ebd507db14ab492831581904268.jpg',
'메론의 달콤함과 상쾌함을 더해 특유의 풍미를 살린 메론아밀크쉐이크','덜 달게',0,'초코칩 추가',500,'휘핑추가',1500);

insert into foodmenu(fseq, rseq, fname, fprice, fimage, fcontent, fside1, fsideprice1, fside2, fsideprice2, fside3, fsideprice3)
values(foodmenu_seq.nextVal, 48, '시나몬 밀크쉐이크',7000,'_9963b65ba51c663f33a33b74325f18e61581904335.jpg',
'3대 향신료 중 하나인 시나몬을 블랜딩하여 풍미를 더한 시나몬밀크쉐이크','덜 달게',0,'초코칩 추가',500,'휘핑추가',1500);



-- qna 등록
insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'푸바는 어떤 서비스인가요?','저희 회사는 서울에 있는 음식점과 고객 사이에 친화적인 음식배달 서비스를 제공하는 회사 입니다. 
저희는 고객분들이 웹을 통하여 음식 주문을 하실수 있도록 서비스를 제공하고 있습니다. 
바쁜 고객님이 안락한 거실 및 직장에서 고객님께서 선호하시는 음식점의 음식을 즐기실수 있으시게끔 도와드리겠습니다. 
모든 메뉴의 가격은 레스토랑 측에서 결정한 값임을 알려드립니다.');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'푸바의 운영 시간은 어떻게 되나요?',
'저희 푸바는 월요일 - 일요일 12 AM - 24 PM 24시간 운영하며. 휴일에도 영업 합니다. (연중무휴)');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'푸바 딜리버리 앱이 있나요?',
'저희 푸바의 딜리버리앱은 아직 개발중에 있으며, 빠른시일내로 출시하도록 하겠습니다.');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'어떻게 주문 하나요?',
'저희의 목표는 저희의 웹사이트를 가능한 최대로 사용자와 친화적으로 만드는것 입니다. 다음의 디바이스로 주문을 하실수 있습니다: 데스크탑, 노트북, 아이패드, 아이폰, 안드로이드폰. 
저희는 계정을 생성하기 위하여 고객님들이 자신의 아이디를 생성하는것을 권장합니다. 
일단 회원가입을 하시고나면 고객님이 원하시는만큼 주소를 링크하실수 있습니다. 
그 이후로는 매우 간단합니다: 1. 주소 선택, 2. 음식점 선택, 3. 음식 선택, 4. 주문내역 확인 5. 휴식을 취하시면 되십니다.');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'제 배달 팁은 얼마인가요?',
'배달 팁은 가게마다 상이하며, 가게가 책정한 배달팁으로 배달팁이 책정됩니다.');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'얼마나 걸릴까요?',
'배달거리와 배달 음식의 종류에 따라 다릅니다만, 저희의 목표는 가능한 한 신선한 음식을 고객님께 전달해 드리는것 입니다.
 정상적인 상황 (비가 안올때나 충분한 인력의 배달사원들이 있을때), 최소 배달지역에서 주문이 약 40-60 분정도 소요됩니다.');


insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'팁이 있나요?',
'아니요, 모든 주문은 현장결제로 이루어집니다.');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'서비스 문제는 어디에 제기하나요?',
'주문과 관련된 문의사항이 있는 경우에는 푸마의 고객센터
 혹은 insta계정의 @foodbyte 디엠 으로 문의해주시기 바랍니다.');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'음식점과 같은 가격인가요?',
'저희는 파트너 음식점측에 저희 웹사이트에 올라가게 될 메뉴 가격을 음식점의 가격과 동일하게 책정하도록 요청합니다.
 음식점의 가격과 저희의 가격이 다르다면 그것 또한 음식점에서 책정한 가격이오니 이해 부탁 드립니다 .');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'회원가입은 어떻게 하나요?',
'회원가입은 아이디를 생성하여 사입 가능합니다.');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'주문했던 가게에서 계속 연락이 와요',
'음식배달을 위해 가게로 전달된 주문정보는 개인정보보호법에 따라 배달완료 후 파기하는 것이 원칙입니다.
배달 완료 후 전화, 문자, 메신저 등 연락이 지속된다면 푸바 고객센터로 신고해주세요');

insert into qna(qseq,subject,content)
values(qna_seq.nextVal,'가게와 갈등이 있었어요',
'위협적인 가게의 태도에 공포심을 느꼈거나 배달 과정 중 불미스러운 일이 발생했다면 주저하지 말고 고객센터로 신고해주세요');




-- 오더스1 rideyn 0 배달 1 포장 , plasticyn 0 필요 없어요 1 주세요 payment 0 카드 1 현금 result 0 배달중, 1 배달완료	 (기본값0)
insert into orders(oseq,id,rideryn,plasticyn,payment,result,address1,address2,totalprice,phone)
values(orders_seq.nextVal,'abc1234',1,0,1,1,'서울특별시 서대문구','신촌 이젠아카데미 2층 404호', 11000,'010-1234-4321');
insert into order_detail(odseq,oseq,fseq,quantity,sideyn1,sideyn2,sideyn3)
values(order_detail_seq.nextVal,1,242,2,0,0,0);

-- 오더스 2
insert into orders(oseq,id,rideryn,plasticyn,payment,result,address1,address2,totalprice,phone)
values(orders_seq.nextVal,'bsc1234',0,1,1,0,'서울특별시 서대문구','신촌 이젠아카데미 2층 404호', 71000, '010-1234-1234' );
insert into order_detail(odseq,oseq,fseq,quantity,sideyn1,sideyn2,sideyn3)
values(order_detail_seq.nextVal,2,118,1,1,1,0);
insert into order_detail(odseq,oseq,fseq,quantity,sideyn1,sideyn2,sideyn3)
values(order_detail_seq.nextVal,2,119,2,1,0,1);


insert into review(review_seq,id,rseq,star,content,oseq,nick)
values(review_seq_seq.nextVal,'abc1234',48,5,'왈왈왈왈!!',1,'맛있으면 짖는 개');