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
    constraint gscn_exam_sgpt_pk
    primary key (hosp_cd, pt_no, srgc_ptem_ymd, srgc_ptem_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (17000, 'GSCN.GSCN_EXAM_SGPT', '17.위암_검사_외과병리', true, 17, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (17000, 'srgc_ptem_ymd', '17.위암_검사_외과병리');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17001, 'hosp_cd', 17000, 'system', 17001);
-- insert into ph_item_attribute (item_id, caption, required) values (17001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (17002, 'pt_no', 17000, 'system', 17002);
insert into ph_item_attribute (item_id, caption) values (17002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (17002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (17003, 'srgc_ptem_ymd', 17000, 'system', 17003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (17003, '외과병리검사일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (17004, 'srgc_ptem_seq', 17000, 'system', 17004);
insert into ph_item_attribute (item_id, caption, required) values (17004, '외과병리검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (17005, 'sgpt_read_ymd', 17000, 'system', 17005);
insert into ph_item_attribute (item_id, caption, format, data_type) values (17005, '외과병리판독일자', 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17006, 'sgpt_hvst_site_cd', 17000, 'system', 17006, 30430);
insert into ph_item_attribute (item_id, caption, data_type) values (17006, '외과병리채취부위코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17006, 'sgpt_hvst_site_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17007, 'sgpt_hvst_site_nm', 17000, 'system', 17007);
-- insert into ph_item_attribute (item_id, caption) values (17007, '외과병리채취부위명');

insert into ph_item (id, title, category_id, created_by, order_no) values (17008, 'srgc_ptem_rslt_tumr_cnt', 17000, 'system', 17008);
insert into ph_item_attribute (item_id, caption) values (17008, '외과병리검사결과종양수(numeric(3) -> varchar(10))');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17009, 'htlg_diag_cd', 17000, 'system', 17009, 30540);
insert into ph_item_attribute (item_id, caption, data_type) values (17009, '조직학적진단코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17009, 'htlg_diag_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17010, 'htlg_diag_nm', 17000, 'system', 17010);
-- insert into ph_item_attribute (item_id, caption) values (17010, '조직학적진단명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17011, 'htlg_dfgd_cd', 17000, 'system', 17011, 30530);
insert into ph_item_attribute (item_id, caption, data_type) values (17011, '조직학적분화도코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17011, 'htlg_dfgd_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17012, 'htlg_dfgd_nm', 17000, 'system', 17012);
-- insert into ph_item_attribute (item_id, caption) values (17012, '조직학적분화도명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17013, 'afop_crmr_tumr_loca_cd', 17000, 'system', 17013, 30340);
insert into ph_item_attribute (item_id, caption, data_type) values (17013, '수술후둘레방향종양위치코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17013, 'afop_crmr_tumr_loca_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17014, 'afop_crmr_tumr_loca_nm', 17000, 'system', 17014);
-- insert into ph_item_attribute (item_id, caption) values (17014, '수술후둘레방향종양위치명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17015, 'afop_lngt_1_tumr_loca_cd', 17000, 'system', 17015, 30640);
insert into ph_item_attribute (item_id, caption, data_type) values (17015, '수술후종방향1종양위치코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17015, 'afop_lngt_1_tumr_loca_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17016, 'afop_lngt_1_tumr_loca_nm', 17000, 'system', 17016);
-- insert into ph_item_attribute (item_id, caption) values (17016, '수술후종방향1종양위치명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17017, 'afop_lngt_2_tumr_loca_cd', 17000, 'system', 17017, 30650);
insert into ph_item_attribute (item_id, caption, data_type) values (17017, '수술후종방향2종양위치코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17017, 'afop_lngt_2_tumr_loca_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17018, 'afop_lngt_2_tumr_loca_nm', 17000, 'system', 17018);
-- insert into ph_item_attribute (item_id, caption) values (17018, '수술후종방향2종양위치명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17118, 'gros_tpcd', 17000, 'system', 17018, 30070);
insert into ph_item_attribute (item_id, caption, data_type) values (17118, 'GROSS유형코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17118, 'gros_tpnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17019, 'gros_tpnm', 17000, 'system', 17019);
-- insert into ph_item_attribute (item_id, caption) values (17019, 'GROSS유형명');

insert into ph_item (id, title, category_id, created_by, order_no) values (17020, 'gros_type_cont', 17000, 'system', 17020);
insert into ph_item_attribute (item_id, caption) values (17020, 'GROSS유형내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (17021, 'tumr_wdth_lnth_vl', 17000, 'system', 17021);
insert into ph_item_attribute (item_id, caption) values (17021, '종양가로길이값');

insert into ph_item (id, title, category_id, created_by, order_no) values (17022, 'tumr_lgtd_lnth_vl', 17000, 'system', 17022);
insert into ph_item_attribute (item_id, caption) values (17022, '종양세로길이값');

insert into ph_item (id, title, category_id, created_by, order_no) values (17023, 'tumr_hght_vl', 17000, 'system', 17023);
insert into ph_item_attribute (item_id, caption) values (17023, '종양높이값');

insert into ph_item (id, title, category_id, created_by, order_no) values (17024, 'tumr_max_diam_vl', 17000, 'system', 17024);
insert into ph_item_attribute (item_id, caption) values (17024, '종양최대직경값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17025, 'iflt_orgn_cd', 17000, 'system', 17025, 30600);
insert into ph_item_attribute (item_id, caption, data_type) values (17025, '침습장기코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17025, 'iflt_orgn_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17026, 'iflt_orgn_nm', 17000, 'system', 17026);
-- insert into ph_item_attribute (item_id, caption) values (17026, '침습장기명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17027, 'inva_dgre_cd', 17000, 'system', 17027, 30610);
insert into ph_item_attribute (item_id, caption, data_type) values (17027, '침윤정도코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17027, 'inva_dgre_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17028, 'inva_dgre_nm', 17000, 'system', 17028);
-- insert into ph_item_attribute (item_id, caption) values (17028, '침윤정도명');

insert into ph_item (id, title, category_id, created_by, order_no) values (17029, 'inva_dpth_vl', 17000, 'system', 17029);
insert into ph_item_attribute (item_id, caption) values (17029, '침윤깊이값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17030, 'lymp_inva_ex_yn_spcd', 17000, 'system', 17030, 30550);
insert into ph_item_attribute (item_id, caption, data_type) values (17030, '림프성침윤존재여부구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17030, 'lymp_inva_ex_yn_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17031, 'lymp_inva_ex_yn_spnm', 17000, 'system', 17031);
-- insert into ph_item_attribute (item_id, caption) values (17031, '림프성침윤존재여부구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17032, 'vasc_inva_ex_yn_spcd', 17000, 'system', 17032, 30550);
insert into ph_item_attribute (item_id, caption, data_type) values (17032, '혈관성침윤존재여부구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17032, 'vasc_inva_ex_yn_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17033, 'vasc_inva_ex_yn_spnm', 17000, 'system', 17033);
-- insert into ph_item_attribute (item_id, caption) values (17033, '혈관성침윤존재여부구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17133, 'nerv_prex_ex_yn_spcd', 17000, 'system', 17033, 30550);
insert into ph_item_attribute (item_id, caption, data_type) values (17133, '신경주위침윤존재여부구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17133, 'nerv_prex_ex_yn_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17034, 'nerv_prex_ex_yn_spnm', 17000, 'system', 17034);
-- insert into ph_item_attribute (item_id, caption) values (17034, '신경주위침윤존재여부구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17035, 'oprt_pmrg_rlcr_invl_yn_spcd', 17000, 'system', 17035, 30630);
insert into ph_item_attribute (item_id, caption, data_type) values (17035, '수술근위절제면잔존암포함여부구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17035, 'oprt_pmrg_rlcr_invl_yn_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17036, 'oprt_pmrg_rlcr_invl_yn_spnm', 17000, 'system', 17036);
-- insert into ph_item_attribute (item_id, caption) values (17036, '수술근위절제면잔존암포함여부구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (17037, 'oprt_pmrg_size_vl', 17000, 'system', 17037);
insert into ph_item_attribute (item_id, caption) values (17037, '수술근위절제면크기값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17038, 'oprt_dmrg_rlcr_invl_yn_spcd', 17000, 'system', 17038, 30630);
insert into ph_item_attribute (item_id, caption, data_type) values (17038, '수술원위절제면잔존암포함여부구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17038, 'oprt_dmrg_rlcr_invl_yn_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17039, 'oprt_dmrg_rlcr_invl_yn_spnm', 17000, 'system', 17039);
-- insert into ph_item_attribute (item_id, caption) values (17039, '수술원위절제면잔존암포함여부구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (17040, 'oprt_dmrg_size_vl', 17000, 'system', 17040);
insert into ph_item_attribute (item_id, caption) values (17040, '수술원위절제면크기값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17041, 'stes_bnst_cncr_clcd', 17000, 'system', 17041, 30480);
insert into ph_item_attribute (item_id, caption, data_type) values (17041, '위식도경계부위암분류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17041, 'stes_bnst_cncr_clnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17042, 'stes_bnst_cncr_clnm', 17000, 'system', 17042);
-- insert into ph_item_attribute (item_id, caption) values (17042, '위식도경계부위암분류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (17043, 'totl_ln_cnt', 17000, 'system', 17043);
insert into ph_item_attribute (item_id, caption) values (17043, '총림프절수( numeric(3) -> varchar(100))');

insert into ph_item (id, title, category_id, created_by, order_no) values (17044, 'pstv_ln_cnt', 17000, 'system', 17044);
insert into ph_item_attribute (item_id, caption) values (17044, '양성림프절수');

insert into ph_item (id, title, category_id, created_by, order_no) values (17045, 'ln_bylc_mtst_cont', 17000, 'system', 17045);
insert into ph_item_attribute (item_id, caption) values (17045, '림프절위치별전이내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (17046, 'ajcc_yr', 17000, 'system', 17046);
insert into ph_item_attribute (item_id, caption) values (17046, 'AJCC년도');

insert into ph_item (id, title, category_id, created_by, order_no) values (17047, 'afop_path_tnm_stag_vl', 17000, 'system', 17047);
insert into ph_item_attribute (item_id, caption) values (17047, '수술후병리TNM병기값');

insert into ph_item (id, title, category_id, created_by, order_no) values (17048, 'afop_path_t_stag_vl', 17000, 'system', 17048);
insert into ph_item_attribute (item_id, caption) values (17048, '수술후병리T병기값');

insert into ph_item (id, title, category_id, created_by, order_no) values (17049, 'afop_path_n_stag_vl', 17000, 'system', 17049);
insert into ph_item_attribute (item_id, caption) values (17049, '수술후병리N병기값');

insert into ph_item (id, title, category_id, created_by, order_no) values (17050, 'afop_path_m_stag_vl', 17000, 'system', 17050);
insert into ph_item_attribute (item_id, caption) values (17050, '수술후병리M병기값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17051, 'esd_vmrg_rlcr_pstv_yn_spcd', 17000, 'system', 17051, 30370);
insert into ph_item_attribute (item_id, caption, data_type) values (17051, 'ESD수직절제면잔존암양성여부구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17051, 'esd_vmrg_rlcr_pstv_yn_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17052, 'esd_vmrg_rlcr_pstv_yn_spnm', 17000, 'system', 17052);
-- insert into ph_item_attribute (item_id, caption) values (17052, 'ESD수직절제면잔존암양성여부구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (17053, 'esd_vmrg_vl', 17000, 'system', 17053);
insert into ph_item_attribute (item_id, caption) values (17053, 'ESD수직절제면값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (17054, 'esd_hmrg_rlcr_pstv_yn_spcd', 17000, 'system', 17054, 30370);
insert into ph_item_attribute (item_id, caption, data_type) values (17054, 'ESD수평절제면잔존암양성여부구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (17054, 'esd_hmrg_rlcr_pstv_yn_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17055, 'esd_hmrg_rlcr_pstv_yn_spnm', 17000, 'system', 17055);
-- insert into ph_item_attribute (item_id, caption) values (17055, 'ESD수평절제면잔존암양성여부구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (17056, 'esd_hmrg_vl', 17000, 'system', 17056);
insert into ph_item_attribute (item_id, caption) values (17056, 'ESD수평절제면값');

insert into ph_item (id, title, category_id, created_by, order_no) values (17057, 'esd_hmrg_rlcr_lnth_vl', 17000, 'system', 17057);
insert into ph_item_attribute (item_id, caption) values (17057, 'ESD수평절제면잔존암길이값');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (17058, 'crtn_dt', 17000, 'system', 17058);
-- insert into ph_item_attribute (item_id, caption) values (17058, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (17059, 'idx', 17000, 'system', 17059);
-- insert into ph_item_attribute (item_id, caption) values (17059, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (17060, 'pact_id', 17000, 'system', 17060);
-- insert into ph_item_attribute (item_id, caption) values (17060, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (17061, 'comments', 17000, 'system', 17061);
-- insert into ph_item_attribute (item_id, caption) values (17061, 'UI용 comments');
insert into ph_item (id, title, category_id, created_by, order_no) values (17058, 'sort_seq', 17000, 'system', 5);
insert into ph_item_attribute (item_id, caption) values (17058, '정렬순번');
