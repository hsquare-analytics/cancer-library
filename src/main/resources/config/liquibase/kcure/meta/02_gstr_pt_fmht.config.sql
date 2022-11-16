--작업일시: 221115 am10:23

DROP TABLE IF EXISTS GSTR.GSTR_PT_FMHT;
DROP TABLE IF EXISTS GSTR.GSTR_PT_FMHT_UPDATED;

CREATE TABLE IF NOT EXISTS GSTR.GSTR_PT_FMHT (
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


INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9200, 'GSTR.GSTR_PT_FMHT', '위암_환자_가족력', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (9200, null, '위암_환자_가족력');

insert into ph_item (id, title, category_id, created_by, order_no) values (9201, 'hosp_cd', 9200, 'system', 9201);
insert into ph_item_property (item_id, caption, required) values (9201, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9202, 'pt_no', 9200, 'system', 9202);
insert into ph_item_property (item_id, caption, visible) values (9202, '환자대체번호', false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9203, 'fmht_rcrd_ymd', 9200, 'system', 9203);
insert into ph_item_property (item_id, caption, required, format) values (9203, '가족력기록일자', true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9203, 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9204, 'fmht_rcrd_seq', 9200, 'system', 9204);
insert into ph_item_property (item_id, caption, required) values (9204, '가족력기록순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9205, 'fmht_yn_noans_spcd', 9200, 'system', 9205, 10040);
insert into ph_item_property (item_id, caption) values (9205, '가족력여부무응답구분코드');
insert into ph_item_attribute (item_id, data_type) values (9205, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9206, 'fmht_yn_noans_spnm', 9200, 'system', 9206);
insert into ph_item_property (item_id, caption) values (9206, '가족력여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9207, 'pt_fm_rlcd', 9200, 'system', 9207, 10070);
insert into ph_item_property (item_id, caption) values (9207, '환자가족관계코드');
insert into ph_item_attribute (item_id, data_type) values (9207, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9208, 'pt_fm_rlnm', 9200, 'system', 9208);
insert into ph_item_property (item_id, caption) values (9208, '환자가족관계명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9209, 'pt_fmrl_etc_cont', 9200, 'system', 9209);
insert into ph_item_property (item_id, caption) values (9209, '환자가족관계기타내용');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9210, 'fmhs_htn_yn_noans_spcd', 9200, 'system', 9210, 10040);
insert into ph_item_property (item_id, caption) values (9210, '가족병력고혈압여부무응답구분코드');
insert into ph_item_attribute (item_id, data_type) values (9210, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9211, 'fmhs_htn_yn_noans_spnm', 9200, 'system', 9211);
insert into ph_item_property (item_id, caption) values (9211, '가족병력고혈압여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9212, 'fmhs_dbt_yn_noans_spcd', 9200, 'system', 9212, 10040);
insert into ph_item_property (item_id, caption) values (9212, '가족병력당뇨여부무응답구분코드');
insert into ph_item_attribute (item_id, data_type) values (9212, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9213, 'fmhs_dbt_yn_noans_spnm', 9200, 'system', 9213);
insert into ph_item_property (item_id, caption) values (9213, '가족병력당뇨여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9214, 'fmht_tb_yn_noans_spcd', 9200, 'system', 9214, 10040);
insert into ph_item_property (item_id, caption) values (9214, '가족력결핵여부무응답구분코드');
insert into ph_item_attribute (item_id, data_type) values (9214, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9215, 'fmht_tb_yn_noans_spnm', 9200, 'system', 9215);
insert into ph_item_property (item_id, caption) values (9215, '가족력결핵여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9216, 'fmhs_lvds_yn_noans_spcd', 9200, 'system', 9216, 10040);
insert into ph_item_property (item_id, caption) values (9216, '가족병력간질환여부무응답구분코드');
insert into ph_item_attribute (item_id, data_type) values (9216, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9217, 'fmhs_lvds_yn_noans_spnm', 9200, 'system', 9217);
insert into ph_item_property (item_id, caption) values (9217, '가족병력간질환여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9218, 'fmhs_cncr_yn_noans_spcd', 9200, 'system', 9218, 10040);
insert into ph_item_property (item_id, caption) values (9218, '가족병력암여부무응답구분코드');
insert into ph_item_attribute (item_id, data_type) values (9218, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9219, 'fmhs_cncr_yn_noans_spnm', 9200, 'system', 9219);
insert into ph_item_property (item_id, caption) values (9219, '가족병력암여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9220, 'fmht_cncr_kncd', 9200, 'system', 9220);
insert into ph_item_property (item_id, caption) values (9220, '가족력암종류코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9221, 'fmht_cncr_knnm', 9200, 'system', 9221);
insert into ph_item_property (item_id, caption) values (9221, '가족력암종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9222, 'fmht_cncr_kind_etc_cont', 9200, 'system', 9222);
insert into ph_item_property (item_id, caption) values (9222, '가족력암종류기타내용');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9223, 'fmhs_etc_yn_noans_spcd', 9200, 'system', 9223, 10040);
insert into ph_item_property (item_id, caption) values (9223, '가족병력기타여부무응답구분코드');
insert into ph_item_attribute (item_id, data_type) values (9223, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9224, 'fmhs_etc_yn_noans_spnm', 9200, 'system', 9224);
insert into ph_item_property (item_id, caption) values (9224, '가족병력기타여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9225, 'fmhs_etc_cont', 9200, 'system', 9225);
insert into ph_item_property (item_id, caption) values (9225, '가족병력기타내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (9226, 'crtn_dt', 9200, 'system', 9226);
insert into ph_item_property (item_id, caption, required, format) values (9226, '생성일시', true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9226, 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9227, 'pact_id', 9200, 'system', 9227);
insert into ph_item_property (item_id, caption) values (9227, 'ui확인용 pact_id');
