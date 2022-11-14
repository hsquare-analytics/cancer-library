DROP TABLE IF EXISTS GSTR.GSTR_DIAG_INF;
DROP TABLE IF EXISTS GSTR.GSTR_DIAG_INF_UPDATED;

CREATE TABLE IF NOT EXISTS GSTR.GSTR_DIAG_INF (
                               hosp_cd varchar(20) NOT NULL, -- 병원코드
                               pt_no varchar(10) NOT NULL, -- 환자대체번호
                               diag_rgst_ymd varchar(8) NOT NULL, -- 진단등록일자
                               diag_rgst_seq numeric(3) NOT NULL, -- 진단등록순번
                               diag_kncd varchar(20) NULL, -- 진단종류코드
                               diag_knnm varchar(200) NULL, -- 진단종류명
                               diag_cd varchar(20) NULL, -- 진단코드
                               diag_nm varchar(200) NULL, -- 진단명
                               diag_kcd_cd varchar(20) NULL, -- 진단KCD코드
                               diag_kcd_nm varchar(200) NULL, -- 진단KCD명
                               diag_smct_cd varchar(200) NULL, -- 진단SNOMEDCT코드
                               diag_smct_nm varchar(1000) NULL, -- 진단SNOMEDCT명
                               crtn_dt timestamp NOT NULL, -- 생성일시
                               PACT_ID varchar(50) null,				-- PACT_ID
                               idx varchar(20) NULL, -- UI용 시퀀스
                               CONSTRAINT gstr_diag_inf_pk PRIMARY KEY (hosp_cd, pt_no, diag_rgst_ymd, diag_rgst_seq)
);

CREATE TABLE IF NOT EXISTS GSTR.GSTR_DIAG_INF_UPDATED (
                               hosp_cd varchar(20) NOT NULL, -- 병원코드
                               pt_no varchar(10) NOT NULL, -- 환자대체번호
                               diag_rgst_ymd varchar(8) NOT NULL, -- 진단등록일자
                               diag_rgst_seq numeric(3) NOT NULL, -- 진단등록순번
                               diag_kncd varchar(20) NULL, -- 진단종류코드
                               diag_knnm varchar(200) NULL, -- 진단종류명
                               diag_cd varchar(20) NULL, -- 진단코드
                               diag_nm varchar(200) NULL, -- 진단명
                               diag_kcd_cd varchar(20) NULL, -- 진단KCD코드
                               diag_kcd_nm varchar(200) NULL, -- 진단KCD명
                               diag_smct_cd varchar(200) NULL, -- 진단SNOMEDCT코드
                               diag_smct_nm varchar(1000) NULL, -- 진단SNOMEDCT명
                               crtn_dt timestamp NOT NULL, -- 생성일시
                               PACT_ID varchar(50) null,				-- PACT_ID
                               idx varchar(20) NULL, -- UI용 시퀀스
                               CREATED_BY         CHARACTER VARYING(50),
                               CREATED_DATE       TIMESTAMP,
                               LAST_MODIFIED_BY   CHARACTER VARYING(50),
                               LAST_MODIFIED_DATE TIMESTAMP,
                               STATUS             VARCHAR(50),
                                   CONSTRAINT gstr_diag_inf_updated_pk PRIMARY KEY (hosp_cd, pt_no, diag_rgst_ymd, diag_rgst_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (5000, 'GSTR.GSTR_DIAG_INF', '위암_진단_정보', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (5000, null, '위암_진단_정보');

insert into ph_item (id, title, activated, category_id, created_by) values (5001, 'hosp_cd', true, 5000, 'system');-- 병원코드
insert into ph_item_property (item_id, caption) values (5001, '병원코드');
insert into ph_item_attribute (item_id, data_type) values (5001, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (5002, 'pt_no', true, 5000, 'system');-- 환자대체번호
insert into ph_item_property (item_id, caption) values (5002, '환자대체번호');

insert into ph_item (id, title, activated, category_id, created_by) values (5003, 'diag_rgst_ymd', true, 5000, 'system');-- 진단등록일자
insert into ph_item_property (item_id, caption) values (5003, '진단등록일자');

insert into ph_item (id, title, activated, category_id, created_by) values (5004, 'diag_rgst_seq', true, 5000, 'system');-- 진단등록순번
insert into ph_item_property (item_id, caption) values (5004, '진단등록순번');

insert into ph_item (id, title, activated, category_id, created_by) values (5005, 'diag_kncd', true, 5000, 'system');-- 진단종류코드
insert into ph_item_property (item_id, caption) values (5005, '진단종류코드');
insert into ph_item_attribute (item_id, data_type) values (5005, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (5006, 'diag_knnm', true, 5000, 'system');-- 진단종류명
insert into ph_item_property (item_id, caption) values (5006, '진단종류명');

insert into ph_item (id, title, activated, category_id, created_by) values (5007, 'diag_cd', true, 5000, 'system');-- 진단코드
insert into ph_item_property (item_id, caption) values (5007, '진단코드');
insert into ph_item_attribute (item_id, data_type) values (5007, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (5008, 'diag_nm', true, 5000, 'system');-- 진단명
insert into ph_item_property (item_id, caption) values (5008, '진단명');

insert into ph_item (id, title, activated, category_id, created_by) values (5009, 'diag_kcd_cd', true, 5000, 'system');-- 진단KCD코드
insert into ph_item_property (item_id, caption) values (5009, '진단KCD코드');
insert into ph_item_attribute (item_id, data_type) values (5009, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (5010, 'diag_kcd_nm', true, 5000, 'system');-- 진단KCD명
insert into ph_item_property (item_id, caption) values (5010, '진단KCD명');

insert into ph_item (id, title, activated, category_id, created_by) values (5011, 'diag_smct_cd', true, 5000, 'system');-- 진단SNOMEDCT코드
insert into ph_item_property (item_id, caption) values (5011, '진단SNOMEDCT코드');
insert into ph_item_attribute (item_id, data_type) values (5011, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (5012, 'diag_smct_nm', true, 5000, 'system');-- 진단SNOMEDCT명
insert into ph_item_property (item_id, caption) values (5012, '진단SNOMEDCT명');

insert into ph_item (id, title, activated, category_id, created_by) values (5013, 'crtn_dt', true, 5000, 'system');-- 생성일시
insert into ph_item_property (item_id, caption) values (5013, '생성일시');

insert into ph_item (id, title, activated, category_id, created_by) values (5014, 'PACT_ID', true, 5000, 'system');-- PACT_ID
insert into ph_item_property (item_id, caption) values (5014, 'PACT_ID');
