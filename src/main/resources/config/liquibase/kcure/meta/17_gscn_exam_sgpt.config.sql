DROP TABLE IF EXISTS GSCN.GSCN_EXAM_SGPT;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_SGPT_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_SGPT (
    hosp_cd                     varchar(20) not null,
    pt_no                       varchar(10) not null,
    srgc_ptem_ymd               timestamp   not null,
    srgc_ptem_seq               numeric(3)  not null,
    sgpt_read_ymd               timestamp,
    sgpt_hvst_site_cd           varchar(20),
    sgpt_hvst_site_nm           varchar(200),
    srgc_ptem_rslt_tumr_cnt     varchar(10),
    htlg_diag_cd                varchar(20),
    htlg_diag_nm                varchar(200),
    htlg_dfgd_cd                varchar(20),
    htlg_dfgd_nm                varchar(200),
    afop_crmr_tumr_loca_cd      varchar(20),
    afop_crmr_tumr_loca_nm      varchar(200),
    afop_lngt_1_tumr_loca_cd    varchar(20),
    afop_lngt_1_tumr_loca_nm    varchar(200),
    afop_lngt_2_tumr_loca_cd    varchar(20),
    afop_lngt_2_tumr_loca_nm    varchar(200),
    gros_tpcd                   varchar(20),
    gros_tpnm                   varchar(200),
    gros_type_cont              varchar(200),
    tumr_wdth_lnth_vl           numeric(4, 1),
    tumr_lgtd_lnth_vl           numeric(4, 1),
    tumr_hght_vl                numeric(4, 1),
    tumr_max_diam_vl            numeric(4, 1),
    iflt_orgn_cd                varchar(20),
    iflt_orgn_nm                varchar(200),
    inva_dgre_cd                varchar(20),
    inva_dgre_nm                varchar(200),
    inva_dpth_vl                numeric(4),
    lymp_inva_ex_yn_spcd        varchar(20),
    lymp_inva_ex_yn_spnm        varchar(50),
    vasc_inva_ex_yn_spcd        varchar(20),
    vasc_inva_ex_yn_spnm        varchar(50),
    nerv_prex_ex_yn_spcd        varchar(20),
    nerv_prex_ex_yn_spnm        varchar(50),
    oprt_pmrg_rlcr_invl_yn_spcd varchar(20),
    oprt_pmrg_rlcr_invl_yn_spnm varchar(50),
    oprt_pmrg_size_vl           numeric(5, 2),
    oprt_dmrg_rlcr_invl_yn_spcd varchar(20),
    oprt_dmrg_rlcr_invl_yn_spnm varchar(50),
    oprt_dmrg_size_vl           numeric(5, 2),
    stes_bnst_cncr_clcd         varchar(20),
    stes_bnst_cncr_clnm         varchar(200),
    totl_ln_cnt                 varchar(100),
    pstv_ln_cnt                 varchar(100),
    ln_bylc_mtst_cont           varchar(4000),
    ajcc_yr                     varchar(4),
    afop_path_tnm_stag_vl       varchar(20),
    afop_path_t_stag_vl         varchar(20),
    afop_path_n_stag_vl         varchar(20),
    afop_path_m_stag_vl         varchar(20),
    esd_vmrg_rlcr_pstv_yn_spcd  varchar(20),
    esd_vmrg_rlcr_pstv_yn_spnm  varchar(50),
    esd_vmrg_vl                 numeric(4),
    esd_hmrg_rlcr_pstv_yn_spcd  varchar(20),
    esd_hmrg_rlcr_pstv_yn_spnm  varchar(50),
    esd_hmrg_vl                 numeric(4),
    esd_hmrg_rlcr_lnth_vl       numeric(4),
    crtn_dt                     timestamp   not null,
    idx                         varchar(100),
    pact_id                     varchar(50),
    comments                    varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    constraint gscn_exam_sgpt_pk
    primary key (hosp_cd, pt_no, srgc_ptem_ymd, srgc_ptem_seq)
);
