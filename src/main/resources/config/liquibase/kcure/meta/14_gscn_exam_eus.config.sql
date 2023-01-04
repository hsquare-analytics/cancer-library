DROP TABLE IF EXISTS GSCN.GSCN_EXAM_EUS;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_EUS_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_EUS (
    hosp_cd            varchar(20) not null,
    pt_no              varchar(10) not null,
    eus_exam_ymd       timestamp   not null,
    eus_exam_seq       numeric(3)  not null,
    eus_t_stag_cd      varchar(20),
    eus_t_stag_nm      varchar(200),
    eus_n_stag_cd      varchar(20),
    eus_n_stag_nm      varchar(200),
    eus_m_stag_cd      varchar(20),
    eus_m_stag_nm      varchar(200),
    eus_exam_opn_cont  varchar(4000),
    eus_exam_rslt_cont varchar(4000),
    eus_comp_cd        varchar(20),
    eus_comp_nm        varchar(200),
    crtn_dt            timestamp   not null,
    idx                varchar(100),
    pact_id            varchar(50),
    exm_cd_nm          varchar(4000),
    comments           varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_exam_eus_pk
    primary key (hosp_cd, pt_no, eus_exam_ymd, eus_exam_seq)
);
