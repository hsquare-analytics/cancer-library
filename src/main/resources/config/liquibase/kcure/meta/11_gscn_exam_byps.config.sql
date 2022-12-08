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
    constraint gscn_exam_byps_pk
    primary key (hosp_cd, pt_no, bpsy_ymd, bpsy_seq)
    );

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (11000, 'GSCN.GSCN_EXAM_BYPS', '11.위암_검사_생체', true, 11, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (11000, null, '11.위암_검사_생체');

insert into ph_item (id, title, category_id, created_by, order_no) values (11001, 'hosp_cd', 11000, 'system', 11001);
insert into ph_item_attribute (item_id, caption, required) values (11001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (11002, 'pt_no', 11000, 'system', 11002);
insert into ph_item_attribute (item_id, caption) values (11002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (11002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (11003, 'bpsy_ymd', 11000, 'system', 11003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (11003, '생체검사일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (11004, 'bpsy_seq', 11000, 'system', 11004);
insert into ph_item_attribute (item_id, caption, required) values (11004, '생체검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (11005, 'bpsy_read_ymd', 11000, 'system', 11005);
insert into ph_item_attribute (item_id, caption, format, data_type) values (11005, '생체검사판독일자', 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (11006, 'bpsy_site_cd', 11000, 'system', 11006, 30310);
insert into ph_item_attribute (item_id, caption, data_type) values (11006, '생체검사부위코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (11006, 'bpsy_site_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (11007, 'bpsy_site_nm', 11000, 'system', 11007);
-- insert into ph_item_attribute (item_id, caption) values (11007, '생체검사부위명');

insert into ph_item (id, title, category_id, created_by, order_no) values (11008, 'bpsy_mtcd', 11000, 'system', 11008);
insert into ph_item_attribute (item_id, caption) values (11008, '생체검사방법코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (11009, 'bpsy_mtnm', 11000, 'system', 11009);
insert into ph_item_attribute (item_id, caption) values (11009, '생체검사방법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (11010, 'bpsy_mthd_kncd', 11000, 'system', 11010, 30290);
insert into ph_item_attribute (item_id, caption, data_type) values (11010, '생체검사방법종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (11010, 'bpsy_mthd_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (11011, 'bpsy_mthd_knnm', 11000, 'system', 11011);
-- insert into ph_item_attribute (item_id, caption) values (11011, '생체검사방법종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (11012, 'bpsy_rslt_cont', 11000, 'system', 11012);
insert into ph_item_attribute (item_id, caption) values (11012, '생체검사결과내용');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (11013, 'htlg_diag_cd', 11000, 'system', 11013, 30540);
insert into ph_item_attribute (item_id, caption, data_type) values (11013, '조직학적진단코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (11013, 'htlg_diag_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (11014, 'htlg_diag_nm', 11000, 'system', 11014);
-- insert into ph_item_attribute (item_id, caption) values (11014, '조직학적진단명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (11015, 'htlg_dfgd_cd', 11000, 'system', 11015, 30530);
insert into ph_item_attribute (item_id, caption, data_type) values (11015, '조직학적분화도코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (11015, 'htlg_dfgd_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (11016, 'htlg_dfgd_nm', 11000, 'system', 11016);
-- insert into ph_item_attribute (item_id, caption) values (11016, '조직학적분화도명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (11017, 'crtn_dt', 11000, 'system', 11017);
-- insert into ph_item_attribute (item_id, caption) values (11017, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (11018, 'idx', 11000, 'system', 11018);
-- insert into ph_item_attribute (item_id, caption) values (11018, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (11019, 'exm_no', 11000, 'system', 11019);
-- insert into ph_item_attribute (item_id, caption) values (11019, 'UI용 코멘트');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (11020, 'comments', 11000, 'system', 11020);
-- insert into ph_item_attribute (item_id, caption) values (11020, 'UI용 코멘트');
--

