DROP TABLE IF EXISTS GSCN.GSCN_TRTM_BLTR;
DROP TABLE IF EXISTS GSCN.GSCN_TRTM_BLTR_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_TRTM_BLTR (
    hosp_cd       varchar(20) not null,
    pt_no         varchar(10) not null,
    bltr_prsc_ymd timestamp   not null,
    bltr_prsc_seq numeric(3)  not null,
    blpt_kncd     varchar(20),
    blpt_knnm     varchar(200),
    blpt_cd       varchar(20),
    blpt_nm       varchar(200),
    bltr_pack_cnt numeric(3),
    bltr_totl_qty numeric(8),
    crtn_dt       timestamp   not null,
    idx           varchar(100),
    pact_id       varchar(50),
    comments      varchar(4000),
    constraint gscn_trtm_bltr_pk
    primary key (hosp_cd, pt_no, bltr_prsc_ymd, bltr_prsc_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (19000, 'GSCN.GSCN_TRTM_BLTR', '19.위암_치료_수혈', true, 19, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (19000, null, '19.위암_치료_수혈');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (19001, 'hosp_cd', 19000, 'system', 19001);
-- insert into ph_item_attribute (item_id, caption, required) values (19001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (19002, 'pt_no', 19000, 'system', 19002);
insert into ph_item_attribute (item_id, caption) values (19002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (19002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (19003, 'bltr_prsc_ymd', 19000, 'system', 19003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (19003, '수혈처방일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (19004, 'bltr_prsc_seq', 19000, 'system', 19004);
insert into ph_item_attribute (item_id, caption, required) values (19004, '수혈처방순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (19005, 'blpt_kncd', 19000, 'system', 19005, 40580);
insert into ph_item_attribute (item_id, caption, data_type) values (19005, '혈액제제종류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (19005, 'blpt_knnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (19006, 'blpt_knnm', 19000, 'system', 19006);
-- insert into ph_item_attribute (item_id, caption) values (19006, '혈액제제종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (19007, 'blpt_cd', 19000, 'system', 19007);
insert into ph_item_attribute (item_id, caption) values (19007, '혈액제제코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (19008, 'blpt_nm', 19000, 'system', 19008);
insert into ph_item_attribute (item_id, caption) values (19008, '혈액제제명');

insert into ph_item (id, title, category_id, created_by, order_no) values (19010, 'bltr_pack_cnt', 19000, 'system', 19010);
insert into ph_item_attribute (item_id, caption) values (19010, '수혈팩수');

insert into ph_item (id, title, category_id, created_by, order_no) values (19011, 'bltr_totl_qty', 19000, 'system', 19011);
insert into ph_item_attribute (item_id, caption) values (19011, '수혈총량');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (19012, 'crtn_dt', 19000, 'system', 19012);
-- insert into ph_item_attribute (item_id, caption) values (19012, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (19013, 'idx', 19000, 'system', 19013);
-- insert into ph_item_attribute (item_id, caption) values (19013, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (19014, 'pact_id', 19000, 'system', 19014);
-- insert into ph_item_attribute (item_id, caption) values (19014, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (19015, 'comments', 19000, 'system', 19015);
-- insert into ph_item_attribute (item_id, caption) values (19015, 'UI용 comments');
