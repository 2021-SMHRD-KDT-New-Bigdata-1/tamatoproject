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
    `reservation_num`   INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '���� ����', 
    `reservation_date`  DATETIME        NOT NULL    COMMENT '���� ��¥', 
    `member_id`         VARCHAR(100)     NOT NULL    COMMENT '��û�� ���̵�', 
    `proposer_name`     VARCHAR(20)     NOT NULL    COMMENT '��û�� �̸�', 
    `proposer_email`    VARCHAR(50)     NOT NULL    COMMENT '��û�� �̸���', 
    `proposer_number`   INT             NOT NULL    COMMENT '��û�� ��ȣ', 
    `proposer_address`  VARCHAR(150)    NOT NULL    COMMENT '��û�� �ּ�', 
    `land_type`         VARCHAR(50)     NOT NULL    COMMENT '���� ����', 
    `area`              INT             NOT NULL    COMMENT '����', 
    `pesticide`         VARCHAR(50)     NOT NULL    COMMENT '��� ����', 
    `pest_name`         VARCHAR(150)    NOT NULL    COMMENT '����', 
    `crop_name`         VARCHAR(20)     NOT NULL    COMMENT '�۹���', 
     PRIMARY KEY (reservation_num)
);

ALTER TABLE drone_preventions COMMENT '��� ���� ����';

ALTER TABLE drone_preventions
    ADD CONSTRAINT FK_drone_preventions_member_id_members_member_id FOREIGN KEY (member_id)
        REFERENCES members (member_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
        
        ALTER TABLE drone_preventions MODIFY member_id varchar(100)