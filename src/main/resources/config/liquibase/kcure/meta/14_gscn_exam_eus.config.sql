DROP TABLE IF EXISTS GSCN.GSCN_EXAM_EUS;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_EUS_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_EUS (
    hosp_cd            varchar(20) not null,
    pt_no              varchar(10) not null,
    eus_exam_ymd       timestamp   not null,
    eus_exam_seq       numeric(3)  not null,
    eus_t_stag_cd      varchar(20),
    eus_t_stag_nm      varchar(200),
    eus_n_stag_cd      varchar(20),
    eus_n_stag_nm      varchar(200),
    eus_m_stag_cd      varchar(20),
    eus_m_stag_nm      varchar(200),
    eus_exam_opn_cont  varchar(4000),
    eus_exam_rslt_cont varchar(4000),
    eus_comp_cd        varchar(20),
    eus_comp_nm        varchar(200),
    crtn_dt            timestamp   not null,
    idx                varchar(100),
    pact_id            varchar(50),
    exm_cd_nm          varchar(4000),
    comments           varchar(4000),
    constraint gscn_exam_eus_pk
    primary key (hosp_cd, pt_no, eus_exam_ymd, eus_exam_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (14000, 'GSCN.GSCN_EXAM_EUS', '14.위암_검사_EUS', true, 14, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (14000, null, '14.위암_검사_EUS');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (14001, 'hosp_cd', 14000, 'system', 14001);
-- insert into ph_item_attribute (item_id, caption, required) values (14001, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (14002, 'pt_no', 14000, 'system', 14002);
insert into ph_item_attribute (item_id, caption) values (14002, '환자대체번호');
insert into ph_item_property (item_id, visible) values (14002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (14003, 'eus_exam_ymd', 14000, 'system', 14003);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (14003, 'EUS검사일자', true, 'yyyyMMdd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (14004, 'eus_exam_seq', 14000, 'system', 14004);
insert into ph_item_attribute (item_id, caption, required) values (14004, 'EUS검사순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (14005, 'eus_t_stag_cd', 14000, 'system', 14005, 30050);
insert into ph_item_attribute (item_id, caption, data_type) values (14005, 'EUS_T병기코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (14005, 'eus_t_stag_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (14006, 'eus_t_stag_nm', 14000, 'system', 14006);
-- insert into ph_item_attribute (item_id, caption) values (14006, 'EUS_T병기명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (14007, 'eus_n_stag_cd', 14000, 'system', 14007, 30040);
insert into ph_item_attribute (item_id, caption, data_type) values (14007, 'EUS_N병기코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (14007, 'eus_n_stag_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (14008, 'eus_n_stag_nm', 14000, 'system', 14008);
-- insert into ph_item_attribute (item_id, caption) values (14008, 'EUS_N병기명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (14009, 'eus_m_stag_cd', 14000, 'system', 14009, 30030);
insert into ph_item_attribute (item_id, caption, data_type) values (14009, 'EUS_M병기코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (14009, 'eus_m_stag_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (14010, 'eus_m_stag_nm', 14000, 'system', 14010);
-- insert into ph_item_attribute (item_id, caption) values (14010, 'EUS_M병기명');

insert into ph_item (id, title, category_id, created_by, order_no) values (14011, 'eus_exam_opn_cont', 14000, 'system', 14011);
insert into ph_item_attribute (item_id, caption) values (14011, 'EUS검사소견내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (14012, 'eus_exam_rslt_cont', 14000, 'system', 14012);
insert into ph_item_attribute (item_id, caption) values (14012, 'EUS검사결과내용');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (14013, 'eus_comp_cd', 14000, 'system', 14013, 30060);
insert into ph_item_attribute (item_id, caption, data_type) values (14013, 'EUS합병증코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (14013, 'eus_comp_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (14014, 'eus_comp_nm', 14000, 'system', 14014);
-- insert into ph_item_attribute (item_id, caption) values (14014, 'EUS합병증명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (14015, 'crtn_dt', 14000, 'system', 14015);
-- insert into ph_item_attribute (item_id, caption) values (14015, '생성일시');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (14016, 'idx', 14000, 'system', 14016);
-- insert into ph_item_attribute (item_id, caption) values (14016, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (14017, 'pact_id', 14000, 'system', 14017);
-- insert into ph_item_attribute (item_id, caption) values (14017, 'UI용 PACT_ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (14018, 'exm_cd_nm', 14000, 'system', 14018);
-- insert into ph_item_attribute (item_id, caption) values (14018, 'UI용 UI검사코드/검사명');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (14019, 'comments', 14000, 'system', 14019);
-- insert into ph_item_attribute (item_id, caption) values (14019, 'UI용 comments');
