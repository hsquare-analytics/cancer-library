--작업일시: 221115 am10:02

DROP TABLE IF EXISTS GSCN.GSCN_EXAM_HPLI;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_HPLI_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_HPLI (
    hosp_cd           varchar(20) not null,
    pt_no             varchar(10) not null,
    hpli_exam_ymd     timestamp   not null,
    hpli_exam_seq     numeric(3)  not null,
    hpli_exam_mtcd    varchar(20),
    hpli_exam_mtnm    varchar(200),
    hpli_exam_rslt_cd varchar(20),
    hpli_exam_rslt_nm varchar(200),
    crtn_dt           timestamp   not null,
    idx               varchar(100),
    pact_id           varchar(50),
    exrs_cnte         varchar(4000),
    exm_nm            varchar(50),
    exm_no            varchar(50),
    comments          varchar(4000),
    constraint gscn_exam_hpli_pk
    primary key (hosp_cd, pt_no, hpli_exam_ymd, hpli_exam_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (12000, 'GSCN.GSCN_EXAM_HPLI', '12.위암_검사_HPYLORI', true, 12, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (12000, null, '12.위암_검사_HPYLORI');

insert into ph_item (id, title, category_id, created_by, order_no) values (12001, 'hosp_cd', 12000, 'system', 12001);
insert into ph_item_attribute (item_id, caption, required) values (12001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (12002, 'pt_no', 12000, 'system', 12002);
insert into ph_item_attribute (item_id, caption, required) values (12002, '환자대체번호', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (12003, 'hpli_exam_ymd', 12000, 'system', 12003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (12003, 'HPYLORI검사일자', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (12004, 'hpli_exam_seq', 12000, 'system', 12004);
insert into ph_item_attribute (item_id, caption, required) values (12004, 'HPYLORI검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (12005, 'hpli_exam_mtcd', 12000, 'system', 12005, 30090);
insert into ph_item_attribute (item_id, caption, data_type) values (12005, 'HPYLORI검사방법코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (12006, 'hpli_exam_mtnm', 12000, 'system', 12006);
insert into ph_item_attribute (item_id, caption) values (12006, 'HPYLORI검사방법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (12007, 'hpli_exam_rslt_cd', 12000, 'system', 12007, 30080);
insert into ph_item_attribute (item_id, caption, data_type) values (12007, 'HPYLORI검사결과코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (12008, 'hpli_exam_rslt_nm', 12000, 'system', 12008);
insert into ph_item_attribute (item_id, caption) values (12008, 'HPYLORI검사결과명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (12009, 'crtn_dt', 12000, 'system', 12009);
-- insert into ph_item_attribute (item_id, caption) values (12009, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (12010, 'idx', 12000, 'system', 12010);
-- insert into ph_item_attribute (item_id, caption) values (12010, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (12011, 'pact_id', 12000, 'system', 12011);
-- insert into ph_item_attribute (item_id, caption) values (12011, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (12011, 'exrs_cnte', 12000, 'system', 12011);
-- insert into ph_item_attribute (item_id, caption) values (12011, 'ui용 검사결과값');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (12012, 'exm_nm', 12000, 'system', 12012);
-- insert into ph_item_attribute (item_id, caption) values (12012, 'UI용 검사명');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (12013, 'exm_no', 12000, 'system', 12013);
-- insert into ph_item_attribute (item_id, caption) values (12013, 'UI용 검사번호');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (12014, 'comments', 12000, 'system', 12014);
-- insert into ph_item_attribute (item_id, caption) values (12014, 'UI용 코멘트');
