--작업일시: 221115 am10:02

DROP TABLE IF EXISTS GSCN.GSCN_EXAM_GTSP;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_GTSP_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_GTSP (
    hosp_cd             varchar(20) not null,
    pt_no               varchar(10) not null,
    stmc_edex_ymd       timestamp   not null,
    stmc_edex_seq       numeric(3)  not null,
    stmc_edex_prps_cd   varchar(20),
    stmc_edex_prps_nm   varchar(200),
    gtsp_tspc_cnt       numeric(3),
    stmc_edex_opn_cont  varchar(4000),
    stmc_edex_rslt_cont varchar(4000),
    stmc_edex_rslt_tpcd varchar(20),
    stmc_edex_rslt_tpnm varchar(200),
    gtsp_comp_grcd      varchar(20),
    gtsp_comp_grnm      varchar(200),
    gtsp_comp_cd        varchar(20),
    gtsp_comp_nm        varchar(200),
    crtn_dt             timestamp   not null,
    idx                 varchar(100),
    pact_id             varchar(50),
    comments            varchar(4000),
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    constraint gscn_exam_gtsp_pk
    primary key (hosp_cd, pt_no, stmc_edex_ymd, stmc_edex_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (13000, 'GSCN.GSCN_EXAM_GTSP', '13.위암_검사_위내시경', true, 12, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (13000, null, '13.위암_검사_위내시경');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (13001, 'hosp_cd', 13000, 'system', 13001);
-- insert into ph_item_attribute (item_id, caption, required) values (13001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (13002, 'pt_no', 13000, 'system', 13002);
insert into ph_item_attribute (item_id, caption) values (13002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (13002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (13003, 'stmc_edex_ymd', 13000, 'system', 13003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (13003, '위내시경검사일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (13004, 'stmc_edex_seq', 13000, 'system', 13004);
insert into ph_item_attribute (item_id, caption, required) values (13004, '위내시경검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (13005, 'stmc_edex_prps_cd', 13000, 'system', 13005);
insert into ph_item_attribute (item_id, caption) values (13005, '위내시경검사목적코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (13006, 'stmc_edex_prps_nm', 13000, 'system', 13006);
insert into ph_item_attribute (item_id, caption) values (13006, '위내시경검사목적명');

insert into ph_item (id, title, category_id, created_by, order_no) values (13007, 'gtsp_tspc_cnt', 13000, 'system', 13007);
insert into ph_item_attribute (item_id, caption) values (13007, '위내시경조직표본수');

insert into ph_item (id, title, category_id, created_by, order_no) values (13008, 'stmc_edex_opn_cont', 13000, 'system', 13008);
insert into ph_item_attribute (item_id, caption) values (13008, '위내시경검사소견내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (13009, 'stmc_edex_rslt_cont', 13000, 'system', 13009);
insert into ph_item_attribute (item_id, caption) values (13009, '위내시경검사결과내용');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (13010, 'stmc_edex_rslt_tpcd', 13000, 'system', 13010, 30440);
insert into ph_item_attribute (item_id, caption) values (13010, '위내시경검사결과유형코드');
insert into ph_item_property (item_id, label_column) values (13010, 'stmc_edex_rslt_tpnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (13011, 'stmc_edex_rslt_tpnm', 13000, 'system', 13011);
-- insert into ph_item_attribute (item_id, caption) values (13011, '위내시경검사결과유형명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (13012, 'gtsp_comp_grcd', 13000, 'system', 13012, 30460);
insert into ph_item_attribute (item_id, caption) values (13012, '위내시경합병증등급코드');
insert into ph_item_property (item_id, label_column) values (13012, 'gtsp_comp_grnm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (13013, 'gtsp_comp_grnm', 13000, 'system', 13013);
-- insert into ph_item_attribute (item_id, caption) values (13013, '위내시경합병증등급명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (13014, 'gtsp_comp_cd', 13000, 'system', 13014, 30470);
insert into ph_item_attribute (item_id, caption) values (13014, '위내시경합병증코드');
insert into ph_item_property (item_id, label_column) values (13014, 'gtsp_comp_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (13015, 'gtsp_comp_nm', 13000, 'system', 13015);
-- insert into ph_item_attribute (item_id, caption) values (13015, '위내시경합병증명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (13016, 'crtn_dt', 13000, 'system', 13016);
-- insert into ph_item_attribute (item_id, caption) values (13016, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (13017, 'idx', 13000, 'system', 13017);
-- insert into ph_item_attribute (item_id, caption) values (13017, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (13018, 'pact_id', 13000, 'system', 13018);
-- insert into ph_item_attribute (item_id, caption) values (13018, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (13019, 'comments', 13000, 'system', 13019);
-- insert into ph_item_attribute (item_id, caption) values (13019, 'UI용 comments');
insert into ph_item (id, title, category_id, created_by, order_no) values (13015, 'sort_seq', 13000, 'system', 13015);
insert into ph_item_attribute (item_id, caption) values (13015, '정렬순서');

