CREATE TABLE GSTR_PT_FMHT (
                              hosp_cd varchar(20) NOT NULL, 							-- 병원코드
                              pt_no varchar(10) NOT NULL, 							-- 환자대체번호
                              fmht_rcrd_ymd varchar(8) NOT NULL, 						-- 가족력기록일자
                              fmht_rcrd_seq numeric(3) NOT NULL, 						-- 가족력기록순번
                              fmht_yn_noans_spcd varchar(20) NULL, 					-- 가족력여부무응답구분코드
                              fmht_yn_noans_spnm varchar(50) NULL, 					-- 가족력여부무응답구분명
                              pt_fm_rlcd varchar(20) NULL, 							-- 환자가족관계코드
                              pt_fm_rlnm varchar(200) NULL, 							-- 환자가족관계명
                              pt_fmrl_etc_cont varchar(200) NULL, 					-- 환자가족관계기타내용
                              fmhs_htn_yn_noans_spcd varchar(20) NULL, 				-- 가족병력고혈압여부무응답구분코드
                              fmhs_htn_yn_noans_spnm varchar(50) NULL, -- 가족병력고혈압여부무응답구분명
                              fmhs_dbt_yn_noans_spcd varchar(20) NULL, -- 가족병력당뇨여부무응답구분코드
                              fmhs_dbt_yn_noans_spnm varchar(50) NULL, -- 가족병력당뇨여부무응답구분명
                              fmht_tb_yn_noans_spcd varchar(20) NULL, -- 가족력결핵여부무응답구분코드
                              fmht_tb_yn_noans_spnm varchar(50) NULL, -- 가족력결핵여부무응답구분명
                              fmhs_lvds_yn_noans_spcd varchar(20) NULL, -- 가족병력간질환여부무응답구분코드
                              fmhs_lvds_yn_noans_spnm varchar(50) NULL, -- 가족병력간질환여부무응답구분명
                              fmhs_cncr_yn_noans_spcd varchar(20) NULL, -- 가족병력암여부무응답구분코드
                              fmhs_cncr_yn_noans_spnm varchar(50) NULL, -- 가족병력암여부무응답구분명
                              fmht_cncr_kncd varchar(20) NULL, -- 가족력암종류코드
                              fmht_cncr_knnm varchar(200) NULL, -- 가족력암종류명
                              fmht_cncr_kind_etc_cont varchar(200) NULL, -- 가족력암종류기타내용
                              fmhs_etc_yn_noans_spcd varchar(20) NULL, -- 가족병력기타여부무응답구분코드
                              fmhs_etc_yn_noans_spnm varchar(50) NULL, -- 가족병력기타여부무응답구분명
                              fmhs_etc_cont varchar(200) NULL, -- 가족병력기타내용
                              crtn_dt timestamp NOT NULL, -- 생성일시
                              pact_id varchar(50) null, -- UI용 PACT_ID
                              idx varchar(20) NULL, -- UI용 시퀀스
                              CONSTRAINT gstr_pt_fmht_pk PRIMARY KEY (hosp_cd, pt_no, fmht_rcrd_ymd, fmht_rcrd_seq)
);

CREATE TABLE GSTR_PT_FMHT_UPDATED (
                              hosp_cd varchar(20) NOT NULL, 							-- 병원코드
                              pt_no varchar(10) NOT NULL, 							-- 환자대체번호
                              fmht_rcrd_ymd varchar(8) NOT NULL, 						-- 가족력기록일자
                              fmht_rcrd_seq numeric(3) NOT NULL, 						-- 가족력기록순번
                              fmht_yn_noans_spcd varchar(20) NULL, 					-- 가족력여부무응답구분코드
                              fmht_yn_noans_spnm varchar(50) NULL, 					-- 가족력여부무응답구분명
                              pt_fm_rlcd varchar(20) NULL, 							-- 환자가족관계코드
                              pt_fm_rlnm varchar(200) NULL, 							-- 환자가족관계명
                              pt_fmrl_etc_cont varchar(200) NULL, 					-- 환자가족관계기타내용
                              fmhs_htn_yn_noans_spcd varchar(20) NULL, 				-- 가족병력고혈압여부무응답구분코드
                              fmhs_htn_yn_noans_spnm varchar(50) NULL, -- 가족병력고혈압여부무응답구분명
                              fmhs_dbt_yn_noans_spcd varchar(20) NULL, -- 가족병력당뇨여부무응답구분코드
                              fmhs_dbt_yn_noans_spnm varchar(50) NULL, -- 가족병력당뇨여부무응답구분명
                              fmht_tb_yn_noans_spcd varchar(20) NULL, -- 가족력결핵여부무응답구분코드
                              fmht_tb_yn_noans_spnm varchar(50) NULL, -- 가족력결핵여부무응답구분명
                              fmhs_lvds_yn_noans_spcd varchar(20) NULL, -- 가족병력간질환여부무응답구분코드
                              fmhs_lvds_yn_noans_spnm varchar(50) NULL, -- 가족병력간질환여부무응답구분명
                              fmhs_cncr_yn_noans_spcd varchar(20) NULL, -- 가족병력암여부무응답구분코드
                              fmhs_cncr_yn_noans_spnm varchar(50) NULL, -- 가족병력암여부무응답구분명
                              fmht_cncr_kncd varchar(20) NULL, -- 가족력암종류코드
                              fmht_cncr_knnm varchar(200) NULL, -- 가족력암종류명
                              fmht_cncr_kind_etc_cont varchar(200) NULL, -- 가족력암종류기타내용
                              fmhs_etc_yn_noans_spcd varchar(20) NULL, -- 가족병력기타여부무응답구분코드
                              fmhs_etc_yn_noans_spnm varchar(50) NULL, -- 가족병력기타여부무응답구분명
                              fmhs_etc_cont varchar(200) NULL, -- 가족병력기타내용
                              crtn_dt timestamp NOT NULL, -- 생성일시
                              pact_id varchar(50) null, -- UI용 PACT_ID
                              idx varchar(20) NULL, -- UI용 시퀀스
                              CREATED_BY         CHARACTER VARYING(50),
                              CREATED_DATE       TIMESTAMP,
                              LAST_MODIFIED_BY   CHARACTER VARYING(50),
                              LAST_MODIFIED_DATE TIMESTAMP,
                              STATUS             VARCHAR(50),
                              CONSTRAINT gstr_pt_fmht_updated_pk PRIMARY KEY (hosp_cd, pt_no, fmht_rcrd_ymd, fmht_rcrd_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (3000, 'CNCR_RGST', '위암_환자_가족력', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (3000, null, '위암_환자_가족력');

insert into ph_item (id, title, category_id, created_by, activated) values (3001, 'hosp_cd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3001, '병원코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3002, 'pt_no', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3002, '환자대체번호');

insert into ph_item (id, title, category_id, created_by, activated) values (3003, 'fmht_rcrd_ymd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3003, '가족력기록일자');

insert into ph_item (id, title, category_id, created_by, activated) values (3004, 'fmht_rcrd_seq', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3004, '가족력기록순번');

insert into ph_item (id, title, category_id, created_by, activated) values (3005, 'fmht_yn_noans_spcd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3005, '가족력여부무응답구분코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3006, 'fmht_yn_noans_spnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3006, '가족력여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, activated) values (3007, 'pt_fm_rlcd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3007, '환자가족관계코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3008, 'pt_fm_rlnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3008, '환자가족관계명');

insert into ph_item (id, title, category_id, created_by, activated) values (3009, 'pt_fmrl_etc_cont', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3009, '환자가족관계기타내용');

insert into ph_item (id, title, category_id, created_by, activated) values (3010, 'fmhs_htn_yn_noans_spcd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3010, '가족병력고혈압여부무응답구분코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3011, 'fmhs_htn_yn_noans_spnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3011, '가족병력고혈압여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, activated) values (3012, 'fmhs_dbt_yn_noans_spcd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3012, '가족병력당뇨여부무응답구분코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3013, 'fmhs_dbt_yn_noans_spnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3013, '가족병력당뇨여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, activated) values (3014, 'fmht_tb_yn_noans_spcd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3014, '가족력결핵여부무응답구분코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3015, 'fmht_tb_yn_noans_spnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3015, '가족력결핵여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, activated) values (3016, 'fmhs_lvds_yn_noans_spcd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3016, '가족병력간질환여부무응답구분코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3017, 'fmhs_lvds_yn_noans_spnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3017, '가족병력간질환여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, activated) values (3018, 'fmhs_cncr_yn_noans_spcd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3018, '가족병력암여부무응답구분코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3019, 'fmhs_cncr_yn_noans_spnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3019, '가족병력암여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, activated) values (3020, 'fmht_cncr_kncd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3020, '가족력암종류코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3021, 'fmht_cncr_knnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3021, '가족력암종류명');

insert into ph_item (id, title, category_id, created_by, activated) values (3022, 'fmht_cncr_kind_etc_cont', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3022, '가족력암종류기타내용');

insert into ph_item (id, title, category_id, created_by, activated) values (3023, 'fmhs_etc_yn_noans_spcd', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3023, '가족병력기타여부무응답구분코드');

insert into ph_item (id, title, category_id, created_by, activated) values (3024, 'fmhs_etc_yn_noans_spnm', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3024, '가족병력기타여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, activated) values (3025, 'fmhs_etc_cont', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3025, '가족병력기타내용');

insert into ph_item (id, title, category_id, created_by, activated) values (3026, 'crtn_dt', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3026, '생성일시');

insert into ph_item (id, title, category_id, created_by, activated) values (3027, 'pact_id', 3000, 'system', true);
insert into ph_item_property (item_id, caption) values (3027, 'UI용 PACT_ID');


