DROP TABLE IF EXISTS GSCN.GSCN_TRTM_DRIN;
DROP TABLE IF EXISTS GSCN.GSCN_TRTM_DRIN_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_TRTM_DRIN (
    hosp_cd                varchar(20) not null,
    pt_no                  varchar(10) not null,
    drug_prsc_ymd          timestamp   not null,
    drug_prsc_seq          numeric(3)  not null,
    drug_clcd              varchar(20),
    drug_clnm              varchar(200),
    drug_spcd              varchar(20),
    drug_spnm              varchar(200),
    drin_kncd              varchar(20),
    drin_knnm              varchar(200),
    drin_cd                varchar(20),
    drin_nm                varchar(200),
    drin_smct_cd           varchar(200),
    drin_smct_nm           varchar(1000),
    drug_cd                varchar(20),
    drug_nm                varchar(200),
    drug_edi_cd            varchar(20),
    drug_edi_nm            varchar(200),
    drug_atc_cd            varchar(20),
    drug_atc_nm            varchar(200),
    drug_rxnm_cd           varchar(20),
    drug_rxnm_nm           varchar(200),
    drug_prsc_capa         varchar(50),
    drug_prsc_dcnt         numeric(3),
    drug_injc_pth_cd       varchar(20),
    drug_injc_pth_nm       varchar(200),
    drug_prsc_capa_unit_cd varchar(20),
    drug_prsc_capa_unit_nm varchar(200),
    drug_mdct_dtrn_mcnt    numeric(3),
    crtn_dt                timestamp   not null,
    idx                    varchar(100),
    pact_id                varchar(50),
    comments               varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_trtm_drin_pk
    primary key (hosp_cd, pt_no, drug_prsc_ymd, drug_prsc_seq)
);
