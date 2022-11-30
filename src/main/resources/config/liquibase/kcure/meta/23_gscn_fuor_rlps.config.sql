DROP TABLE IF EXISTS GSCN.GSCN_FUOR_RLPS;
DROP TABLE IF EXISTS GSCN.GSCN_FUOR_RLPS_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_FUOR_RLPS (
    hosp_cd        varchar(20) not null,
    pt_no          varchar(10) not null,
    rldg_ymd       timestamp   not null,
    rldg_seq       numeric(3)  not null,
    rldg_mtcd      varchar(20),
    rldg_mtnm      varchar(200),
    rlps_site_cd   varchar(20),
    rlps_site_nm   varchar(200),
    rlps_kncd      varchar(20),
    rlps_knnm      varchar(200),
    rlps_trtm_cont varchar(5),
    crtn_dt        timestamp   not null,
    idx            varchar(100),
    pact_id        varchar(50),
    comments       varchar(4000),
    constraint gscn_fuor_rlps_pk
    primary key (hosp_cd, pt_no, rldg_ymd, rldg_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (23000, 'GSCN.GSCN_FUOR_RLPS', '23.위암_추적관찰_재발', true, 23, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (23000, null, '23.위암_추적관찰_재발');

insert into ph_item (id, title, category_id, created_by, order_no) values (23001, 'hosp_cd', 23000, 'system', 23001);
insert into ph_item_attribute (item_id, caption, required) values (23001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (23002, 'pt_no', 23000, 'system', 23002);
insert into ph_item_attribute (item_id, caption) values (23002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (23002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (23003, 'rldg_ymd', 23000, 'system', 23003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (23003, '재발진단일자', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (23004, 'rldg_seq', 23000, 'system', 23004);
insert into ph_item_attribute (item_id, caption, required) values (23004, '재발진단순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (23005, 'rldg_mtcd', 23000, 'system', 23005, 50040);
insert into ph_item_attribute (item_id, caption, data_type) values (23005, '재발진단방법코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (23006, 'rldg_mtnm', 23000, 'system', 23006);
insert into ph_item_attribute (item_id, caption) values (23006, '재발진단방법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (23007, 'rlps_site_cd', 23000, 'system', 23007, 50010);
insert into ph_item_attribute (item_id, caption, data_type) values (23007, '재발부위코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (23008, 'rlps_site_nm', 23000, 'system', 23008);
insert into ph_item_attribute (item_id, caption) values (23008, '재발부위명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (23009, 'rlps_kncd', 23000, 'system', 23009, 50020);
insert into ph_item_attribute (item_id, caption, data_type) values (23009, '재발종류코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (23010, 'rlps_knnm', 23000, 'system', 23010);
insert into ph_item_attribute (item_id, caption) values (23010, '재발종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (23011, 'rlps_trtm_cont', 23000, 'system', 23011);
insert into ph_item_attribute (item_id, caption) values (23011, '재발치료내용');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (23012, 'crtn_dt', 23000, 'system', 23012);
-- insert into ph_item_attribute (item_id, caption) values (23012, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (23013, 'idx', 23000, 'system', 23013);
-- insert into ph_item_attribute (item_id, caption) values (23013, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (23014, 'pact_id', 23000, 'system', 23014);
-- insert into ph_item_attribute (item_id, caption) values (23014, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (23015, 'comments', 23000, 'system', 23015);
-- insert into ph_item_attribute (item_id, caption) values (23015, 'UI용 comments');
