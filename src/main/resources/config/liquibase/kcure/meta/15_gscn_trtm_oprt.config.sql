DROP TABLE IF EXISTS GSCN.GSCN_TRTM_OPRT;
DROP TABLE IF EXISTS GSCN.GSCN_TRTM_OPRT_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_TRTM_OPRT (
    hosp_cd                    varchar(20) not null,
    pt_no                      varchar(10) not null,
    oprt_ymd                   timestamp   not null,
    oprt_seq                   numeric(3)  not null,
    oprt_kncd                  varchar(20),
    oprt_knnm                  varchar(200),
    oprt_cd                    varchar(20),
    oprt_nm                    varchar(200),
    oprt_edi_cd                varchar(20),
    oprt_edi_nm                varchar(200),
    oprt_smct_cd               varchar(200),
    oprt_smct_nm               varchar(1000),
    oprt_icd9cm_cd             varchar(20),
    oprt_icd9cm_nm             varchar(1000),
    oprt_ldtm                  varchar(20),
    oprt_prps_cd               varchar(20),
    oprt_prps_nm               varchar(200),
    oprt_mtcd                  varchar(20),
    oprt_mtnm                  varchar(200),
    oprt_anst_site_cd          varchar(20),
    oprt_anst_site_nm          varchar(200),
    asa_scor_cd                varchar(20),
    asa_scor_nm                varchar(200),
    oprt_incs_mtcd             varchar(20),
    oprt_incs_mtnm             varchar(200),
    oprt_crmr_tumr_loca_cd     varchar(20),
    oprt_crmr_tumr_loca_nm     varchar(200),
    oprt_lngt_1_tumr_loca_cd   varchar(20),
    oprt_lngt_1_tumr_loca_nm   varchar(200),
    oprt_lngt_2_tumr_loca_cd   varchar(20),
    oprt_lngt_2_tumr_loca_nm   varchar(200),
    diag_lpex_yn_unid_spcd     varchar(20),
    diag_lpex_yn_unid_spnm     varchar(50),
    oprm_ensp_use_yn_unid_spcd varchar(20),
    oprm_ensp_use_yn_unid_spnm varchar(50),
    flrn_imag_use_yn_unid_spcd varchar(20),
    flrn_imag_use_yn_unid_spnm varchar(50),
    inop_antp_cd               varchar(20),
    inop_antp_nm               varchar(200),
    adh_ibtr_use_yn_unid_spcd  varchar(20),
    adh_ibtr_use_yn_unid_spnm  varchar(50),
    adh_ibtr_gods_nm           varchar(200),
    omnl_srmv_rang_cd          varchar(20),
    omnl_srmv_rang_nm          varchar(200),
    curdg_cd                   varchar(20),
    curdg_nm                   varchar(200),
    ln_srmv_dgre_cd            varchar(20),
    ln_srmv_dgre_nm            varchar(200),
    ln_srmv_dgre_detl_cont     varchar(500),
    mrge_srmv_site_cd          varchar(20),
    mrge_srmv_site_nm          varchar(200),
    repr_kncd                  varchar(20),
    repr_knnm                  varchar(200),
    repr_use_dvce_nm           varchar(200),
    repr_mtcd                  varchar(20),
    repr_mtnm                  varchar(200),
    repr_aprmthd_cd            varchar(20),
    repr_aprmthd_nm            varchar(200),
    oprt_ebl_qty               numeric(5),
    asct_yn_unid_spcd          varchar(20),
    asct_yn_unid_spnm          varchar(50),
    crtn_dt                    timestamp   not null,
    idx                        varchar(100),
    pact_id                    varchar(50),
    procedure_cnte             varchar(4000),
    comments                   varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    constraint gscn_trtm_oprt_pk
    primary key (hosp_cd, pt_no, oprt_ymd, oprt_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (15000, 'GSCN.GSCN_TRTM_OPRT', '15.위암_치료_수술', true, 14, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (15000, 'oprt_ymd', '15.위암_치료_수술');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15001, 'hosp_cd', 15000, 'system', 15001);
-- insert into ph_item_attribute (item_id, caption, required) values (15001, '01 병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (15002, 'pt_no', 15000, 'system', 15002);
insert into ph_item_attribute (item_id, caption) values (15002, '02 환자대체번호');
insert into ph_item_property (item_id, visible) values (15002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (15003, 'oprt_ymd', 15000, 'system', 15003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (15003, '03 수술일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (15004, 'oprt_seq', 15000, 'system', 15004);
insert into ph_item_attribute (item_id, caption, required) values (15004, '04 수술순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15005, 'oprt_kncd', 15000, 'system', 15005, 40310);
insert into ph_item_attribute (item_id, caption, data_type) values (15005, '05 수술종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15005, 'oprt_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15006, 'oprt_knnm', 15000, 'system', 15006);
-- insert into ph_item_attribute (item_id, caption) values (15006, '수술종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15007, 'oprt_cd', 15000, 'system', 15007);
insert into ph_item_attribute (item_id, caption) values (15007, '수술코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (15008, 'oprt_nm', 15000, 'system', 15008);
insert into ph_item_attribute (item_id, caption) values (15008, '수술명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15009, 'oprt_edi_cd', 15000, 'system', 15009);
insert into ph_item_attribute (item_id, caption) values (15009, '수술EDI코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (15010, 'oprt_edi_nm', 15000, 'system', 15010);
insert into ph_item_attribute (item_id, caption) values (15010, '수술EDI명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15011, 'oprt_smct_cd', 15000, 'system', 15011);
insert into ph_item_attribute (item_id, caption) values (15011, '수술SNOMEDCT코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (15012, 'oprt_smct_nm', 15000, 'system', 15012);
insert into ph_item_attribute (item_id, caption) values (15012, '수술SNOMEDCT명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15013, 'oprt_icd9cm_cd', 15000, 'system', 15013);
insert into ph_item_attribute (item_id, caption) values (15013, '수술ICD9CM코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (15014, 'oprt_icd9cm_nm', 15000, 'system', 15014);
insert into ph_item_attribute (item_id, caption) values (15014, '수술ICD9CM명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15015, 'oprt_ldtm', 15000, 'system', 15015);
insert into ph_item_attribute (item_id, caption) values (15015, '수술소요시간');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15016, 'oprt_prps_cd', 15000, 'system', 15016, 40250);
insert into ph_item_attribute (item_id, caption, data_type) values (15016, '수술목적코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15016, 'oprt_prps_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15017, 'oprt_prps_nm', 15000, 'system', 15017);
-- insert into ph_item_attribute (item_id, caption) values (15017, '수술목적명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15018, 'oprt_mtcd', 15000, 'system', 15018, 40260);
insert into ph_item_attribute (item_id, caption, data_type) values (15018, '수술방법코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15018, 'oprt_mtnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15019, 'oprt_mtnm', 15000, 'system', 15019);
-- insert into ph_item_attribute (item_id, caption) values (15019, '수술방법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15020, 'oprt_anst_site_cd', 15000, 'system', 15020, 40240);
insert into ph_item_attribute (item_id, caption, data_type) values (15020, '수술마취부위코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15020, 'oprt_anst_site_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15021, 'oprt_anst_site_nm', 15000, 'system', 15021);
-- insert into ph_item_attribute (item_id, caption) values (15021, '수술마취부위명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15022, 'asa_scor_cd', 15000, 'system', 15022, 40010);
insert into ph_item_attribute (item_id, caption, data_type) values (15022, 'ASA점수코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15022, 'asa_scor_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15023, 'asa_scor_nm', 15000, 'system', 15023);
-- insert into ph_item_attribute (item_id, caption) values (15023, 'ASA점수명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15024, 'oprt_incs_mtcd', 15000, 'system', 15024, 40290);
insert into ph_item_attribute (item_id, caption, data_type) values (15024, '수술절개방법코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15024, 'oprt_incs_mtnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15025, 'oprt_incs_mtnm', 15000, 'system', 15025);
-- insert into ph_item_attribute (item_id, caption) values (15025, '수술절개방법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15026, 'oprt_crmr_tumr_loca_cd', 15000, 'system', 15026, 30340);
insert into ph_item_attribute (item_id, caption, data_type) values (15026, '수술둘레방향종양위치코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15026, 'oprt_crmr_tumr_loca_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15027, 'oprt_crmr_tumr_loca_nm', 15000, 'system', 15027);
-- insert into ph_item_attribute (item_id, caption) values (15027, '수술둘레방향종양위치명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15028, 'oprt_lngt_1_tumr_loca_cd', 15000, 'system', 15028, 30640);
insert into ph_item_attribute (item_id, caption, data_type) values (15028, '수술종방향1종양위치코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15028, 'oprt_lngt_1_tumr_loca_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15029, 'oprt_lngt_1_tumr_loca_nm', 15000, 'system', 15029);
-- insert into ph_item_attribute (item_id, caption) values (15029, '수술종방향1종양위치명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15030, 'oprt_lngt_2_tumr_loca_cd', 15000, 'system', 15030, 30650);
insert into ph_item_attribute (item_id, caption, data_type) values (15030, '수술종방향2종양위치코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15030, 'oprt_lngt_2_tumr_loca_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15031, 'oprt_lngt_2_tumr_loca_nm', 15000, 'system', 15031);
-- insert into ph_item_attribute (item_id, caption) values (15031, '수술종방향2종양위치명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15032, 'diag_lpex_yn_unid_spcd', 15000, 'system', 15032, 30380);
insert into ph_item_attribute (item_id, caption, data_type) values (15032, '진단복강경검사여부확인불가구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15032, 'diag_lpex_yn_unid_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15033, 'diag_lpex_yn_unid_spnm', 15000, 'system', 15033);
-- insert into ph_item_attribute (item_id, caption) values (15033, '진단복강경검사여부확인불가구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15034, 'oprm_ensp_use_yn_unid_spcd', 15000, 'system', 15034, 30380);
insert into ph_item_attribute (item_id, caption, data_type) values (15034, '수술장내시경사용여부확인불가구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15034, 'oprm_ensp_use_yn_unid_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15035, 'oprm_ensp_use_yn_unid_spnm', 15000, 'system', 15035);
-- insert into ph_item_attribute (item_id, caption) values (15035, '수술장내시경사용여부확인불가구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15036, 'flrn_imag_use_yn_unid_spcd', 15000, 'system', 15036, 30380);
insert into ph_item_attribute (item_id, caption, data_type) values (15036, '형광영상사용여부확인불가구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15036, 'flrn_imag_use_yn_unid_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15037, 'flrn_imag_use_yn_unid_spnm', 15000, 'system', 15037);
-- insert into ph_item_attribute (item_id, caption) values (15037, '형광영상사용여부확인불가구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15038, 'inop_antp_cd', 15000, 'system', 15038, 40280);
insert into ph_item_attribute (item_id, caption, data_type) values (15038, '수술시항암요법코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15038, 'inop_antp_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15039, 'inop_antp_nm', 15000, 'system', 15039);
-- insert into ph_item_attribute (item_id, caption) values (15039, '수술시항암요법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15040, 'adh_ibtr_use_yn_unid_spcd', 15000, 'system', 15040, 30380);
insert into ph_item_attribute (item_id, caption, data_type) values (15040, '유착방지제사용여부확인불가구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15040, 'adh_ibtr_use_yn_unid_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15041, 'adh_ibtr_use_yn_unid_spnm', 15000, 'system', 15041);
-- insert into ph_item_attribute (item_id, caption) values (15041, '유착방지제사용여부확인불가구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15042, 'adh_ibtr_gods_nm', 15000, 'system', 15042);
insert into ph_item_attribute (item_id, caption) values (15042, '유착방지제제품명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15043, 'omnl_srmv_rang_cd', 15000, 'system', 15043, 40090);
insert into ph_item_attribute (item_id, caption, data_type) values (15043, '그물막절제범위코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15043, 'omnl_srmv_rang_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15044, 'omnl_srmv_rang_nm', 15000, 'system', 15044);
-- insert into ph_item_attribute (item_id, caption) values (15044, '그물막절제범위명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15045, 'curdg_cd', 15000, 'system', 15045, 40100);
insert into ph_item_attribute (item_id, caption, data_type) values (15045, '근치도코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15045, 'curdg_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15046, 'curdg_nm', 15000, 'system', 15046);
-- insert into ph_item_attribute (item_id, caption) values (15046, '근치도명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15047, 'ln_srmv_dgre_cd', 15000, 'system', 15047, 40110);
insert into ph_item_attribute (item_id, caption, data_type) values (15047, '림프절절제정도코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15047, 'ln_srmv_dgre_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15048, 'ln_srmv_dgre_nm', 15000, 'system', 15048);
-- insert into ph_item_attribute (item_id, caption) values (15048, '림프절절제정도명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15049, 'ln_srmv_dgre_detl_cont', 15000, 'system', 15049);
insert into ph_item_attribute (item_id, caption) values (15049, '림프절절제정도상세내용');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15050, 'mrge_srmv_site_cd', 15000, 'system', 15050, 40500);
insert into ph_item_attribute (item_id, caption, data_type) values (15050, '합병절제부위코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15050, 'mrge_srmv_site_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15051, 'mrge_srmv_site_nm', 15000, 'system', 15051);
-- insert into ph_item_attribute (item_id, caption) values (15051, '합병절제부위명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15052, 'repr_kncd', 15000, 'system', 15052, 40490);
insert into ph_item_attribute (item_id, caption, data_type) values (15052, '재건술종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15052, 'repr_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15053, 'repr_knnm', 15000, 'system', 15053);
-- insert into ph_item_attribute (item_id, caption) values (15053, '재건술종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15054, 'repr_use_dvce_nm', 15000, 'system', 15054);
insert into ph_item_attribute (item_id, caption) values (15054, '재건술사용도구명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15055, 'repr_mtcd', 15000, 'system', 15055, 40460);
insert into ph_item_attribute (item_id, caption, data_type) values (15055, '재건술방법코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15055, 'repr_mtnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15056, 'repr_mtnm', 15000, 'system', 15056);
-- insert into ph_item_attribute (item_id, caption) values (15056, '재건술방법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15057, 'repr_aprmthd_cd', 15000, 'system', 15057, 40480);
insert into ph_item_attribute (item_id, caption, data_type) values (15057, '재건술접근법코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15057, 'repr_aprmthd_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15058, 'repr_aprmthd_nm', 15000, 'system', 15058);
-- insert into ph_item_attribute (item_id, caption) values (15058, '재건술접근법명');

insert into ph_item (id, title, category_id, created_by, order_no) values (15059, 'oprt_ebl_qty', 15000, 'system', 15059);
insert into ph_item_attribute (item_id, caption) values (15059, '수술추정실혈량');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (15060, 'asct_yn_unid_spcd', 15000, 'system', 15060, 30380);
insert into ph_item_attribute (item_id, caption, data_type) values (15060, '복수여부확인불가구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (15060, 'asct_yn_unid_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15061, 'asct_yn_unid_spnm', 15000, 'system', 15061);
-- insert into ph_item_attribute (item_id, caption) values (15061, '복수여부확인불가구분명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (15062, 'crtn_dt', 15000, 'system', 15062);
-- insert into ph_item_attribute (item_id, caption) values (15062, is '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (15063, 'idx', 15000, 'system', 15063);
-- insert into ph_item_attribute (item_id, caption) values (15063, is 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (15064, 'pact_id', 15000, 'system', 15054);
-- insert into ph_item_attribute (item_id, caption) values (15064, is 'UI용 comments');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (15065, 'procedure_cnte', 15000, 'system', 15065);
-- insert into ph_item_attribute (item_id, caption) values (15065, is 'UI용 PROCEDURE_CNTE내용');
insert into ph_item (id, title, category_id, created_by, order_no) values (15061, 'sort_seq', 15000, 'system', 15061);
insert into ph_item_attribute (item_id, caption) values (15061, '정렬순서');
