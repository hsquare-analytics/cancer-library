DROP TABLE IF EXISTS GSCN.GSCN_TRTM_ANTP;
DROP TABLE IF EXISTS GSCN.GSCN_TRTM_ANTP_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_TRTM_ANTP (
    hosp_cd                     varchar(20) not null,
    pt_no                       varchar(10) not null,
    antp_strt_ymd               timestamp   not null,
    antp_seq                    numeric(3)  not null,
    antp_end_ymd                varchar(8),
    antp_line_cnt               numeric(3),
    antp_totl_cycl_cnt          numeric(3),
    antp_trtm_prps_cd           varchar(20),
    antp_trtm_prps_nm           varchar(200),
    antp_nm                     varchar(200),
    antp_temp_stop_yn_unid_spcd varchar(20),
    antp_temp_stop_yn_unid_spnm varchar(50),
    antp_end_resn_cd            varchar(20),
    antp_end_resn_nm            varchar(200),
    antp_asmt_ymd               varchar(8),
    antp_asmt_item_cd           varchar(20),
    antp_asmt_item_nm           varchar(200),
    antp_seff_cd                varchar(20),
    antp_seff_nm                varchar(200),
    antp_seff_grcd              varchar(20),
    antp_seff_grnm              varchar(200),
    crtn_dt                     timestamp   not null,
    idx                         varchar(100),
    pact_id                     varchar(50),
    comments                    varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_trtm_antp_pk
    primary key (hosp_cd, pt_no, antp_strt_ymd, antp_seq)
);
