DROP TABLE IF EXISTS GSCN.GSCN_TRTM_BLTR;
DROP TABLE IF EXISTS GSCN.GSCN_TRTM_BLTR_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_TRTM_BLTR (
    hosp_cd       varchar(20) not null,
    pt_no         varchar(10) not null,
    bltr_prsc_ymd timestamp   not null,
    bltr_prsc_seq numeric(3)  not null,
    blpt_kncd     varchar(20),
    blpt_knnm     varchar(200),
    blpt_cd       varchar(20),
    blpt_nm       varchar(200),
    bltr_pack_cnt numeric(3),
    bltr_totl_qty numeric(8),
    crtn_dt       timestamp   not null,
    idx           varchar(100),
    pact_id       varchar(50),
    comments      varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_trtm_bltr_pk
    primary key (hosp_cd, pt_no, bltr_prsc_ymd, bltr_prsc_seq)
);
