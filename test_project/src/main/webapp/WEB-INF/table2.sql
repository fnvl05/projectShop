-- 카트
create table cartList(
	cartNum number not null,
	userId varchar2(50) not null,
	itemNum number not null,
	cartStock number not null, -- 카트 수량 -- 
	addDate date default sysdate,
	num number,
	itemName varchar2(50),
	itemPrice number,
	itemImg varchar(200) null,
	money number,
	primary key(cartNum)
);

create sequence cartList_seq;

alter table cartList
add constraint cartList_userId foreign key(userId)
references tbl_member(userId);

alter table cartList
add constraint cartList_itemNum foreign key(itemNum)
references tbl_items(itemNum);

-- 위시리스트
create table wishlist(
	wishNum number not null,
	userId varchar2(50) not null,
	itemNum number not null,
	addDate date default sysdate,
	num number,
	itemName varchar2(50),
	itemPrice number,
	itemImg varchar(200) null,
	primary key(itemNum, userId)
);
create sequence wishlist_seq;

alter table wishlist
add constraint wishlist_userId foreign key(userId)
references tbl_member(userId);

alter table wishlist
add constraint wishlist_itemNum foreign key(itemNum)
references tbl_items(itemNum);