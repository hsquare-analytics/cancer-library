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
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_trtm_srpr_pk
    primary key (hosp_cd, pt_no, esd_srpr_ymd, esd_srpr_seq)
);
