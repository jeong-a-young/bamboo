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
	post_title VARCHAR2 (100),
	post_set CHAR (1),
	post_type VARCHAR2 (35),
	post_contents VARCHAR2 (3000),
	post_time DATE,
	post_photo VARCHAR2 (150)
);

CREATE TABLE post_comment (
	post_id NUMBER (10),
	comment_id NUMBER (10) PRIMARY KEY,
	comment_writer VARCHAR2 (20),
	comment_set CHAR (1),
	comment_contents VARCHAR2 (3000),
	comment_time DATE
);

CREATE SEQUENCE post_seq NOCACHE;
CREATE SEQUENCE post_comment_seq NOCACHE;

INSERT INTO member VALUES ('admin', '1234', '관리자', 'ys2220205@y-y.hs.kr', 'S');
INSERT INTO post VALUES (3, 'admin', 'test3', 'a', '자유게시판','test', '2022-11-14', 'url');

DROP TABLE post_comment;
DROP SEQUENCE post_comment_seq;

SELECT * FROM member;
SELECT * FROM post;
SELECT * FROM post_comment;

DELETE FROM member WHERE id='3';
DELETE FROM post;