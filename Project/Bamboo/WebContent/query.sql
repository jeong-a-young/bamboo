CREATE TABLE member (
	id VARCHAR2 (20) PRIMARY KEY,
	pwd VARCHAR2 (30),
	name VARCHAR2 (15),
	email VARCHAR2 (40) UNIQUE
);

INSERT INTO member VALUES ('admin', '1234', '관리자', 'ys2220205@y-y.hs.kr');

DROP TABLE member;

SELECT * FROM member;

DELETE FROM member WHERE id='a12';