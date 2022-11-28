--작업일시: 221115 am10:32

DROP TABLE IF EXISTS GSCN.GSCN_DIAG_INF;
DROP TABLE IF EXISTS GSCN.GSCN_DIAG_INF_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_DIAG_INF (
                               hosp_cd varchar(20) NOT NULL, -- 병원코드
                               pt_no varchar(10) NOT NULL, -- 환자대체번호
                               diag_rgst_ymd varchar(8) NOT NULL, -- 진단등록일자
                               diag_rgst_seq numeric(3) NOT NULL, -- 진단등록순번
                               diag_kncd varchar(20) NULL, -- 위암진단종류코드
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
                               CONSTRAINT gscn_diag_inf_pk PRIMARY KEY (hosp_cd, pt_no, diag_rgst_ymd, diag_rgst_seq)
);


INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9400, 'GSCN.GSCN_DIAG_INF', '04.위암_진단_정보', true, 4, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (9400, null, '04.위암_진단_정보');

insert into ph_item (id, title, category_id, created_by, order_no) values (9401, 'hosp_cd', 9400, 'system', 9401);
insert into ph_item_attribute (item_id, caption, required) values (9401, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9402, 'pt_no', 9400, 'system', 9402);
insert into ph_item_attribute (item_id, caption) values (9402, '환자대체번호');
insert into ph_item_property (item_id, visible) values (9402, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9403, 'diag_rgst_ymd', 9400, 'system', 9403);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (9403, '진단등록일자', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9404, 'diag_rgst_seq', 9400, 'system', 9404);
insert into ph_item_attribute (item_id, caption, required) values (9404, '진단등록순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9405, 'diag_kncd', 9400, 'system', 9405, 20100);
insert into ph_item_attribute (item_id, caption, data_type) values (9405, '위암진단종류코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9406, 'diag_knnm', 9400, 'system', 9406);
insert into ph_item_attribute (item_id, caption) values (9406, '진단종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9407, 'diag_cd', 9400, 'system', 9407);
insert into ph_item_attribute (item_id, caption) values (9407, '진단코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9408, 'diag_nm', 9400, 'system', 9408);
insert into ph_item_attribute (item_id, caption) values (9408, '진단명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9409, 'diag_kcd_cd', 9400, 'system', 9409);
insert into ph_item_attribute (item_id, caption) values (9409, '진단KCD코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9410, 'diag_kcd_nm', 9400, 'system', 9410);
insert into ph_item_attribute (item_id, caption) values (9410, '진단KCD명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9411, 'diag_smct_cd', 9400, 'system', 9411);
insert into ph_item_attribute (item_id, caption) values (9411, '진단SNOMEDCT코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9412, 'diag_smct_nm', 9400, 'system', 9412);
insert into ph_item_attribute (item_id, caption) values (9412, '진단SNOMEDCT명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9413, 'crtn_dt', 9400, 'system', 9413);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9413, '생성일시', 'yyyy-MM-dd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9414, 'PACT_ID', 9400, 'system', 9414);
-- insert into ph_item_attribute (item_id, caption) values (9414, 'UI용 PACT_ID');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9415, 'idx', 9400, 'system', 9415);
-- insert into ph_item_attribute (item_id, caption) values (9415, 'UI용 시퀀스');
