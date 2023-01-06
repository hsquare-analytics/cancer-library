DROP TABLE IF EXISTS GSCN.GSCN_TRTM_RD;
DROP TABLE IF EXISTS GSCN.GSCN_TRTM_RD_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_TRTM_RD (
    hosp_cd            varchar(20) not null,
    pt_no              varchar(10) not null,
    rdt_prsc_ymd       timestamp   not null,
    rdt_prsc_seq       numeric(3)  not null,
    rdt_kncd           varchar(20),
    rdt_knnm           varchar(200),
    rdt_cd             varchar(20),
    rdt_nm             varchar(200),
    rdt_edi_cd         varchar(20),
    rdt_edi_nm         varchar(200),
    rdt_smct_cd        varchar(200),
    rdt_smct_nm        varchar(1000),
    rdt_prps_cd        varchar(20),
    rdt_prps_nm        varchar(200),
    rdt_site_cd        varchar(20),
    rdt_site_nm        varchar(200),
    byst_rd_impl_nt    numeric(3),
    rd_cgy             numeric(5),
    byst_rd_totl_cgy   numeric(3),
    rdt_asmt_ymd       varchar(8),
    rdt_asmt_item_cd   varchar(20),
    rdt_asmt_item_nm   varchar(200),
    rdt_seff_perd_spcd varchar(20),
    rdt_seff_perd_spnm varchar(200),
    rdt_seff_kncd      varchar(20),
    rdt_seff_knnm      varchar(200),
    rdt_seff_grcd      varchar(20),
    rdt_seff_grnm      varchar(200),
    crtn_dt            timestamp   not null,
    idx                varchar(100),
    pact_id            varchar(50),
    comments           varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_trtm_rd_pk
    primary key (hosp_cd, pt_no, rdt_prsc_ymd, rdt_prsc_seq)
);
