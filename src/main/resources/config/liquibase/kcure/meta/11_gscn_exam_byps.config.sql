DROP TABLE IF EXISTS GSCN.GSCN_EXAM_BYPS;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_BYPS_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_BYPS
(
    hosp_cd        varchar(20) not null,
    pt_no          varchar(10) not null,
    bpsy_ymd       timestamp   not null,
    bpsy_seq       numeric(3)  not null,
    bpsy_read_ymd  timestamp,
    bpsy_site_cd   varchar(20),
    bpsy_site_nm   varchar(200),
    bpsy_mtcd      varchar(20),
    bpsy_mtnm      varchar(200),
    bpsy_mthd_kncd varchar(20),
    bpsy_mthd_knnm varchar(200),
    bpsy_rslt_cont varchar(2000),
    htlg_diag_cd   varchar(20),
    htlg_diag_nm   varchar(200),
    htlg_dfgd_cd   varchar(20),
    htlg_dfgd_nm   varchar(200),
    crtn_dt        timestamp   not null,
    idx            varchar(100),
    exm_no         varchar(50),
    comments       varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_exam_byps_pk
    primary key (hosp_cd, pt_no, bpsy_ymd, bpsy_seq)
    );
