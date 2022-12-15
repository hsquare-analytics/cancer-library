--작업일시: 221115 am10:32

DROP TABLE IF EXISTS GSCN.GSCN_DIAG_ANINF;
DROP TABLE IF EXISTS GSCN.GSCN_DIAG_ANINF_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_DIAG_ANINF (
                                 hosp_cd varchar(20) NOT NULL, 					-- 병원코드
                                 pt_no varchar(10) NOT NULL, 					-- 환자대체번호
                                 anth_rcrd_ymd timestamp NOT NULL, 				-- 신체계측기록일자
                                 anth_rcrd_seq numeric(3) NOT NULL, 				-- 신체계측기록순번
                                 ht_msrm_vl varchar(10) NULL, 					-- 신장측정값			-- numeric(5, 1)  쓰레기 데이터도 그냥 넘겨달라고함
                                 wt_msrm_vl varchar(10) NULL, 					-- 체중측정값			-- numeric(5, 1)  쓰레기 데이터도 그냥 넘겨달라고함
                                 bmi_vl varchar(10) NULL, 						-- BMI값					-- numeric(5, 2)  쓰레기 데이터도 그냥 넘겨달라고함
                                 rlxt_blpr_vl varchar(10) NULL, 					-- 이완혈압값
                                 ctrt_blpr_vl varchar(10) NULL, 					-- 수축혈압값			-- numeric(5) 쓰레기 데이터도 그냥 넘겨달라고함
                                 ecog_cd varchar(20) NULL, 						-- ECOG코드
                                 ecog_nm varchar(200) NULL, 						-- ECOG명
                                 crtn_dt timestamp NOT NULL, 					-- 생성일시
                                 ecog_dt varchar(20) null,						-- UI용 ECOG 참고일자날짜
                                 idx varchar(20) NULL, -- UI용 시퀀스
                                 CONSTRAINT gscn_diag_aninf_pk PRIMARY KEY (hosp_cd, pt_no, anth_rcrd_ymd, anth_rcrd_seq)
);


INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9300, 'GSCN.GSCN_DIAG_ANINF', '03.위암_진단_신체계측정보', true, 3, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (9300, null, '03.위암_진단_신체계측정보');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9301, 'hosp_cd', 9300, 'system', 9301);
-- insert into ph_item_attribute (item_id, caption, required) values (9301, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9302, 'pt_no', 9300, 'system', 9302);
insert into ph_item_attribute (item_id, caption) values (9302, '환자대체번호');
insert into ph_item_property (item_id, visible) values (9302, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9303, 'anth_rcrd_ymd', 9300, 'system', 9303);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (9303, '신체계측기록일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9304, 'anth_rcrd_seq', 9300, 'system', 9304);
insert into ph_item_attribute (item_id, caption, required) values (9304, '신체계측기록순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9305, 'ht_msrm_vl', 9300, 'system', 9305);
insert into ph_item_attribute (item_id, caption) values (9305, '신장측정값');

insert into ph_item (id, title, category_id, created_by, order_no) values (9306, 'wt_msrm_vl', 9300, 'system', 9306);
insert into ph_item_attribute (item_id, caption) values (9306, '체중측정값');

insert into ph_item (id, title, category_id, created_by, order_no) values (9307, 'bmi_vl', 9300, 'system', 9307);
insert into ph_item_attribute (item_id, caption) values (9307, 'BMI값');

insert into ph_item (id, title, category_id, created_by, order_no) values (9308, 'rlxt_blpr_vl', 9300, 'system', 9308);
insert into ph_item_attribute (item_id, caption) values (9308, '이완혈압값');

insert into ph_item (id, title, category_id, created_by, order_no) values (9309, 'ctrt_blpr_vl', 9300, 'system', 9309);
insert into ph_item_attribute (item_id, caption) values (9309, '수축혈압값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9310, 'ecog_cd', 9300, 'system', 9310, 20010);
insert into ph_item_attribute (item_id, caption, data_type) values (9310, 'ECOG코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (9310, 'ecog_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9311, 'ecog_nm', 9300, 'system', 9311);
-- insert into ph_item_attribute (item_id, caption) values (9311, 'ECOG명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9312, 'crtn_dt', 9300, 'system', 9312);
-- insert into ph_item_attribute (item_id, caption, format, data_type) values (9312, '생성일시', 'yyyyMMdd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9313, 'ecog_dt', 9300, 'system', 9313);
-- insert into ph_item_attribute (item_id, caption, format, data_type) values (9313, 'UI용 ECOG 참고일자날짜', 'yyyyMMdd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9314, 'idx', 9300, 'system', 9314);
-- insert into ph_item_attribute (item_id, caption) values (9314, 'UI용 시퀀스');
