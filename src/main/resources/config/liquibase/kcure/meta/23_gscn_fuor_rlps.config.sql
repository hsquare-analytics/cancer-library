DROP TABLE IF EXISTS GSCN.GSCN_FUOR_RLPS;
DROP TABLE IF EXISTS GSCN.GSCN_FUOR_RLPS_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_FUOR_RLPS (
    hosp_cd        varchar(20) not null,
    pt_no          varchar(10) not null,
    rldg_ymd       timestamp   not null,
    rldg_seq       numeric(3)  not null,
    rldg_mtcd      varchar(20),
    rldg_mtnm      varchar(200),
    rlps_site_cd   varchar(20),
    rlps_site_nm   varchar(200),
    rlps_kncd      varchar(20),
    rlps_knnm      varchar(200),
    rlps_trtm_cont varchar(5),
    crtn_dt        timestamp   not null,
    idx            varchar(100),
    pact_id        varchar(50),
    comments       varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_fuor_rlps_pk
    primary key (hosp_cd, pt_no, rldg_ymd, rldg_seq)
);
