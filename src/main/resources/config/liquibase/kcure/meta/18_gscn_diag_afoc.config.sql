DROP TABLE IF EXISTS GSCN.GSCN_DIAG_AFOC;
DROP TABLE IF EXISTS GSCN.GSCN_DIAG_AFOC_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_DIAG_AFOC (
    hosp_cd            varchar(20) not null,
    pt_no              varchar(10) not null,
    comp_ocrn_oprt_ymd timestamp   not null,
    comp_ocrn_oprt_seq numeric(3)  not null,
    afoc_clcd          varchar(20),
    afoc_clnm          varchar(200),
    afoc_cd            varchar(20),
    afoc_nm            varchar(200),
    afop_etc_comp_cont varchar(4000),
    crtn_dt            timestamp   not null,
    idx                varchar(100),
    pact_id            varchar(50),
    comments           varchar(4000),
    constraint gscn_diag_afoc_pk
    primary key (hosp_cd, pt_no, comp_ocrn_oprt_ymd, comp_ocrn_oprt_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (18000, 'GSCN.GSCN_DIAG_AFOC', '18.위암_진단_수술후합병증', true, 18, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (18000, null, '18.위암_진단_수술후합병증');

insert into ph_item (id, title, category_id, created_by, order_no) values (18001, 'hosp_cd', 18000, 'system', 18001);
insert into ph_item_attribute (item_id, caption, required) values (18001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (18002, 'pt_no', 18000, 'system', 18002);
insert into ph_item_attribute (item_id, caption) values (18002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (18002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (18003, 'comp_ocrn_oprt_ymd', 18000, 'system', 18003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (18003, '합병증발생수술일자', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (18004, 'comp_ocrn_oprt_seq', 18000, 'system', 18004);
insert into ph_item_attribute (item_id, caption, required) values (18004, '합병증발생수술순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (18005, 'afoc_clcd', 18000, 'system', 18005, 20030);
insert into ph_item_attribute (item_id, caption, data_type) values (18005, '수술후합병증분류코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (18005, 'afoc_clnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (18006, 'afoc_clnm', 18000, 'system', 18006);
-- insert into ph_item_attribute (item_id, caption) values (18006, '수술후합병증분류명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (18007, 'afoc_cd', 18000, 'system', 18007, 20040);
insert into ph_item_attribute (item_id, caption, data_type) values (18007, '수술후합병증코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (18007, 'afoc_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (18008, 'afoc_nm', 18000, 'system', 18008);
-- insert into ph_item_attribute (item_id, caption) values (18008, '수술후합병증명');

insert into ph_item (id, title, category_id, created_by, order_no) values (18009, 'afop_etc_comp_cont', 18000, 'system', 18009);
insert into ph_item_attribute (item_id, caption) values (18009, '수술후기타합병증내용');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (18010, 'crtn_dt', 18000, 'system', 18010);
-- insert into ph_item_attribute (item_id, caption) values (18010, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (18011, 'idx', 18000, 'system', 18011);
-- insert into ph_item_attribute (item_id, caption) values (18011, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (18012, 'pact_id', 18000, 'system', 18012);
-- insert into ph_item_attribute (item_id, caption) values (18012, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (18013, 'comments', 18000, 'system', 18013);
-- insert into ph_item_attribute (item_id, caption) values (18013, 'UI용 comments');
