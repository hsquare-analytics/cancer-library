insert into ph_subject (id, title, activated, order_no, created_by, created_date, last_modified_by, last_modified_date)
values (2704, 'test_surgery_subject', true, 1, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_topic (id, title, activated, order_no, subject_id, created_by, created_date, last_modified_by,
                      last_modified_date)
values (2704, 'test_surgery_topic', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_category (id, title, activated, order_no, topic_id, created_by, created_date, last_modified_by,
                         last_modified_date)
values (2704, 'test_surgery', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_category_property (category_id, date_column, caption)
values (2704, 'idx_dt', '수술 기록');

-- insert into PH_USER_CATEGORY (ID, USER_ID, CATEGORY_ID, ACTIVATED, TERM_START, TERM_END, CREATED_BY, CREATED_DATE,
--                               LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
-- values (1, 2, 2704, true, '2000-01-01 00:00:00', '2022-12-31 00:00:00', 'system', '2019-01-01 00:00:00', 'system',
--         '2019-01-01 00:00:00');

insert into ph_group (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                      last_modified_date)
values (2704, 'test_surgery_group', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2761, 'PACT_ID', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2762, 'PT_NO', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2763, 'PT_NM', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2764, 'SEX_TP_CD', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2765, 'PT_BRDY_DT', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2766, 'HSP_TP_CD', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2767, 'OP_EXPT_DT', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2768, 'MED_DEPT_NM', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2769, 'OP_VOC_NM', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2770, 'AGE_CD_YY', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2771, 'RM_ENTY_DTM', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2772, 'DS_DTM', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, group_id, created_by, created_date, last_modified_by, last_modified_date) values (2773, 'PSTOP_CHOT_PLC_TP_NM', true, 1, 2704, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');


CREATE TABLE TEST_SURGERY (
                              IDX Integer,
                              PACT_ID Varchar,
                              PT_NO Varchar,
                              PT_NM Varchar,
                              SEX_TP_CD Varchar,
                              PT_BRDY_DT Varchar,
                              HSP_TP_CD Varchar,
                              IDX_DT TIMESTAMP,

                              OP_EXPT_DT TIMESTAMP,
                              MED_DEPT_NM Varchar,
                              OP_VOC_NM Varchar,
                              AGE_CD_YY Varchar,
                              RM_ENTY_DTM Timestamp,
                              DS_DTM Timestamp,
                              PSTOP_CHOT_PLC_TP_NM Varchar
);

CREATE TABLE TEST_SURGERY_UPDATED
(
    IDX Integer,
    PACT_ID Varchar,
    PT_NO Varchar,
    PT_NM Varchar,
    SEX_TP_CD Varchar,
    PT_BRDY_DT Varchar,
    HSP_TP_CD Varchar,
    IDX_DT TIMESTAMP,
    OP_EXPT_DT TIMESTAMP,
    MED_DEPT_NM Varchar,
    OP_VOC_NM Varchar,
    AGE_CD_YY Varchar,
    RM_ENTY_DTM Timestamp,
    DS_DTM Timestamp,
    PSTOP_CHOT_PLC_TP_NM Varchar,
    CREATED_BY         CHARACTER VARYING(50),
    CREATED_DATE       TIMESTAMP,
    LAST_MODIFIED_BY   CHARACTER VARYING(50),
    LAST_MODIFIED_DATE TIMESTAMP,
    STATUS             VARCHAR(50),
    primary key (idx)
);

INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (1, '0033372995', 'G010275935183', '손**', 'F', '1955-08', '01', '2021-02-03', '2021-02-03', '위장관외과', 'Wedge resection of lesion or tissue of stomach', '65', '2021-02-03 12:15:00.000000', '2021-02-03 14:50:00.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (2, '0033957963', 'G010504989604', '박**', 'M', '2015-08', '01', '2021-03-06', '2021-03-06', '소아외과', 'Removal of intraluminal foreign body from small intestine', '5', '2021-03-06 21:09:00.000000', '2021-03-06 23:05:38.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (3, '0033517853', 'G010494661469', '민**', 'M', '2017-03', '01', '2021-02-11', '2021-02-11', '소아외과', 'Removal of intraluminal foreign body from small intestine', '3', '2021-02-11 08:00:11.000000', '2021-02-11 11:17:00.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (4, '0033957963', 'G010504989604', '박**', 'M', '2015-08', '01', '2021-03-06', '2021-04-20', '소아외과', 'Repair of ileostomy', '5', '2021-04-20 08:02:00.000000', '2021-04-20 10:00:00.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (5, '0037711806', 'G010132815619', '노**', 'F', '1944-10', '01', '2021-10-01', '2021-10-01', '위장관외과', 'Wedge resection of lesion or tissue of stomach', '76', '2021-10-01 11:50:00.000000', '2021-10-01 14:05:00.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (6, '0038156399', 'G010510407967', '김**', 'M', '2017-04', '01', '2021-10-24', '2021-10-24', '소아청소년과(소화기영양)', 'Endoscopic removal of gastric foreign body', '4', '2021-10-24 20:00:15.000000', '2021-10-24 20:37:35.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (7, '0033422414', 'G010345082515', '김**', 'F', '1966-05', '01', '2021-02-05', '2021-02-05', '위장관외과', 'Laparoscopic adjustable gastric banding', '54', '2021-02-05 15:17:58.000000', '2021-02-05 16:46:00.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (8, '0033957963', 'G010504989604', '박**', 'M', '2015-08', '01', '2021-03-06', '2021-03-09', '소아외과', 'Exploratory laparotomy', '5', '2021-03-09 19:20:44.000000', '2021-03-09 22:07:04.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (9, '0036257282', 'G010494043018', '김**', 'F', '2008-04', '01', '2021-07-13', '2021-07-13', '소아청소년과(소화기영양)', 'Endoscopic gastric polypectomy', '13', '2021-07-13 16:03:41.000000', '2021-07-13 17:02:36.000000', '회복실');
INSERT INTO TEST_SURGERY(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, OP_EXPT_DT, MED_DEPT_NM, OP_VOC_NM, AGE_CD_YY, RM_ENTY_DTM, DS_DTM, PSTOP_CHOT_PLC_TP_NM) VALUES (10, '0039298583', 'G010068217342', '박**', 'M', '1945-11', '01', '2021-12-24', '2021-12-24', '위장관외과', 'Wedge resection of lesion or tissue of stomach', '76', '2021-12-24 12:17:00.000000', '2021-12-24 14:00:00.000000', '회복실');
