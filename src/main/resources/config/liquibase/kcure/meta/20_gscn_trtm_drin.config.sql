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
    constraint gscn_trtm_drin_pk
    primary key (hosp_cd, pt_no, drug_prsc_ymd, drug_prsc_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (20000, 'GSCN.GSCN_TRTM_DRIN', '20.위암_치료_약제성분', true, 20, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (20000, 'drug_prsc_ymd', '20.위암_치료_약제성분');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (20001, 'hosp_cd', 20000, 'system', 20001);
-- insert into ph_item_attribute (item_id, caption, required) values (20001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (20002, 'pt_no', 20000, 'system', 20002);
insert into ph_item_attribute (item_id, caption) values (20002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (20002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (20003, 'drug_prsc_ymd', 20000, 'system', 20003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (20003, '약제처방일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (20004, 'drug_prsc_seq', 20000, 'system', 20004);
insert into ph_item_attribute (item_id, caption, required) values (20004, '약제처방순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (20005, 'drug_clcd', 20000, 'system', 20005, 40390);
insert into ph_item_attribute (item_id, caption, data_type) values (20005, '약제분류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (20005, 'drug_clnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (20006, 'drug_clnm', 20000, 'system', 20006);
-- insert into ph_item_attribute (item_id, caption) values (20006, '약제분류명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (20007, 'drug_spcd', 20000, 'system', 20007, 40380);
insert into ph_item_attribute (item_id, caption, data_type) values (20007, '약제구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (20007, 'drug_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (20008, 'drug_spnm', 20000, 'system', 20008);
-- insert into ph_item_attribute (item_id, caption) values (20008, '약제구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (20009, 'drin_kncd', 20000, 'system', 20009, 40400);
insert into ph_item_attribute (item_id, caption, data_type) values (20009, '약제성분종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (20009, 'drin_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (20010, 'drin_knnm', 20000, 'system', 20010);
-- insert into ph_item_attribute (item_id, caption) values (20010, '약제성분종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (20011, 'drin_cd', 20000, 'system', 20011);
insert into ph_item_attribute (item_id, caption) values (20011, '약제성분코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (20012, 'drin_nm', 20000, 'system', 20012);
insert into ph_item_attribute (item_id, caption) values (20012, '약제성분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (20013, 'drin_smct_cd', 20000, 'system', 20013);
insert into ph_item_attribute (item_id, caption) values (20013, '약제성분SNOMEDCT코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (20014, 'drin_smct_nm', 20000, 'system', 20014);
insert into ph_item_attribute (item_id, caption) values (20014, '약제성분SNOMEDCT명');

insert into ph_item (id, title, category_id, created_by, order_no) values (20015, 'drug_cd', 20000, 'system', 20015);
insert into ph_item_attribute (item_id, caption) values (20015, '약제코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (20016, 'drug_nm', 20000, 'system', 20016);
insert into ph_item_attribute (item_id, caption) values (20016, '약제명');

insert into ph_item (id, title, category_id, created_by, order_no) values (20017, 'drug_edi_cd', 20000, 'system', 20017);
insert into ph_item_attribute (item_id, caption) values (20017, '약제EDI코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (20018, 'drug_edi_nm', 20000, 'system', 20018);
insert into ph_item_attribute (item_id, caption) values (20018, '약제EDI명');

insert into ph_item (id, title, category_id, created_by, order_no) values (20019, 'drug_atc_cd', 20000, 'system', 20019);
insert into ph_item_attribute (item_id, caption) values (20019, '약제ATC코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (20020, 'drug_atc_nm', 20000, 'system', 20020);
insert into ph_item_attribute (item_id, caption) values (20020, '약제ATC명');

insert into ph_item (id, title, category_id, created_by, order_no) values (20021, 'drug_rxnm_cd', 20000, 'system', 20021);
insert into ph_item_attribute (item_id, caption) values (20021, '약제RXNORM코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (20022, 'drug_rxnm_nm', 20000, 'system', 20022);
insert into ph_item_attribute (item_id, caption) values (20022, '약제RXNORM명');

insert into ph_item (id, title, category_id, created_by, order_no) values (20023, 'drug_prsc_capa', 20000, 'system', 20023);
insert into ph_item_attribute (item_id, caption) values (20023, '약제처방용량');

insert into ph_item (id, title, category_id, created_by, order_no) values (20024, 'drug_prsc_dcnt', 20000, 'system', 20024);
insert into ph_item_attribute (item_id, caption) values (20024, '약제처방일수');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (20025, 'drug_injc_pth_cd', 20000, 'system', 20025, 40440);
insert into ph_item_attribute (item_id, caption, data_type) values (20025, '약제투여경로코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (20025, 'drug_injc_pth_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (20026, 'drug_injc_pth_nm', 20000, 'system', 20026);
-- insert into ph_item_attribute (item_id, caption) values (20026, '약제투여경로명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (20027, 'drug_prsc_capa_unit_cd', 20000, 'system', 20027, 40420);
insert into ph_item_attribute (item_id, caption, data_type) values (20027, '약제처방용량단위코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (20027, 'drug_prsc_capa_unit_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (20028, 'drug_prsc_capa_unit_nm', 20000, 'system', 20028);
-- insert into ph_item_attribute (item_id, caption) values (20028, '약제처방용량단위명');

insert into ph_item (id, title, category_id, created_by, order_no) values (20029, 'drug_mdct_dtrn_mcnt', 20000, 'system', 20029);
insert into ph_item_attribute (item_id, caption) values (20029, '약제투약기간월수');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (20030, 'crtn_dt', 20000, 'system', 20030);
-- insert into ph_item_attribute (item_id, caption) values (20030, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (20031, 'idx', 20000, 'system', 20031);
-- insert into ph_item_attribute (item_id, caption) values (20031, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (20032, 'pact_id', 20000, 'system', 20032);
-- insert into ph_item_attribute (item_id, caption) values (20032, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (20033, 'comments', 20000, 'system', 20033);
-- insert into ph_item_attribute (item_id, caption) values (20033, 'UI용 comments');
insert into ph_item (id, title, category_id, created_by, order_no) values (20030, 'sort_seq', 20000, 'system', 5);
insert into ph_item_attribute (item_id, caption) values (20030, '정렬순번');

