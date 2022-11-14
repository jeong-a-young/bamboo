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
	post_photo VARCHAR2 (50)
);

CREATE SEQUENCE post_seq NOCACHE;

INSERT INTO member VALUES ('admin', '1234', '관리자', 'ys2220205@y-y.hs.kr', 'S');
INSERT INTO post VALUES (3, 'admin', 'test3', 'a', '자유게시판','test', '2022-11-14', 'url');

SELECT * FROM
(SELECT *FROM post ORDER BY post_id DESC)
WHERE ROWNUM= 1

DROP TABLE post;
DROP SEQUENCE post_seq;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'POST_SEQ';
select * from USER_SEQUENCES where sequence_name='POST_SEQ';

SELECT * FROM member;
SELECT * FROM post;

DELETE FROM member WHERE id='3';
DELETE FROM post;