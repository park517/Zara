-------------------------member 테이블-------------------------------

CREATE TABLE member (
	mem_id	varchar2(30)		NOT NULL,
	mem_password	varchar2(30)		NOT NULL,
	mem_name	varchar2(10)		NOT NULL,
	mem_tel	varchar2(30)		NOT NULL,
	mem_email	varchar2(30)		NOT NULL,
	mem_address	varchar2(50)		NOT NULL,
	gender	varchar2(10)		NOT NULL,
	create_at	date		NOT NULL,
	update_at	date		NULL,
	last_login	date		NULL,
	delete_flag	char(1)	DEFAULT 'N'	NULL,
	delete_at	date		NULL,
	mem_point 	int		NULL
);

-- member 테이블 기본 키 
ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	mem_id
);

---------------------------------------------------------------------






---------------------------------board 테이블------------------------
CREATE TABLE board (
   bno   int   NOT NULL,
   mem_id   varchar2(30)   NOT NULL,
   title   varchar2(50)   NOT NULL,
   content   varchar2(500)   NOT NULL,
   category   varchar2(20)   NOT NULL,
   create_at   date   NOT NULL,
   update_at   date   NULL,
   hit   int   NULL,
    constraint board_fk foreign key (mem_id) references member (mem_id) on delete cascade
);

--board 테이블 기본키
ALTER TABLE board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
   bno
);

--board 시퀀스
create sequence seq_board;

--------------------------------------------------------------




----------------comment (댓글 테이블) -------------------------------------
CREATE TABLE comments (
   cno   int   NOT NULL,
   bno   int   NOT NULL,
   writer   varchar2(20)   NOT NULL,
   content   varchar2(500)   NOT NULL,
   create_at   date   NOT NULL,
   update_at   date   NULL,
    constraint comments_fk foreign key (bno) references board (bno) on delete cascade
);

--comment 테이블 기본키
ALTER TABLE comments ADD CONSTRAINT PK_COMMENT PRIMARY KEY (
   cno
);

--comment 시퀀스
create sequence seq_comment;

-----------------------------------------------------------------






------------------------ 게시판 파일 테이블----------------------------

CREATE TABLE board_file (
   fid   int   NOT NULL,
   bno   int   NOT NULL,
   file_name   varchar2(100)   NOT NULL,
   file_real_name   varchar2(100)   NOT NULL,
   file_path   varchar2(50)   NOT NULL,
   file_create_at   date   NOT NULL,
    constraint board_file_fk foreign key (bno) references board (bno) on delete cascade
);

--파일테이블 기본 키
ALTER TABLE board_file ADD CONSTRAINT PK_BOARD_FILE PRIMARY KEY (
   fid
);

--file 시퀀스
create sequence seq_board_file;
select count(*) from member where mem_id = '123' ;
