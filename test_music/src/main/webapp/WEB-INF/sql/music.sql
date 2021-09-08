-- 음반구매 테이블

DROP TABLE musicuser;
DROP TABLE musiccd;
DROP SEQUENCE musicsales;

-- 회원테이블
CREATE TABLE musicuser
(
   userid   VARCHAR2(20) primary key,
   userpwd  VARCHAR2(20) not null,
   username VARCHAR2(30) not null
);

-- 상품정보 테이블
CREATE TABLE musiccd
(
   cdnum    NUMBER primary key,
   artist   VARCHAR2(100) not null,
   title    VARCHAR2(200) not null,
   price    NUMBER default 0
);


-- 판매정보 테이블
CREATE TABLE musicsales
(
    userid   VARCHAR2(20) not null,
    cdnum    NUMBER REFERENCES musiccd(cdnum),
    quantity NUMBER default 0,
    amount   NUMBER default 0,
    saledate DATE default sysdate
);

insert into musiccd values (1, 'Al Di Meola', 'Morocco Fantasia', 20000);
insert into musiccd values (2, 'Amy Winehouse', 'Back To Black', 10000);
insert into musiccd values (3, 'Dream Theater', 'Images And Words', 15000);
insert into musiccd values (4, 'Nightwish', 'Oceanborn', 13000);
insert into musiccd values (5, 'Metallica', 'Ride The Lightning', 17000);
commit;
