CREATE TABLE member (
	id VARCHAR2 (20) PRIMARY KEY,
	pwd VARCHAR2 (30),
	name VARCHAR2 (15),
	email VARCHAR2 (40) UNIQUE,
	type CHAR (1)
);

CREATE TABLE post (
	post_id NUMBER (10) PRIMARY KEY,
	post_writer VARCHAR2 (20),
	post_title VARCHAR2 (30),
	post_set CHAR (1),
	post_type VARCHAR2 (20),
	post_contents VARCHAR2 (3000),
	post_time DATE
);

CREATE SEQUENCE post_seq;

INSERT INTO member VALUES ('admin', '1234', '관리자', 'ys2220205@y-y.hs.kr', 'S');
INSERT INTO post VALUES (1, 'admin', 'test1', 'a', '공지게시판','test', '2022-11-13');

DROP TABLE post;

SELECT * FROM member;
SELECT * FROM post;

DELETE FROM member WHERE id='3';
DELETE FROM post;