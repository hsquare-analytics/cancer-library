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
    constraint gscn_trtm_rd_pk
    primary key (hosp_cd, pt_no, rdt_prsc_ymd, rdt_prsc_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (22000, 'GSCN.GSCN_TRTM_RD', '22.위암_치료_방사선', true, 22, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (22000, 'rdt_prsc_ymd', '22.위암_치료_방사선');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22001, 'hosp_cd', 22000, 'system', 22001);
-- insert into ph_item_attribute (item_id, caption, required) values (22001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (22002, 'pt_no', 22000, 'system', 22002);
insert into ph_item_attribute (item_id, caption) values (22002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (22002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (22003, 'rdt_prsc_ymd', 22000, 'system', 22003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (22003, '방사선치료처방일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (22004, 'rdt_prsc_seq', 22000, 'system', 22004);
insert into ph_item_attribute (item_id, caption, required) values (22004, '방사선치료처방순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (22005, 'rdt_kncd', 22000, 'system', 22005, 40180);
insert into ph_item_attribute (item_id, caption, data_type) values (22005, '방사선치료종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (22005, 'rdt_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22006, 'rdt_knnm', 22000, 'system', 22006);
-- insert into ph_item_attribute (item_id, caption) values (22006, '방사선치료종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (22007, 'rdt_cd', 22000, 'system', 22007);
insert into ph_item_attribute (item_id, caption) values (22007, '방사선치료코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (22008, 'rdt_nm', 22000, 'system', 22008);
insert into ph_item_attribute (item_id, caption) values (22008, '방사선치료명');

insert into ph_item (id, title, category_id, created_by, order_no) values (22009, 'rdt_edi_cd', 22000, 'system', 22009);
insert into ph_item_attribute (item_id, caption) values (22009, '방사선치료EDI코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (22010, 'rdt_edi_nm', 22000, 'system', 22010);
insert into ph_item_attribute (item_id, caption) values (22010, '방사선치료EDI명');

insert into ph_item (id, title, category_id, created_by, order_no) values (22011, 'rdt_smct_cd', 22000, 'system', 22011);
insert into ph_item_attribute (item_id, caption) values (22011, '방사선치료SNOMEDCT코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (22012, 'rdt_smct_nm', 22000, 'system', 22012);
insert into ph_item_attribute (item_id, caption) values (22012, '방사선치료SNOMEDCT명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (22013, 'rdt_prps_cd', 22000, 'system', 22013, 40130);
insert into ph_item_attribute (item_id, caption, data_type) values (22013, '방사선치료목적코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (22013, 'rdt_prps_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22014, 'rdt_prps_nm', 22000, 'system', 22014);
-- insert into ph_item_attribute (item_id, caption) values (22014, '방사선치료목적명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (22015, 'rdt_site_cd', 22000, 'system', 22015, 40140);
insert into ph_item_attribute (item_id, caption, data_type) values (22015, '방사선치료부위코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (22015, 'rdt_site_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22016, 'rdt_site_nm', 22000, 'system', 22016);
-- insert into ph_item_attribute (item_id, caption) values (22016, '방사선치료부위명');

insert into ph_item (id, title, category_id, created_by, order_no) values (22017, 'byst_rd_impl_nt', 22000, 'system', 22017);
insert into ph_item_attribute (item_id, caption) values (22017, '부위별방사선시행횟수');

insert into ph_item (id, title, category_id, created_by, order_no) values (22018, 'rd_cgy', 22000, 'system', 22018);
insert into ph_item_attribute (item_id, caption) values (22018, '방사선선량');

insert into ph_item (id, title, category_id, created_by, order_no) values (22019, 'byst_rd_totl_cgy', 22000, 'system', 22019);
insert into ph_item_attribute (item_id, caption) values (22019, '부위별방사선총선량');

insert into ph_item (id, title, category_id, created_by, order_no) values (22020, 'rdt_asmt_ymd', 22000, 'system', 22020);
insert into ph_item_attribute (item_id, caption, format, data_type) values (22020, '방사선치료평가일자', 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (22021, 'rdt_asmt_item_cd', 22000, 'system', 22021, 40200);
insert into ph_item_attribute (item_id, caption, data_type) values (22021, '방사선치료평가항목코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (22021, 'rdt_asmt_item_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22022, 'rdt_asmt_item_nm', 22000, 'system', 22022);
-- insert into ph_item_attribute (item_id, caption) values (22022, '방사선치료평가항목명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (22023, 'rdt_seff_perd_spcd', 22000, 'system', 22023, 40160);
insert into ph_item_attribute (item_id, caption, data_type) values (22023, '방사선치료부작용시기구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (22023, 'rdt_seff_perd_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22024, 'rdt_seff_perd_spnm', 22000, 'system', 22024);
-- insert into ph_item_attribute (item_id, caption) values (22024, '방사선치료부작용시기구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (22025, 'rdt_seff_kncd', 22000, 'system', 22025, 40170);
insert into ph_item_attribute (item_id, caption, data_type) values (22025, '방사선치료부작용종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (22025, 'rdt_seff_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22026, 'rdt_seff_knnm', 22000, 'system', 22026);
-- insert into ph_item_attribute (item_id, caption) values (22026, '방사선치료부작용종류명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (22027, 'rdt_seff_grcd', 22000, 'system', 22027, 40150);
insert into ph_item_attribute (item_id, caption, data_type) values (22027, '방사선치료부작용등급코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (22027, 'rdt_seff_grnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22028, 'rdt_seff_grnm', 22000, 'system', 22028);
-- insert into ph_item_attribute (item_id, caption) values (22028, '방사선치료부작용등급명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (22029, 'crtn_dt', 22000, 'system', 22029);
-- insert into ph_item_attribute (item_id, caption) values (22029, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (22030, 'idx', 22000, 'system', 22030);
-- insert into ph_item_attribute (item_id, caption) values (22030, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (22031, 'pact_id', 22000, 'system', 22031);
-- insert into ph_item_attribute (item_id, caption) values (22031, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (22032, 'comments', 22000, 'system', 22032);
-- insert into ph_item_attribute (item_id, caption) values (22032, 'UI용 comments');
insert into ph_item (id, title, category_id, created_by, order_no) values (22028, 'sort_seq', 22000, 'system', 22028);
insert into ph_item_attribute (item_id, caption) values (22028, '정렬순서');
