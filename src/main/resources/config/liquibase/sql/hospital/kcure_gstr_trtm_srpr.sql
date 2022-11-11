-- 16.위암_치료_시술
CREATE TABLE gstr_trtm_srpr
(
    idx                   varchar,
    hosp_cd               varchar(20) NOT NULL, -- 병원코드
    pt_no                 varchar(10) NOT NULL, -- 환자대체번호
    esd_srpr_ymd          varchar(8)  NOT NULL, -- ESD시술일자
    esd_srpr_seq          numeric(3)  NOT NULL, -- ESD시술순번
    esd_srpr_strt_dt      timestamp   NOT NULL, -- ESD시술시작일시
    esd_srpr_end_dt       timestamp   NOT NULL, -- ESD시술종료일시
    esd_lesn_size_vl      numeric(3) NULL,      -- ESD병변크기값
    esd_lesn_shap_cd      varchar(20) NULL,     -- ESD병변모양코드
    esd_lesn_shap_nm      varchar(200) NULL,    -- ESD병변모양명
    esd_lesn_loca_wdth_cd varchar(20) NULL,     -- ESD병변위치가로코드
    esd_lesn_loca_wdth_nm varchar(200) NULL,    -- ESD병변위치가로명
    esd_lesn_loca_lgtd_cd varchar(20) NULL,     -- ESD병변위치세로코드
    esd_lesn_loca_lgtd_nm varchar(200) NULL,    -- ESD병변위치세로명
    esd_ulcr_yn_unid_spcd varchar(20) NULL,     -- ESD궤양여부확인불가구분코드
    esd_ulcr_yn_unid_spnm varchar(50) NULL,     -- ESD궤양여부확인불가구분명
    esd_perf_yn_unid_spcd varchar(20) NULL,     -- ESD천공여부확인불가구분코드
    esd_perf_yn_unid_spnm varchar(50) NULL,     -- ESD천공여부확인불가구분명
    esd_perf_msre_cd      varchar(20) NULL,     -- ESD천공조치코드
    esd_perf_msre_nm      varchar(200) NULL,    -- ESD천공조치명
    esd_rslt_cd           varchar(20) NULL,     -- ESD결과코드
    esd_rslt_nm           varchar(200) NULL,    -- ESD결과명
    esd_opn_cont          varchar(4000) NULL,   -- ESD소견내용
    esd_rslt_cont         varchar(500) NULL,    -- ESD결과내용
    crtn_dt               timestamp   NOT NULL, -- 생성일시
    CONSTRAINT gstr_trtm_srpr_pk PRIMARY KEY (idx)
);

CREATE TABLE gstr_trtm_srpr_updated
(
    idx                   varchar,
    hosp_cd               varchar(20) NOT NULL, -- 병원코드
    pt_no                 varchar(10) NOT NULL, -- 환자대체번호
    esd_srpr_ymd          varchar(8)  NOT NULL, -- ESD시술일자
    esd_srpr_seq          numeric(3)  NOT NULL, -- ESD시술순번
    esd_srpr_strt_dt      timestamp   NOT NULL, -- ESD시술시작일시
    esd_srpr_end_dt       timestamp   NOT NULL, -- ESD시술종료일시
    esd_lesn_size_vl      numeric(3) NULL,      -- ESD병변크기값
    esd_lesn_shap_cd      varchar(20) NULL,     -- ESD병변모양코드
    esd_lesn_shap_nm      varchar(200) NULL,    -- ESD병변모양명
    esd_lesn_loca_wdth_cd varchar(20) NULL,     -- ESD병변위치가로코드
    esd_lesn_loca_wdth_nm varchar(200) NULL,    -- ESD병변위치가로명
    esd_lesn_loca_lgtd_cd varchar(20) NULL,     -- ESD병변위치세로코드
    esd_lesn_loca_lgtd_nm varchar(200) NULL,    -- ESD병변위치세로명
    esd_ulcr_yn_unid_spcd varchar(20) NULL,     -- ESD궤양여부확인불가구분코드
    esd_ulcr_yn_unid_spnm varchar(50) NULL,     -- ESD궤양여부확인불가구분명
    esd_perf_yn_unid_spcd varchar(20) NULL,     -- ESD천공여부확인불가구분코드
    esd_perf_yn_unid_spnm varchar(50) NULL,     -- ESD천공여부확인불가구분명
    esd_perf_msre_cd      varchar(20) NULL,     -- ESD천공조치코드
    esd_perf_msre_nm      varchar(200) NULL,    -- ESD천공조치명
    esd_rslt_cd           varchar(20) NULL,     -- ESD결과코드
    esd_rslt_nm           varchar(200) NULL,    -- ESD결과명
    esd_opn_cont          varchar(4000) NULL,   -- ESD소견내용
    esd_rslt_cont         varchar(500) NULL,    -- ESD결과내용
    crtn_dt               timestamp   NOT NULL, -- 생성일시
    CREATED_BY         CHARACTER VARYING(50),
    CREATED_DATE       TIMESTAMP,
    LAST_MODIFIED_BY   CHARACTER VARYING(50),
    LAST_MODIFIED_DATE TIMESTAMP,
    STATUS             VARCHAR(50)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (3000, 'gstr_trtm_srpr', 'gstr_trtm_srpr', true, 1, 999, 'system');;

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (3000, null, '위암_치료_시술');

insert into ph_item (id, title, activated, category_id, created_by) values (3001, 'pt_no', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, visible) values (3001, '환자대체번호', false, false, false);

insert into ph_item (id, title, activated, category_id, created_by) values (3002, 'hosp_cd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3002, '병원코드', true, true);
insert into ph_item_attribute (item_id, data_type) values (3002, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (3003, 'esd_srpr_ymd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3003, 'ESD시술일자', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3004, 'esd_srpr_seq', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3004, 'ESD시술순번', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3005, 'esd_srpr_strt_dt', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3005, 'ESD시술시작일시', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3006, 'esd_srpr_end_dt', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3006, 'ESD시술종료일시', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3007, 'esd_lesn_size_vl', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3007, 'ESD병변크기값', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3008, 'esd_lesn_shap_cd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3008, 'ESD병변모양코드', true, true);
insert into ph_item_attribute (item_id, data_type) values (3008, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (3009, 'esd_lesn_shap_nm', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3009, 'ESD병변모양명', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3010, 'esd_lesn_loca_wdth_cd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3010, 'ESD병변위치가로코드', true, true);
insert into ph_item_attribute (item_id, data_type) values (3010, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (3011, 'esd_lesn_loca_wdth_nm', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3011, 'ESD병변위치가로명', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3012, 'esd_lesn_loca_lgtd_cd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3012, 'ESD병변위치세로코드', true, true);
insert into ph_item_attribute (item_id, data_type) values (3012, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (3013, 'esd_lesn_loca_lgtd_nm', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3013, 'ESD병변위치세로명', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3014, 'esd_ulcr_yn_unid_spcd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3014, 'ESD궤양여부확인불가구분코드', true, true);
insert into ph_item_attribute (item_id, data_type) values (3014, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (3015, 'esd_ulcr_yn_unid_spnm', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3015, 'ESD궤양여부확인불가구분명', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3016, 'esd_perf_yn_unid_spcd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3016, 'ESD천공여부확인불가구분코드', true, true);
insert into ph_item_attribute (item_id, data_type) values (3016, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (3017, 'esd_perf_yn_unid_spnm', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3017, 'ESD천공여부확인불가구분명', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3018, 'esd_perf_msre_cd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3018, 'ESD천공조치코드', true, true);
insert into ph_item_attribute (item_id, data_type) values (3018, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (3019, 'esd_perf_msre_nm', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3019, 'ESD천공조치명', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3020, 'esd_rslt_cd', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3020, 'ESD결과코드', true, true);
insert into ph_item_attribute (item_id, data_type) values (3020, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (3021, 'esd_rslt_nm', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3021, 'ESD결과명', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3022, 'esd_opn_cont', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3022, 'ESD소견내용', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3023, 'esd_rslt_cont', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3023, 'ESD결과내용', true, true);

insert into ph_item (id, title, activated, category_id, created_by) values (3024, 'crtn_dt', true, 3000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (3024, '생성일시', true, true);

