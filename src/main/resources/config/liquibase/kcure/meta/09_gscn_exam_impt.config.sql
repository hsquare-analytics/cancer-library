DROP TABLE IF EXISTS GSCN.GSCN_EXAM_IMPT;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_IMPT_updated;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_IMPT (
    hosp_cd varchar(20) NOT NULL, -- 병원코드
    pt_no varchar(10) NOT NULL, -- 환자대체번호
    imem_ymd timestamp NOT NULL, -- 면역병리검사일자
    imem_seq numeric(3) NOT NULL, -- 면역병리검사순번
    impt_read_ymd timestamp NULL, -- 면역병리판독일자
    imem_cd varchar(20) NULL, -- 면역병리검사코드
    imem_nm varchar(200) NULL, -- 면역병리검사명
    imem_kncd varchar(20) NULL, -- 면역병리검사종류코드
    imem_knnm varchar(200) NULL, -- 면역병리검사종류명
    imem_opn_cd varchar(20) NULL, -- 면역병리검사소견코드
    imem_opn_nm varchar(200) NULL, -- 면역병리검사소견명
    imem_rslt_cont varchar(200) NULL, -- 면역병리검사결과내용
    imem_rslt_unit_cd varchar(20) NULL, -- 면역병리검사결과단위코드
    imem_rslt_unit_nm varchar(200) NULL, -- 면역병리검사결과단위명
    crtn_dt timestamp NOT NULL, -- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    exm_no varchar(50) NULL, 				-- UI용 검사번호
    pact_id varchar(50) null,				-- UI용 PACT_ID
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    CONSTRAINT gscn_exam_impt_pk PRIMARY KEY (hosp_cd, pt_no, imem_ymd, imem_seq)
    );

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9900, 'GSCN.GSCN_EXAM_IMPT', '09.위암_검사_면역병리', true, 9, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (9900, 'imem_ymd', '09.위암_검사_면역병리');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9901, 'hosp_cd', 9900, 'system', 9901);
-- insert into ph_item_attribute (item_id, caption, required) values (9901, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9902, 'pt_no', 9900, 'system', 9902);
insert into ph_item_attribute (item_id, caption) values (9902, '환자대체번호');
insert into ph_item_property (item_id, visible) values (9902, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9903, 'imem_ymd', 9900, 'system', 9903);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (9903, '면역병리검사일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9904, 'imem_seq', 9900, 'system', 9904);
insert into ph_item_attribute (item_id, caption, required) values (9904, '면역병리검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9905, 'impt_read_ymd', 9900, 'system', 9905);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9905, '면역병리판독일자', 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9906, 'imem_cd', 9900, 'system', 9906);
insert into ph_item_attribute (item_id, caption) values (9906, '면역병리검사코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9907, 'imem_nm', 9900, 'system', 9907);
insert into ph_item_attribute (item_id, caption) values (9907, '면역병리검사명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9908, 'imem_kncd', 9900, 'system', 9908, 30170);
insert into ph_item_attribute (item_id, caption, data_type) values (9908, '면역병리검사종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (9908, 'imem_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9909, 'imem_knnm', 9900, 'system', 9909);
-- insert into ph_item_attribute (item_id, caption) values (9909, '면역병리검사종류명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9910, 'imem_opn_cd', 9900, 'system', 9910, 30160);
insert into ph_item_attribute (item_id, caption, data_type) values (9910, '면역병리검사소견코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (9910, 'imem_opn_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9911, 'imem_opn_nm', 9900, 'system', 9911);
-- insert into ph_item_attribute (item_id, caption) values (9911, '면역병리검사소견명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9912, 'imem_rslt_cont', 9900, 'system', 9912);
insert into ph_item_attribute (item_id, caption) values (9912, '면역병리검사결과내용');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9913, 'imem_rslt_unit_cd', 9900, 'system', 9913, 30140);
insert into ph_item_attribute (item_id, caption, data_type) values (9913, '면역병리검사결과단위코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (9913, 'imem_rslt_unit_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9914, 'imem_rslt_unit_nm', 9900, 'system', 9914);
-- insert into ph_item_attribute (item_id, caption) values (9914, '면역병리검사결과단위명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9915, 'crtn_dt', 9900, 'system', 9915);
-- insert into ph_item_attribute (item_id, caption, format, data_type) values (9915, '생성일시', 'yyyyMMdd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9916, 'idx', 9900, 'system', 9916);
-- insert into ph_item_attribute (item_id, caption) values (9916, 'UI용 시퀀스');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9917, 'exm_no', 9900, 'system', 9917);
-- insert into ph_item_attribute (item_id, caption) values (9917, 'UI용 검사번호');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9918, 'pact_id', 9900, 'system', 9918);
-- insert into ph_item_attribute (item_id, caption) values (9918, 'UI용 PACT_ID');
insert into ph_item (id, title, category_id, created_by, order_no) values (9914, 'sort_seq', 9900, 'system', 9914);
insert into ph_item_attribute (item_id, caption) values (9914, '정렬순서');
