-회원 테이블-
create table tbl_member (
    userId      varchar2(50)    not null,
    userPass    varchar2(100)   not null,
    userName    varchar2(30)    not null,
    userPhon    varchar2(20)    not null,
    userAddr1   varchar2(20)    null,
    userAddr2   varchar2(50)    null,
    userAddr3   varchar2(50)    null,
    regiDate    date            default sysdate,
    verify      number          default 0,
    primary key(userId)
);

-상품 테이블-
create table tbl_items (
    itemNum       number          not null,
    itemName      varchar2(50)    not null,
    cateCode     varchar2(30)    not null,
    itemPrice     number          not null,
    itemCount     number          default 0,
    itemDes       varchar(500)    null,
    itemImg       varchar(200)    null,
    itemDate      date            default sysdate,
    primary key(itemNum)  
);

-카테고리 테이블-
create table goods_category (
	cateLevel	 varchar2(20)	 not null,
    cateName     varchar2(20)    not null,
    cateCode     varchar2(30)    not null,
    cateCodeRef  varchar2(30)    null,
    primary key(cateCode),
    foreign key(cateCodeRef) references goods_category(cateCode)
);

-별도의 테이블 쿼리-
alter table tbl_items add
    constraint goods_category
    foreign key (cateCode)
        references goods_category(cateCode);

<참고>
alter table [ 테이블 이름 ] add
    constraint [ 제약조건 이름 ]
    foreign key ([ 참조할 컬럼 이름 ])
        references [ 참조되는 테이블 이름 ]([ 참조되는 컬럼 이름 ]);

create sequence tbl_member_seq;

<마스터 유저 만들기 (일반유저:0 , 마스터유저:1)> 
update tbl_member set verify=1 where userId='master';

<level 를 이용한 계층 표시>
select cateLevel, cateName, cateCode, cateCodeRef from goods_category
start with cateCodeRef is null connect by prior cateCode = cateCodeRef;

<level1 카테고리 예시>
insert into goods_category values('1', '악세서리', '100', '')
insert into goods_category values('1', '여성의류', '200', '')
insert into goods_category values('1', '남성의류', '300', '')

<level2 카테고리 예시>
insert into goods_category values('2', '반지', '101', '100')
insert into goods_category values('2', '귀걸이', '102', '100')
insert into goods_category values('2', '목걸이', '103', '100')

create sequence tbl_item_seq;

<아이템 목록 리스트>
 select itemNum, itemName, cateCode, itemPrice, itemCount, itemDes, itemImg, itemDate
 from tbl_items
 order by itemNum desc

 <썸네일 칼럼 추가>
 alter table tbl_items add(itemThumbImg varchar2(300));








