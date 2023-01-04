--작업일시: 221115 am10:02

DROP TABLE IF EXISTS GSCN.GSCN_EXAM_HPLI;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_HPLI_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_HPLI (
    hosp_cd           varchar(20) not null,
    pt_no             varchar(10) not null,
    hpli_exam_ymd     timestamp   not null,
    hpli_exam_seq     numeric(3)  not null,
    hpli_exam_mtcd    varchar(20),
    hpli_exam_mtnm    varchar(200),
    hpli_exam_rslt_cd varchar(20),
    hpli_exam_rslt_nm varchar(200),
    crtn_dt           timestamp   not null,
    idx               varchar(100),
    pact_id           varchar(50),
    exrs_cnte         varchar(4000),
    exm_nm            varchar(50),
    exm_no            varchar(50),
    comments          varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_exam_hpli_pk
    primary key (hosp_cd, pt_no, hpli_exam_ymd, hpli_exam_seq)
);
