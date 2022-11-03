CREATE TABLE member (
	id VARCHAR2 (20) PRIMARY KEY,
	pwd VARCHAR2 (30),
	name VARCHAR2 (15),
	email VARCHAR2 (40) UNIQUE,
	type CHAR (1)
);

CREATE TABLE post (
	post_id NUMBER (10) PRIMARY KEY,
	post_writer VARCHAR2 (4),
	post_title VARCHAR2 (30),
	post_type VARCHAR2 (20),
	post_contents VARCHAR (1000)
);

CREATE SEQUENCE post_seq;

INSERT INTO member VALUES ('admin', '1234', '관리자', 'ys2220205@y-y.hs.kr', 'S');

DROP TABLE member;

SELECT * FROM member;

DELETE FROM member WHERE id='a12';