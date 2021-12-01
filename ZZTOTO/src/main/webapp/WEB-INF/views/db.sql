show tables
desc drone_preventions
drop table drone_preventions
select * from members
select * from drone_preventions;
SET foreign_key_checks = 0;
INSERT INTO members (member_id, member_name, member_joindate, admin_yn) VALUES ('member_id 1', 'member_name 1', NOW(), 'N');
INSERT INTO members (member_id, member_name, member_joindate, admin_yn) VALUES ()

CREATE TABLE drone_preventions
(
    `reservation_num`   INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '예약 순번', 
    `reservation_date`  DATETIME        NOT NULL    COMMENT '예약 날짜', 
    `member_id`         VARCHAR(100)     NOT NULL    COMMENT '신청자 아이디', 
    `proposer_name`     VARCHAR(20)     NOT NULL    COMMENT '신청자 이름', 
    `proposer_email`    VARCHAR(50)     NOT NULL    COMMENT '신청자 이메일', 
    `proposer_number`   INT             NOT NULL    COMMENT '신청자 번호', 
    `proposer_address`  VARCHAR(150)    NOT NULL    COMMENT '신청자 주소', 
    `land_type`         VARCHAR(50)     NOT NULL    COMMENT '논지 종류', 
    `area`              INT             NOT NULL    COMMENT '면적', 
    `pesticide`         VARCHAR(50)     NOT NULL    COMMENT '농약 보유', 
    `pest_name`         VARCHAR(150)    NOT NULL    COMMENT '병명', 
    `crop_name`         VARCHAR(20)     NOT NULL    COMMENT '작물명', 
     PRIMARY KEY (reservation_num)
);

ALTER TABLE drone_preventions COMMENT '드론 방제 예약';

ALTER TABLE drone_preventions
    ADD CONSTRAINT FK_drone_preventions_member_id_members_member_id FOREIGN KEY (member_id)
        REFERENCES members (member_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
        
        ALTER TABLE drone_preventions MODIFY member_id varchar(100)