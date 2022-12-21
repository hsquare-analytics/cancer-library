DROP TABLE IF EXISTS GSCN.GSCN_EXAM_MLPT;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_MLPT_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_MLPT (
    hosp_cd varchar(20) NOT NULL, -- 병원코드
    pt_no varchar(10) NOT NULL, -- 환자대체번호
    mlem_ymd timestamp NOT NULL, -- 분자병리검사일자
    mlem_seq numeric(3) NOT NULL, -- 분자병리검사순번
    mlpt_read_ymd timestamp NULL, -- 분자병리판독일자
    mlem_cd varchar(20) NULL, -- 분자병리검사코드
    mlem_nm varchar(200) NULL, -- 분자병리검사명
    mlem_kncd varchar(20) NULL, -- 분자병리검사종류코드
    mlem_knnm varchar(200) NULL, -- 분자병리검사종류명
    mlem_opn_cd varchar(20) NULL, -- 분자병리검사소견코드
    mlem_opn_nm varchar(200) NULL, -- 분자병리검사소견명
    mlem_rslt_cont varchar(200) NULL, -- 분자병리검사결과내용
    mlem_rslt_unit_cont varchar(200) NULL, -- 분자병리검사결과단위내용
    crtn_dt timestamp NOT NULL, -- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    exm_no varchar(50) NULL, 				-- UI용 검사번호
    pact_id varchar(50) null,				-- UI용 PACT_ID
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    CONSTRAINT gscn_exam_mlpt_pk PRIMARY KEY (hosp_cd, pt_no, mlem_ymd, mlem_seq)
    );

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (10000, 'GSCN.GSCN_EXAM_MLPT', '10.위암_검사_분자병리', true, 10, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (10000, 'mlem_ymd', '10.위암_검사_분자병리');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (10001, 'hosp_cd', 10000, 'system', 10001);
-- insert into ph_item_attribute (item_id, caption, required) values (10001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (10002, 'pt_no', 10000, 'system', 10002);
insert into ph_item_attribute (item_id, caption) values (10002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (10002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (10003, 'mlem_ymd', 10000, 'system', 10003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (10003, '분자병리검사일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (10004, 'mlem_seq', 10000, 'system', 10004);
insert into ph_item_attribute (item_id, caption, required) values (10004, '분자병리검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (10005, 'mlpt_read_ymd', 10000, 'system', 10005);
insert into ph_item_attribute (item_id, caption, format, data_type) values (10005, '분자병리판독일자', 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (10006, 'mlem_cd', 10000, 'system', 10006);
insert into ph_item_attribute (item_id, caption) values (10006, '분자병리검사코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (10007, 'mlem_nm', 10000, 'system', 10007);
insert into ph_item_attribute (item_id, caption) values (10007, '분자병리검사명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (10008, 'mlem_kncd', 10000, 'system', 10008, 30230);
insert into ph_item_attribute (item_id, caption, data_type) values (10008, '분자병리검사종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (10008, 'mlem_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (10009, 'mlem_knnm', 10000, 'system', 10009);
-- insert into ph_item_attribute (item_id, caption) values (10009, '분자병리검사종류명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (10010, 'mlem_opn_cd', 10000, 'system', 10010, 30220);
insert into ph_item_attribute (item_id, caption, data_type) values (10010, '분자병리검사소견코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (10010, 'mlem_opn_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (10011, 'mlem_opn_nm', 10000, 'system', 10011);
-- insert into ph_item_attribute (item_id, caption) values (10011, '분자병리검사소견명');

insert into ph_item (id, title, category_id, created_by, order_no) values (10012, 'mlem_rslt_cont', 10000, 'system', 10012);
insert into ph_item_attribute (item_id, caption) values (10012, '분자병리검사결과내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (10013, 'mlem_rslt_unit_cont', 10000, 'system', 10013);
insert into ph_item_attribute (item_id, caption) values (10013, '분자병리검사결과단위내용');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (10014, 'crtn_dt', 10000, 'system', 10014);
-- insert into ph_item_attribute (item_id, caption, format, data_type) values (10014, '생성일시', 'yyyyMMdd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (10015, 'idx', 10000, 'system', 10015);
-- insert into ph_item_attribute (item_id, caption) values (10015, 'UI용 시퀀스');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (10016, 'exm_no', 10000, 'system', 10016);
-- insert into ph_item_attribute (item_id, caption) values (10016, 'UI용 검사번호');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (10017, 'pact_id', 10000, 'system', 10017);
-- insert into ph_item_attribute (item_id, caption) values (10017, 'UI용 PACT_ID');
insert into ph_item (id, title, category_id, created_by, order_no) values (10014, 'sort_seq', 10000, 'system', 5);
insert into ph_item_attribute (item_id, caption) values (10014, '정렬순번');
