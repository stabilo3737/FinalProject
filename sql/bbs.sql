DROP TABLE BBS;

CREATE TABLE BBS
(
    BBS_ID    NUMBER(10) NOT NULL,
    MANAGEMENT_ID    NUMBER(10) NOT NULL,
    TITLE    VARCHAR2(150) NOT NULL,
    CODE_ID    VARCHAR2(6) NOT NULL,
    NICKNAME    VARCHAR2(36) NOT NULL,
    BCONTENT    CLOB NOT NULL,
    STATUS    CHAR(1) NOT NULL,
    HIT    NUMBER(10) NOT NULL,
    GOOD    NUMBER(5) DEFAULT 0 NOT NULL,
    BAD    NUMBER(5) DEFAULT 0 NOT NULL,
    PLAN_ID    NUMBER(20),
    CDATE    TIMESTAMP DEFAULT SYSDATE NOT NULL,
    UDATE    TIMESTAMP DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN BBS.BBS_ID IS '게시글번호';

COMMENT ON COLUMN BBS.MANAGEMENT_ID IS '내부관리용아이디';

COMMENT ON COLUMN BBS.TITLE IS '제목';

COMMENT ON COLUMN BBS.CODE_ID IS '게시글분류코드';

COMMENT ON COLUMN BBS.NICKNAME IS '작성자이름(별칭)';

COMMENT ON COLUMN BBS.BCONTENT IS '본문내용';

COMMENT ON COLUMN BBS.STATUS IS '게시글 상태';

COMMENT ON COLUMN BBS.HIT IS '조회수';

COMMENT ON COLUMN BBS.GOOD IS '선호';

COMMENT ON COLUMN BBS.BAD IS '비선호';

COMMENT ON COLUMN BBS.PLAN_ID IS '여행일정 아이디';

COMMENT ON COLUMN BBS.CDATE IS '작성일';

COMMENT ON COLUMN BBS.UDATE IS '수정일';

COMMENT ON TABLE BBS IS '게시글';

CREATE UNIQUE INDEX BBS_PK ON BBS
( BBS_ID,MANAGEMENT_ID );

CREATE INDEX BBS_PK_IDX ON BBS (BBS_ID);

ALTER TABLE BBS
ADD CONSTRAINT BBS_PK PRIMARY KEY ( BBS_ID)
USING INDEX BBS_PK_IDX;

ALTER TABLE BBS
ADD CONSTRAINT BBSTB_CODE_ID_FK
FOREIGN KEY (CODE_ID)
REFERENCES CLASS_CD(CODE_ID);

ALTER TABLE BBS
ADD CONSTRAINT BBSTB_MANAGEMENT_ID_FK
FOREIGN KEY (MANAGEMENT_ID)
REFERENCES MEMBER(MANAGEMENT_ID);