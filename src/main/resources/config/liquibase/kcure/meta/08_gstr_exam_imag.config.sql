DROP TABLE IF EXISTS GSTR.GSTR_EXAM_IMAG;
DROP TABLE IF EXISTS GSTR.GSTR_EXAM_IMAG_UPDATED;

CREATE TABLE IF NOT EXISTS GSTR.GSTR_EXAM_IMAG (
    hosp_cd varchar(20) NOT NULL, 			-- 병원코드
    pt_no varchar(10) NOT NULL, 			-- 환자대체번호
    imex_ymd timestamp NOT NULL, 			-- 영상검사일자
    imex_seq numeric(3) NOT NULL, 			-- 영상검사순번
    imex_kncd varchar(20) NULL, 			-- 영상검사종류코드
    imex_knnm varchar(200) NULL, 			-- 영상검사종류명
    imex_cd varchar(20) NULL, 				-- 영상검사코드
    imex_nm varchar(200) NULL, 				-- 영상검사명
    imex_edi_cd varchar(20) NULL,	 		-- 영상검사EDI코드
    imex_edi_nm varchar(200) NULL, 			-- 영상검사EDI명
    imex_smct_cd varchar(200) NULL, 		-- 영상검사SNOMEDCT코드
    imex_smct_nm varchar(1000) NULL, 		-- 영상검사SNOMEDCT명
    imex_rslt_cont varchar(4000) NULL, 		-- 영상검사결과내용
    crtn_dt timestamp NOT NULL, 			-- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    pact_id varchar(50) null,				-- PACT_ID
    CONSTRAINT gstr_exam_imag_pk PRIMARY KEY (hosp_cd, pt_no, imex_ymd, imex_seq)
    );

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9800, 'GSTR.GSTR_EXAM_IMAG', '08.위암_검사_영상', true, 6, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (9800, null, '08.위암_검사_영상');

insert into ph_item (id, title, category_id, created_by, order_no) values (9801, 'hosp_cd', 9800, 'system', 9801);
insert into ph_item_property (item_id, caption, required) values (9801, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9802, 'pt_no', 9800, 'system', 9802);
insert into ph_item_property (item_id, caption, visible) values (9802, '환자대체번호', false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9803, 'imex_ymd', 9800, 'system', 9803);
insert into ph_item_property (item_id, caption, required, format) values (9803, '영상검사일자', true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9803, 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9804, 'imex_seq', 9800, 'system', 9804);
insert into ph_item_property (item_id, caption, required) values (9804, '영상검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9805, 'imex_kncd', 9800, 'system', 9805, 30410);
insert into ph_item_property (item_id, caption) values (9805, '영상검사종류코드');
insert into ph_item_attribute (item_id, data_type) values (9805, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9806, 'imex_knnm', 9800, 'system', 9806);
insert into ph_item_property (item_id, caption) values (9806, '영상검사종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9807, 'imex_cd', 9800, 'system', 9807);
insert into ph_item_property (item_id, caption) values (9807, '영상검사코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9808, 'imex_nm', 9800, 'system', 9808);
insert into ph_item_property (item_id, caption) values (9808, '영상검사명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9809, 'imex_edi_cd', 9800, 'system', 9809);
insert into ph_item_property (item_id, caption) values (9809, '영상검사EDI코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9810, 'imex_edi_nm', 9800, 'system', 9810);
insert into ph_item_property (item_id, caption) values (9810, '영상검사EDI명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9811, 'imex_smct_cd', 9800, 'system', 9811);
insert into ph_item_property (item_id, caption) values (9811, '영상검사SNOMEDCT코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9812, 'imex_smct_nm', 9800, 'system', 9812);
insert into ph_item_property (item_id, caption) values (9812, '영상검사SNOMEDCT명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9813, 'imex_rslt_cont', 9800, 'system', 9813);
insert into ph_item_property (item_id, caption) values (9813, '영상검사결과내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (9814, 'crtn_dt', 9800, 'system', 9814);
insert into ph_item_property (item_id, caption, required) values (9814, '생성일시', true);
insert into ph_item_attribute (item_id, data_type) values (9814, 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9815, 'idx', 9800, 'system', 9815);
insert into ph_item_property (item_id, caption) values (9815, 'UI용 시퀀스');

insert into ph_item (id, title, category_id, created_by, order_no) values (9816, 'pact_id', 9800, 'system', 9816);
insert into ph_item_property (item_id, caption) values (9816, 'UI용 PACT_ID');


