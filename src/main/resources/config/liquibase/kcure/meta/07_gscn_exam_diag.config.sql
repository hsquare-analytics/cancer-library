DROP TABLE IF EXISTS GSCN.GSCN_EXAM_DIAG;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_DIAG_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_DIAG (
    hosp_cd varchar(20) NOT NULL, 			-- 병원코드
    pt_no varchar(10) NOT NULL, 			-- 환자대체번호
    cexm_ymd timestamp NOT NULL, 			-- 진단검사일자
    cexm_seq numeric(3) NOT NULL, 			-- 진단검사순번
    cexm_kncd varchar(20) NULL, 			-- 진단검사종류코드
    cexm_knnm varchar(200) NULL, 			-- 진단검사종류명
    cexm_cd varchar(20) NULL, 				-- 진단검사코드
    cexm_nm varchar(200) NULL, 				-- 진단검사명
    cexm_edi_cd varchar(20) NULL, 			-- 진단검사EDI코드
    cexm_edi_nm varchar(200) NULL, 			-- 진단검사EDI명
    cexm_smct_cd varchar(200) NULL, 		-- 진단검사SNOMEDCT코드
    cexm_smct_nm varchar(1000) NULL, 		-- 진단검사SNOMEDCT명
    cexm_loinc_cd varchar(20) NULL, 		-- 진단검사LOINC코드
    cexm_loinc_nm varchar(1000) NULL, 		-- 진단검사LOINC명
    cexm_rslt_cont varchar(4000) NULL, 		-- 진단검사결과내용
    cexm_rslt_unit_cont varchar(200) NULL, 	-- 진단검사결과단위내용
    cexm_nlrg_ref_vl varchar(200) NULL, 	-- 진단검사정상범위참고값
    crtn_dt timestamp NOT NULL, 			-- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    exm_no varchar(20) null,				-- UI용 검체번호
    pact_id varchar(50) null,				-- UI용 PACT_ID
    CONSTRAINT gscn_exam_diag_pk PRIMARY KEY (hosp_cd, pt_no, cexm_ymd, cexm_seq)
    );

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9700, 'GSCN.GSCN_EXAM_DIAG', '07.위암_검사_진단', true, 7, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (9700, null, '07.위암_검사_진단');

insert into ph_item (id, title, category_id, created_by, order_no) values (9701, 'hosp_cd', 9700, 'system', 9701);
insert into ph_item_attribute (item_id, caption, required) values (9701, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9702, 'pt_no', 9700, 'system', 9702);
insert into ph_item_attribute (item_id, caption) values (9702, '환자대체번호');
insert into ph_item_property (item_id, visible) values (9702, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9703, 'cexm_ymd', 9700, 'system', 9703);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (9703, '진단검사일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9704, 'cexm_seq', 9700, 'system', 9704);
insert into ph_item_attribute (item_id, caption, required) values (9704, '진단검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9705, 'cexm_kncd', 9700, 'system', 9705, 30580);
insert into ph_item_attribute (item_id, caption, data_type) values (9705, '진단검사종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (9705, 'cexm_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9706, 'cexm_knnm', 9700, 'system', 9706);
-- insert into ph_item_attribute (item_id, caption) values (9706, '진단검사종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9707, 'cexm_cd', 9700, 'system', 9707);
insert into ph_item_attribute (item_id, caption) values (9707, '진단검사코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9708, 'cexm_nm', 9700, 'system', 9708);
insert into ph_item_attribute (item_id, caption) values (9708, '진단검사명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9709, 'cexm_edi_cd', 9700, 'system', 9709);
insert into ph_item_attribute (item_id, caption) values (9709, '진단검사EDI코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9710, 'cexm_edi_nm', 9700, 'system', 9710);
insert into ph_item_attribute (item_id, caption) values (9710, '진단검사EDI명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9711, 'cexm_smct_cd', 9700, 'system', 9711);
insert into ph_item_attribute (item_id, caption) values (9711, '진단검사SNOMEDCT코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9712, 'cexm_smct_nm', 9700, 'system', 9712);
insert into ph_item_attribute (item_id, caption) values (9712, '진단검사SNOMEDCT명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9713, 'cexm_loinc_cd', 9700, 'system', 9713);
insert into ph_item_attribute (item_id, caption) values (9713, '진단검사LOINC코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9714, 'cexm_loinc_nm', 9700, 'system', 9714);
insert into ph_item_attribute (item_id, caption) values (9714, '진단검사LOINC명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9715, 'cexm_rslt_cont', 9700, 'system', 9715);
insert into ph_item_attribute (item_id, caption) values (9715, '진단검사결과내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (9716, 'cexm_rslt_unit_cont', 9700, 'system', 9716);
insert into ph_item_attribute (item_id, caption) values (9716, '진단검사결과단위내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (9717, 'cexm_nlrg_ref_vl', 9700, 'system', 9717);
insert into ph_item_attribute (item_id, caption) values (9717, '진단검사정상범위참고값');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9718, 'crtn_dt', 9700, 'system', 9718);
-- insert into ph_item_attribute (item_id, caption, format, data_type) values (9718, '생성일시', 'yyyyMMdd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9719, 'idx', 9700, 'system', 9719);
-- insert into ph_item_attribute (item_id, caption) values (9719, 'UI용 시퀀스');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9720, 'pact_id', 9700, 'system', 9720);
-- insert into ph_item_attribute (item_id, caption) values (9720, 'UI용 PACT_ID');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9721, 'exm_no', 9700, 'system', 9721);
-- insert into ph_item_attribute (item_id, caption) values (9721, 'UI용 검체번호');
