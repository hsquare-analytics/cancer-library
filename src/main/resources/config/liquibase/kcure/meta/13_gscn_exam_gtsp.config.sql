--작업일시: 221115 am10:02

DROP TABLE IF EXISTS GSCN.GSCN_EXAM_GTSP;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_GTSP_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_GTSP (
    hosp_cd             varchar(20) not null,
    pt_no               varchar(10) not null,
    stmc_edex_ymd       timestamp   not null,
    stmc_edex_seq       numeric(3)  not null,
    stmc_edex_prps_cd   varchar(20),
    stmc_edex_prps_nm   varchar(200),
    gtsp_tspc_cnt       numeric(3),
    stmc_edex_opn_cont  varchar(4000),
    stmc_edex_rslt_cont varchar(4000),
    stmc_edex_rslt_tpcd varchar(20),
    stmc_edex_rslt_tpnm varchar(200),
    gtsp_comp_grcd      varchar(20),
    gtsp_comp_grnm      varchar(200),
    gtsp_comp_cd        varchar(20),
    gtsp_comp_nm        varchar(200),
    crtn_dt             timestamp   not null,
    idx                 varchar(100),
    pact_id             varchar(50),
    comments            varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_exam_gtsp_pk
    primary key (hosp_cd, pt_no, stmc_edex_ymd, stmc_edex_seq)
);
