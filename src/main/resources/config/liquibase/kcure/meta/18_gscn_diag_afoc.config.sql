DROP TABLE IF EXISTS GSCN.GSCN_DIAG_AFOC;
DROP TABLE IF EXISTS GSCN.GSCN_DIAG_AFOC_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_DIAG_AFOC (
    hosp_cd            varchar(20) not null,
    pt_no              varchar(10) not null,
    comp_ocrn_oprt_ymd timestamp   not null,
    comp_ocrn_oprt_seq numeric(3)  not null,
    afoc_clcd          varchar(20),
    afoc_clnm          varchar(200),
    afoc_cd            varchar(20),
    afoc_nm            varchar(200),
    afop_etc_comp_cont varchar(4000),
    crtn_dt            timestamp   not null,
    idx                varchar(100),
    pact_id            varchar(50),
    comments           varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_diag_afoc_pk
    primary key (hosp_cd, pt_no, comp_ocrn_oprt_ymd, comp_ocrn_oprt_seq)
);
