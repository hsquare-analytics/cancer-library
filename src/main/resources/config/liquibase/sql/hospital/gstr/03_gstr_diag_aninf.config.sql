DROP TABLE IF EXISTS GSTR.GSTR_DIAG_ANINF;
DROP TABLE IF EXISTS GSTR.GSTR_DIAG_ANINF_UPDATED;

CREATE TABLE IF NOT EXISTS GSTR.GSTR_DIAG_ANINF (
                                 hosp_cd varchar(20) NOT NULL, 					-- 병원코드
                                 pt_no varchar(10) NOT NULL, 					-- 환자대체번호
                                 anth_rcrd_ymd varchar(8) NOT NULL, 				-- 신체계측기록일자
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
                                 CONSTRAINT gstr_diag_aninf_pk PRIMARY KEY (hosp_cd, pt_no, anth_rcrd_ymd, anth_rcrd_seq)
);

CREATE TABLE IF NOT EXISTS GSTR.GSTR_DIAG_ANINF_UPDATED (
                                 hosp_cd varchar(20) NOT NULL, 					-- 병원코드
                                 pt_no varchar(10) NOT NULL, 					-- 환자대체번호
                                 anth_rcrd_ymd varchar(8) NOT NULL, 				-- 신체계측기록일자
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
                                 CREATED_BY         CHARACTER VARYING(50),
                                 CREATED_DATE       TIMESTAMP,
                                 LAST_MODIFIED_BY   CHARACTER VARYING(50),
                                 LAST_MODIFIED_DATE TIMESTAMP,
                                 STATUS             VARCHAR(50),
                                     CONSTRAINT gstr_diag_aninf_updated_pk PRIMARY KEY (hosp_cd, pt_no, anth_rcrd_ymd, anth_rcrd_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (4000, 'GSTR.GSTR_DIAG_ANINF', '위암_진단_신체계측정보', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (4000, null, '위암_진단_신체계측정보');


insert into ph_item (id, title, activated, category_id, created_by) values (4001, 'hosp_cd', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4001, '병원코드');
insert into ph_item_attribute (item_id, data_type) values (4001, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (4002, 'pt_no', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4002, '환자대체번호');

insert into ph_item (id, title, activated, category_id, created_by) values (4003, 'anth_rcrd_ymd', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4003, '신체계측기록일자');

insert into ph_item (id, title, activated, category_id, created_by) values (4004, 'anth_rcrd_seq', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4004, '신체계측기록순번');

insert into ph_item (id, title, activated, category_id, created_by) values (4005, 'ht_msrm_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4005, '신장측정값');

insert into ph_item (id, title, activated, category_id, created_by) values (4006, 'wt_msrm_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4006, '체중측정값');

insert into ph_item (id, title, activated, category_id, created_by) values (4007, 'bmi_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4007, 'BMI값');

insert into ph_item (id, title, activated, category_id, created_by) values (4008, 'rlxt_blpr_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4008, '이완혈압값');

insert into ph_item (id, title, activated, category_id, created_by) values (4009, 'ctrt_blpr_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4009, '수축혈압값');

insert into ph_item (id, title, activated, category_id, created_by) values (4010, 'ecog_cd', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4010, 'ECOG코드');
insert into ph_item_attribute (item_id, data_type) values (4010, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (4011, 'ecog_nm', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4011, 'ECOG명');

insert into ph_item (id, title, activated, category_id, created_by) values (4012, 'crtn_dt', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4012, '생성일시');

insert into ph_item (id, title, activated, category_id, created_by) values (4013, 'ecog_dt', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4013, 'UI용 ECOG 참고일자날짜');
