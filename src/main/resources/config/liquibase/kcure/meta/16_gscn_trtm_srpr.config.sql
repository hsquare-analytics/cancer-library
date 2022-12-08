DROP TABLE IF EXISTS GSCN.GSCN_TRTM_SRPR;
DROP TABLE IF EXISTS GSCN.GSCN_TRTM_SRPR_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_TRTM_SRPR (
    hosp_cd               varchar(20) not null,
    pt_no                 varchar(10) not null,
    esd_srpr_ymd          timestamp   not null,
    esd_srpr_seq          numeric(3)  not null,
    esd_srpr_strt_dt      timestamp   not null,
    esd_srpr_end_dt       timestamp   not null,
    esd_lesn_size_vl      numeric(3),
    esd_lesn_shap_cd      varchar(20),
    esd_lesn_shap_nm      varchar(200),
    esd_lesn_loca_wdth_cd varchar(20),
    esd_lesn_loca_wdth_nm varchar(200),
    esd_lesn_loca_lgtd_cd varchar(20),
    esd_lesn_loca_lgtd_nm varchar(200),
    esd_ulcr_yn_unid_spcd varchar(20),
    esd_ulcr_yn_unid_spnm varchar(50),
    esd_perf_yn_unid_spcd varchar(20),
    esd_perf_yn_unid_spnm varchar(50),
    esd_perf_msre_cd      varchar(20),
    esd_perf_msre_nm      varchar(200),
    esd_rslt_cd           varchar(20),
    esd_rslt_nm           varchar(200),
    esd_opn_cont          varchar(4000),
    esd_rslt_cont         varchar(500),
    crtn_dt               timestamp   not null,
    idx                   varchar(100),
    exm_cd                varchar(50),
    pact_id               varchar(50),
    comments              varchar(4000),
    constraint gscn_trtm_srpr_pk
    primary key (hosp_cd, pt_no, esd_srpr_ymd, esd_srpr_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (16000, 'GSCN.GSCN_TRTM_SRPR', '16.위암_치료_시술', true, 16, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (16000, null, '16.위암_치료_시술');

insert into ph_item (id, title, category_id, created_by, order_no) values (16001, 'hosp_cd', 16000, 'system', 16001);
insert into ph_item_attribute (item_id, caption, required) values (16001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (16002, 'pt_no', 16000, 'system', 16002);
insert into ph_item_attribute (item_id, caption) values (16002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (16002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (16003, 'esd_srpr_ymd', 16000, 'system', 16003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (16003, 'ESD시술일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (16004, 'esd_srpr_seq', 16000, 'system', 16004);
insert into ph_item_attribute (item_id, caption, required) values (16004, 'ESD시술순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (16005, 'esd_srpr_strt_dt', 16000, 'system', 16005);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (16005, 'ESD시술시작일시', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (16006, 'esd_srpr_end_dt', 16000, 'system', 16006);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (16006, 'ESD시술종료일시', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (16007, 'esd_lesn_size_vl', 16000, 'system', 1600);
insert into ph_item_attribute (item_id, caption) values (16007, 'ESD병변크기값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (16008, 'esd_lesn_shap_cd', 16000, 'system', 16008, 40030);
insert into ph_item_attribute (item_id, caption, data_type) values (16008, 'ESD병변모양코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (16008, 'esd_lesn_shap_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (16009, 'esd_lesn_shap_nm', 16000, 'system', 16009);
-- insert into ph_item_attribute (item_id, caption) values (16009, 'ESD병변모양명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (16010, 'esd_lesn_loca_wdth_cd', 16000, 'system', 16010, 40040);
insert into ph_item_attribute (item_id, caption, data_type) values (16010, 'ESD병변위치가로코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (16010, 'esd_lesn_loca_wdth_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (16011, 'esd_lesn_loca_wdth_nm', 16000, 'system', 16011);
-- insert into ph_item_attribute (item_id, caption) values (16011, 'ESD병변위치가로명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (16012, 'esd_lesn_loca_lgtd_cd', 16000, 'system', 16012, 40050);
insert into ph_item_attribute (item_id, caption, data_type) values (16012, 'ESD병변위치세로코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (16012, 'esd_lesn_loca_lgtd_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (16013, 'esd_lesn_loca_lgtd_nm', 16000, 'system', 16013);
-- insert into ph_item_attribute (item_id, caption) values (16013, 'ESD병변위치세로명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (16014, 'esd_ulcr_yn_unid_spcd', 16000, 'system', 16014, 30380);
insert into ph_item_attribute (item_id, caption, data_type) values (16014, 'ESD궤양여부확인불가구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (16014, 'esd_ulcr_yn_unid_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (16015, 'esd_ulcr_yn_unid_spnm', 16000, 'system', 16015);
-- insert into ph_item_attribute (item_id, caption) values (16015, 'ESD궤양여부확인불가구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (16016, 'esd_perf_yn_unid_spcd', 16000, 'system', 16016, 30380);
insert into ph_item_attribute (item_id, caption, data_type) values (16016, 'ESD천공여부확인불가구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (16016, 'esd_perf_yn_unid_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (16017, 'esd_perf_yn_unid_spnm', 16000, 'system', 16017);
-- insert into ph_item_attribute (item_id, caption) values (16017, 'ESD천공여부확인불가구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (16018, 'esd_perf_msre_cd', 16000, 'system', 16018, 40060);
insert into ph_item_attribute (item_id, caption, data_type) values (16018, 'ESD천공조치코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (16018, 'esd_perf_msre_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (16019, 'esd_perf_msre_nm', 16000, 'system', 16019);
-- insert into ph_item_attribute (item_id, caption) values (16019, 'ESD천공조치명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (16020, 'esd_rslt_cd', 16000, 'system', 16020, 40020);
insert into ph_item_attribute (item_id, caption, data_type) values (16020, 'ESD결과코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (16020, 'esd_rslt_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (16021, 'esd_rslt_nm', 16000, 'system', 16021);
-- insert into ph_item_attribute (item_id, caption) values (16021, 'ESD결과명');

insert into ph_item (id, title, category_id, created_by, order_no) values (16022, 'esd_opn_cont', 16000, 'system', 16022);
insert into ph_item_attribute (item_id, caption) values (16022, 'ESD소견내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (16023, 'esd_rslt_cont', 16000, 'system', 16023);
insert into ph_item_attribute (item_id, caption) values (16023, 'ESD결과내용');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (16024, 'crtn_dt', 16000, 'system', 16024);
-- insert into ph_item_attribute (item_id, caption) values (16024, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (16025, 'idx', 16000, 'system', 16025);
-- insert into ph_item_attribute (item_id, caption) values (16025, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (16026, 'exm_cd', 16000, 'system', 16026);
-- insert into ph_item_attribute (item_id, caption) values (16026, 'UI용 검사코드');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (16027, 'pact_id', 16000, 'system', 16027);
-- insert into ph_item_attribute (item_id, caption) values (16027, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (16028, 'comments', 16000, 'system', 16028);
-- insert into ph_item_attribute (item_id, caption) values (16028, 'UI용 comments');
