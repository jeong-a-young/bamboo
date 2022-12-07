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
	post_type CHAR (1),
	post_category VARCHAR2 (35),
	post_content VARCHAR2 (3000),
	post_date DATE,
	post_image VARCHAR2 (150)
);

CREATE TABLE reply (
	post_id NUMBER (10),
	comment_id NUMBER (10) PRIMARY KEY,
	comment_writer VARCHAR2 (20),
	comment_type CHAR (1),
	comment_content VARCHAR2 (3000),
	comment_date DATE,
	CONSTRAINT reply_post_id_fk FOREIGN KEY (post_id) REFERENCES post (post_id)
);

CREATE SEQUENCE post_seq NOCACHE;
CREATE SEQUENCE reply_seq NOCACHE;

SELECT * FROM member;
SELECT * FROM post;
SELECT * FROM reply;

INSERT INTO member VALUES ('admin', '1234', '관리자', 'ys2220205@y-y.hs.kr', 'S');