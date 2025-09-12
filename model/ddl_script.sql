CREATE TABLE Country 
    ( 
     Country_ID NUMBER (12)  NOT NULL , 
     Name       VARCHAR2 (60) , 
     ISO_Code   VARCHAR2 (3) 
    ) 
;
CREATE UNIQUE INDEX UQ_COUNTRY_ISO_CODE ON Country 
    ( 
     ISO_Code ASC 
    ) 
;

ALTER TABLE Country 
    ADD CONSTRAINT Country_PK PRIMARY KEY ( Country_ID ) ;

CREATE TABLE Course 
    ( 
     Course_ID      NUMBER (12)  NOT NULL , 
     Title          VARCHAR2 (120) , 
     Price          NUMBER (8,2) , 
     Duration_Hours NUMBER (5,1) , 
     Description    CLOB , 
     Created_At     DATE , 
     Status         VARCHAR2 (20) , 
     Currency_ID    NUMBER (12)  NOT NULL , 
     Category_ID    NUMBER (12)  NOT NULL , 
     Trainer_ID     NUMBER (12)  NOT NULL , 
     Language_ID    NUMBER (12)  NOT NULL 
    ) 
;
CREATE INDEX IDX_COURSE_TRAINER_ID ON Course 
    ( 
     Trainer_ID ASC 
    ) 
;
CREATE INDEX IDX_COURSE_CATEGORY_ID ON Course 
    ( 
     Category_ID ASC 
    ) 
;
CREATE INDEX IDX_COURSE_LANGUAGE_ID ON Course 
    ( 
     Language_ID ASC 
    ) 
;
CREATE INDEX IDX_COURSE_CURRENCY_ID ON Course 
    ( 
     Currency_ID ASC 
    ) 
;

ALTER TABLE Course 
    ADD CONSTRAINT Course_PK PRIMARY KEY ( Course_ID ) ;

CREATE TABLE Course_Category 
    ( 
     Category_ID        NUMBER (12)  NOT NULL , 
     Category_Name      VARCHAR2 (80) , 
     Description        VARCHAR2 (255) , 
     Parent_Category_ID NUMBER (12) 
    ) 
;
CREATE INDEX IDX_CAT_PARENT_ID ON Course_Category 
    ( 
     Parent_Category_ID ASC 
    ) 
;

ALTER TABLE Course_Category 
    ADD CONSTRAINT Course_Category_PK PRIMARY KEY ( Category_ID ) ;

CREATE TABLE Course_Schedule 
    ( 
     Schedule_ID NUMBER (12)  NOT NULL , 
     Start_At    TIMESTAMP WITH TIME ZONE , 
     End_At      TIMESTAMP WITH TIME ZONE , 
     Capacity    NUMBER (4) , 
     "Mode"      VARCHAR2 (10) , 
     Course_ID   NUMBER (12)  NOT NULL , 
     Timezone_ID NUMBER (12)  NOT NULL 
    ) 
;
CREATE INDEX IDX_SCHED_COURSE_ID ON Course_Schedule 
    ( 
     Course_ID ASC 
    ) 
;
CREATE INDEX IDX_SCHED_TIMEZONE_ID ON Course_Schedule 
    ( 
     Timezone_ID ASC 
    ) 
;
CREATE INDEX IDX_SCHED_START_AT ON Course_Schedule 
    ( 
     Start_At ASC 
    ) 
;
CREATE UNIQUE INDEX UQ_SCHED_COURSE_START ON Course_Schedule 
    ( 
     Course_ID ASC , 
     Start_At ASC 
    ) 
;

ALTER TABLE Course_Schedule 
    ADD CONSTRAINT Course_Schedule_PK PRIMARY KEY ( Schedule_ID ) ;

CREATE TABLE Currency 
    ( 
     Currency_ID NUMBER (12)  NOT NULL , 
     Code        VARCHAR2 (3) , 
     Name        VARCHAR2 (30) , 
     Symbol      VARCHAR2 (5) 
    ) 
;
CREATE UNIQUE INDEX UQ_CURRENCY_CODE ON Currency 
    ( 
     Code ASC 
    ) 
;

ALTER TABLE Currency 
    ADD CONSTRAINT Currency_PK PRIMARY KEY ( Currency_ID ) ;

CREATE TABLE Language 
    ( 
     Language_ID NUMBER (12)  NOT NULL , 
     Code        VARCHAR2 (10) , 
     Name        VARCHAR2 (60) 
    ) 
;
CREATE UNIQUE INDEX UQ_LANGUAGE_CODE ON Language 
    ( 
     Code ASC 
    ) 
;

ALTER TABLE Language 
    ADD CONSTRAINT Language_PK PRIMARY KEY ( Language_ID ) ;

CREATE TABLE Review 
    ( 
     Review_ID  NUMBER (12)  NOT NULL , 
     "Comment"  VARCHAR2 (1000) , 
     Created_At DATE , 
     Course_ID  NUMBER (12)  NOT NULL , 
     Rating_ID  NUMBER (12)  NOT NULL , 
     Student_ID NUMBER (12)  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX UQ_REVIEW_STUDENT_COURSE ON Review 
    ( 
     Student_ID ASC , 
     Course_ID ASC 
    ) 
;
CREATE INDEX IDX_REVIEW_COURSE_ID ON Review 
    ( 
     Course_ID ASC 
    ) 
;
CREATE INDEX IDX_REVIEW_RATING_ID ON Review 
    ( 
     Rating_ID ASC 
    ) 
;

ALTER TABLE Review 
    ADD CONSTRAINT Review_PK PRIMARY KEY ( Review_ID ) ;

CREATE TABLE Review_Rating 
    ( 
     Rating_ID NUMBER (12)  NOT NULL , 
     Value     NUMBER (1) , 
     label     VARCHAR2 (20) 
    ) 
;
CREATE UNIQUE INDEX UQ_RR_VALUE ON Review_Rating 
    ( 
     Value ASC 
    ) 
;

ALTER TABLE Review_Rating 
    ADD CONSTRAINT Review_Rating_PK PRIMARY KEY ( Rating_ID ) ;

CREATE TABLE Role 
    ( 
     Role_ID    NUMBER (12)  NOT NULL , 
     Role_Name  VARCHAR2 (40) , 
     Created_At DATE 
    ) 
;

COMMENT ON COLUMN Role.Role_ID IS 'Surrogate primary key' 
;

COMMENT ON COLUMN Role.Role_Name IS 'Name of the role (e.g. Student, Trainer)' 
;

COMMENT ON COLUMN Role.Created_At IS 'When the role was created' 
;
CREATE UNIQUE INDEX UQ_ROLE_ROLE_NAME ON Role 
    ( 
     Role_Name ASC 
    ) 
;

ALTER TABLE Role 
    ADD CONSTRAINT Role_PK PRIMARY KEY ( Role_ID ) ;

CREATE TABLE Student 
    ( 
     Student_ID  NUMBER (12)  NOT NULL , 
     User_ID     NUMBER (12) , 
     Credits     NUMBER (10,2) , 
     Language_ID NUMBER (12)  NOT NULL , 
     Country_ID  NUMBER (12)  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX UQ_STUDENT_USER_ID ON Student 
    ( 
     Student_ID ASC 
    ) 
;
CREATE INDEX IDX_STUDENT_LANGUAGE_ID ON Student 
    ( 
     Language_ID ASC 
    ) 
;
CREATE INDEX IDX_STUDENT_COUNTRY_ID ON Student 
    ( 
     Country_ID ASC 
    ) 
;

ALTER TABLE Student 
    ADD CONSTRAINT Student_PK PRIMARY KEY ( Student_ID ) ;

CREATE TABLE Student_Enrollment 
    ( 
     Enrollment_ID NUMBER (12)  NOT NULL , 
     Enrolled_At   DATE , 
     Status        VARCHAR2 (20) , 
     Schedule_ID   NUMBER (12)  NOT NULL , 
     Student_ID    NUMBER (12)  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX UQ_ENR_STUDENT_SCHEDULE ON Student_Enrollment 
    ( 
     Schedule_ID ASC , 
     Student_ID ASC 
    ) 
;

ALTER TABLE Student_Enrollment 
    ADD CONSTRAINT Student_Enrollment_PK PRIMARY KEY ( Enrollment_ID ) ;

CREATE TABLE Timezone 
    ( 
     Timezone_ID NUMBER (12)  NOT NULL , 
     Olson_Name  VARCHAR2 (64) 
    ) 
;
CREATE UNIQUE INDEX UQ_TIMEZONE_OLSON_NAME ON Timezone 
    ( 
     Olson_Name ASC 
    ) 
;

ALTER TABLE Timezone 
    ADD CONSTRAINT Timezone_PK PRIMARY KEY ( Timezone_ID ) ;

CREATE TABLE Trainer 
    ( 
     Trainer_ID NUMBER (12)  NOT NULL , 
     User_ID    NUMBER (12) , 
     Bio        CLOB , 
     Verified   CHAR (1) , 
     Country_ID NUMBER (12)  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX UQ_TRAINER_USER_ID ON Trainer 
    ( 
     User_ID ASC 
    ) 
;
CREATE INDEX IDX_TRAINER_COUNTRY_ID ON Trainer 
    ( 
     Country_ID ASC 
    ) 
;

ALTER TABLE Trainer 
    ADD CONSTRAINT Trainer_PK PRIMARY KEY ( Trainer_ID ) ;

CREATE TABLE "User" 
    ( 
     User_ID        NUMBER (12)  NOT NULL , 
     Email          VARCHAR2 (120) , 
     Password_Hash  VARCHAR2 (128) , 
     Full_Name      VARCHAR2 (100) , 
     "Sign-up_Date" DATE , 
     Role_ID        NUMBER (12)  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX UQ_USER_EMAIL ON "User" 
    ( 
     Email ASC 
    ) 
;
CREATE INDEX IDX_USER_ROLE_ID ON "User" 
    ( 
     Role_ID ASC 
    ) 
;

ALTER TABLE "User" 
    ADD CONSTRAINT User_PK PRIMARY KEY ( User_ID ) ;

ALTER TABLE Course 
    ADD CONSTRAINT Course_Course_Category_FK FOREIGN KEY 
    ( 
     Category_ID
    ) 
    REFERENCES Course_Category 
    ( 
     Category_ID
    ) 
;

ALTER TABLE Course 
    ADD CONSTRAINT Course_Currency_FK FOREIGN KEY 
    ( 
     Currency_ID
    ) 
    REFERENCES Currency 
    ( 
     Currency_ID
    ) 
;

ALTER TABLE Course 
    ADD CONSTRAINT Course_Language_FK FOREIGN KEY 
    ( 
     Language_ID
    ) 
    REFERENCES Language 
    ( 
     Language_ID
    ) 
;

ALTER TABLE Course_Schedule 
    ADD CONSTRAINT Course_Schedule_Course_FK FOREIGN KEY 
    ( 
     Course_ID
    ) 
    REFERENCES Course 
    ( 
     Course_ID
    ) 
;

ALTER TABLE Course_Schedule 
    ADD CONSTRAINT Course_Schedule_Timezone_FK FOREIGN KEY 
    ( 
     Timezone_ID
    ) 
    REFERENCES Timezone 
    ( 
     Timezone_ID
    ) 
;

ALTER TABLE Course 
    ADD CONSTRAINT Course_Trainer_FK FOREIGN KEY 
    ( 
     Trainer_ID
    ) 
    REFERENCES Trainer 
    ( 
     Trainer_ID
    ) 
;

ALTER TABLE Review 
    ADD CONSTRAINT Review_Course_FK FOREIGN KEY 
    ( 
     Course_ID
    ) 
    REFERENCES Course 
    ( 
     Course_ID
    ) 
;

ALTER TABLE Review 
    ADD CONSTRAINT Review_Review_Rating_FK FOREIGN KEY 
    ( 
     Rating_ID
    ) 
    REFERENCES Review_Rating 
    ( 
     Rating_ID
    ) 
;

ALTER TABLE Review 
    ADD CONSTRAINT Review_Student_FK FOREIGN KEY 
    ( 
     Student_ID
    ) 
    REFERENCES Student 
    ( 
     Student_ID
    ) 
;

ALTER TABLE Student 
    ADD CONSTRAINT Student_Country_FK FOREIGN KEY 
    ( 
     Country_ID
    ) 
    REFERENCES Country 
    ( 
     Country_ID
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Student_Enrollment 
    ADD CONSTRAINT Student_Enrollment_Course_Schedule_FK FOREIGN KEY 
    ( 
     Schedule_ID
    ) 
    REFERENCES Course_Schedule 
    ( 
     Schedule_ID
    ) 
;

ALTER TABLE Student_Enrollment 
    ADD CONSTRAINT Student_Enrollment_Student_FK FOREIGN KEY 
    ( 
     Student_ID
    ) 
    REFERENCES Student 
    ( 
     Student_ID
    ) 
;

ALTER TABLE Student 
    ADD CONSTRAINT Student_Language_FK FOREIGN KEY 
    ( 
     Language_ID
    ) 
    REFERENCES Language 
    ( 
     Language_ID
    ) 
;

ALTER TABLE Trainer 
    ADD CONSTRAINT Trainer_Country_FK FOREIGN KEY 
    ( 
     Country_ID
    ) 
    REFERENCES Country 
    ( 
     Country_ID
    ) 
;

ALTER TABLE "User" 
    ADD CONSTRAINT User_Role_FK FOREIGN KEY 
    ( 
     Role_ID
    ) 
    REFERENCES Role 
    ( 
     Role_ID
    ) 
;