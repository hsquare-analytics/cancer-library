DROP TABLE IF EXISTS GSCN.GSCN_TRTM_ANTP;
DROP TABLE IF EXISTS GSCN.GSCN_TRTM_ANTP_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_TRTM_ANTP (
    hosp_cd                     varchar(20) not null,
    pt_no                       varchar(10) not null,
    antp_strt_ymd               timestamp   not null,
    antp_seq                    numeric(3)  not null,
    antp_end_ymd                varchar(8),
    antp_line_cnt               numeric(3),
    antp_totl_cycl_cnt          numeric(3),
    antp_trtm_prps_cd           varchar(20),
    antp_trtm_prps_nm           varchar(200),
    antp_nm                     varchar(200),
    antp_temp_stop_yn_unid_spcd varchar(20),
    antp_temp_stop_yn_unid_spnm varchar(50),
    antp_end_resn_cd            varchar(20),
    antp_end_resn_nm            varchar(200),
    antp_asmt_ymd               varchar(8),
    antp_asmt_item_cd           varchar(20),
    antp_asmt_item_nm           varchar(200),
    antp_seff_cd                varchar(20),
    antp_seff_nm                varchar(200),
    antp_seff_grcd              varchar(20),
    antp_seff_grnm              varchar(200),
    crtn_dt                     timestamp   not null,
    idx                         varchar(100),
    pact_id                     varchar(50),
    comments                    varchar(4000),
    constraint gscn_trtm_antp_pk
    primary key (hosp_cd, pt_no, antp_strt_ymd, antp_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (21000, 'GSCN.GSCN_TRTM_ANTP', '21.위암_치료_항암요법', true, 21, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (21000, null, '21.위암_치료_항암요법');

insert into ph_item (id, title, category_id, created_by, order_no) values (21001, 'hosp_cd', 21000, 'system', 21001);
insert into ph_item_attribute (item_id, caption, required) values (21001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (21002, 'pt_no', 21000, 'system', 21002);
insert into ph_item_attribute (item_id, caption) values (21002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (21002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (21003, 'antp_strt_ymd', 21000, 'system', 21003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (21003, '항암요법시작일자', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (21004, 'antp_seq', 21000, 'system', 21004);
insert into ph_item_attribute (item_id, caption, required) values (21004, '항암요법순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (21005, 'antp_end_ymd', 21000, 'system', 21005);
insert into ph_item_attribute (item_id, caption, format, data_type) values (21005, '항암요법종료일자', 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (21006, 'antp_line_cnt', 21000, 'system', 21006);
insert into ph_item_attribute (item_id, caption) values (21006, '항암요법라인수');

insert into ph_item (id, title, category_id, created_by, order_no) values (21007, 'antp_totl_cycl_cnt', 21000, 'system', 21007);
insert into ph_item_attribute (item_id, caption) values (21007, '항암요법총주기수');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (21008, 'antp_trtm_prps_cd', 21000, 'system', 21008, 40560);
insert into ph_item_attribute (item_id, caption, data_type) values (21008, '항암요법치료목적코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (21008, 'antp_trtm_prps_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (21009, 'antp_trtm_prps_nm', 21000, 'system', 21009);
-- insert into ph_item_attribute (item_id, caption) values (21009, '항암요법치료목적명');

insert into ph_item (id, title, category_id, created_by, order_no) values (21010, 'antp_nm', 21000, 'system', 21010);
insert into ph_item_attribute (item_id, caption) values (21010, '항암요법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (21011, 'antp_temp_stop_yn_unid_spcd', 21000, 'system', 21011, 30380);
insert into ph_item_attribute (item_id, caption, data_type) values (21011, '항암요법임시중단여부확인불가구분코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (21011, 'antp_temp_stop_yn_unid_spnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (21012, 'antp_temp_stop_yn_unid_spnm', 21000, 'system', 21012);
-- insert into ph_item_attribute (item_id, caption) values (21012, '항암요법임시중단여부확인불가구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (21013, 'antp_end_resn_cd', 21000, 'system', 21013, 40550);
insert into ph_item_attribute (item_id, caption, data_type) values (21013, '항암요법종료이유코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (21013, 'antp_end_resn_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (21014, 'antp_end_resn_nm', 21000, 'system', 21014);
-- insert into ph_item_attribute (item_id, caption) values (21014, '항암요법종료이유명');

insert into ph_item (id, title, category_id, created_by, order_no) values (21015, 'antp_asmt_ymd', 21000, 'system', 21015);
insert into ph_item_attribute (item_id, caption, format, data_type) values (21015, '항암요법평가일자', 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (21016, 'antp_asmt_item_cd', 21000, 'system', 21016, 40570);
insert into ph_item_attribute (item_id, caption, data_type) values (21016, '항암요법평가항목코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (21016, 'antp_asmt_item_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (21017, 'antp_asmt_item_nm', 21000, 'system', 21017);
-- insert into ph_item_attribute (item_id, caption) values (21017, '항암요법평가항목명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (21018, 'antp_seff_cd', 21000, 'system', 21018, 40530);
insert into ph_item_attribute (item_id, caption, data_type) values (21018, '항암요법부작용코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (21018, 'antp_seff_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (21019, 'antp_seff_nm', 21000, 'system', 21019);
-- insert into ph_item_attribute (item_id, caption) values (21019, '항암요법부작용명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (21020, 'antp_seff_grcd', 21000, 'system', 21020, 40520);
insert into ph_item_attribute (item_id, caption, data_type) values (21020, '항암요법부작용등급코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (21020, 'antp_seff_grnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (21021, 'antp_seff_grnm', 21000, 'system', 21021);
-- insert into ph_item_attribute (item_id, caption) values (21021, '항암요법부작용등급명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (21022, 'crtn_dt', 21000, 'system', 21022);
-- insert into ph_item_attribute (item_id, caption) values (21022, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (21023, 'idx', 21000, 'system', 21023);
-- insert into ph_item_attribute (item_id, caption) values (21023, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (21024, 'pact_id', 21000, 'system', 21024);
-- insert into ph_item_attribute (item_id, caption) values (21024, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (21025, 'comments', 21000, 'system', 21025);
-- insert into ph_item_attribute (item_id, caption) values (21025, 'UI용 comments');
