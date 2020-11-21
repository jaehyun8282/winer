create table wmanager(
	mid varchar2(20) primary key,
	mpassword varchar2(30) not null
);

select nvl(max(num),0)+1 from wboard;
select*from  wmanager;
insert into wmanager values ('master', '1234' );
create table wmember(
	id 			varchar2(20) 	primary key,
	password 	varchar2(30) 	not null,
	name 		varchar2(10) 	not null,
	tel 		varchar2(20)	not null,
	addr1 		varchar2(10) 	not null,
	addr2 		varchar2(300) 	not null,
	addr3 		varchar2(300) 	not null,
	email 		varchar2(50) 	not null,
	birthday 	date 			not null,
	reg_date 	date 			not null
);

insert into wmember values('master', '1234','관리자','010-0000-0000','04104','서울 마포구 신촌로 176(대흥동)','603호','k1@k.com','1992-11-21',sysdate);
select*from wmember;
drop table wmember;

create table wboard (
	num number primary key, 
	b_id varchar2(15) references wmember(id),
	subject varchar2(100) not null,
	content varchar2(1000) not null,
	b_image varchar2(50) default 'default.jpg',
	readcount number default 0,
	ref number not null,
	re_step number not null,
	re_level number not null,
	re_date date not null
);
select*from wboard;
delete wboard;
alter table wboard add del varchar2(1);
commit;
drop table wboard;

update wboard set readcount=100 where num=12;

SELECT e.* ,( SELECT name FROM wmember a  WHERE a.id = e.b_id) FROM wboard e ;


select * from (select a.*,rowNum rn from (SELECT e.* ,( SELECT name FROM wmember c  WHERE c.id = e.b_id) as name FROM wboard e	order by ref desc, re_step) a);
			
select * from wboard;
commit;
drop table wboard;
drop table wreplyBoard;

create table wreplyBoard (
	rno number primary key,
	bno number not null references wboard(num),
	replytext varchar2(500) not null,
	-- memberId
	replyer varchar2(20) references wmember(id),
	regdate date not null,
	updatedate date not null,
	del char(1)
);
delete from wreplyboard;
select * from wreplyboard;
insert into wreplyboard values(1,1,'가나다','taeyeon_ss',sysdate,sysdate,'n');

create table wproduct (
	p_id number primary key,
	p_category varchar2(30) not null,
	p_name varchar2(100) not null,
	p_sname varchar2(100) not null,
	p_price number(30) not null,
	p_sale number(30) default 0,
	p_image varchar2(30) default 'nothing.jpg',
	p_info varchar2(4000) not null,
	p_count number(5) not null,
	p_date date not null
);
alter table wproduct drop column p_rate;

select*from wproduct;

ALTER TABLE wproduct MODIFY(p_name varchar2(100));
alter table wproduct 
select * from wproduct;
create table wcart (
	ct_id number primary key,
	p_id number references wproduct(p_id),
	id varchar2(20) references wmember(id),
	ct_count number
);
alter table wcart add ct_del varchar2(1) default 'n';
select * from wcart;
drop table wproduct;

-- wcart에 구매 완료 표시를 위해 ct_del 컬럼 추가!

create table wbuy (
	buy_id number primary key,
	id varchar2(20) references wmember(id), -- 구매자
	p_id number references wproduct(p_id), -- 상품번호
	p_name varchar2(30) not null, 			-- 구매 상품
	p_image varchar2(30) default 'nothing.jpg', -- 상품이미지
	buy_date date not null, 				-- 구매 일자
	delivery_name varchar2(20) not null, 	-- 배송받는 사람
	delivery_addr varchar2(50) not null, 	-- 배송지
	delivery_tel varchar2(20) not null, 	-- 배송지 전화번호
	buy_state varchar2(20) not null 		-- 배송상황
);
select * from wbuy;