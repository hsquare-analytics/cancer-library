insert into ph_subject (id, title, activated, order_no, created_by, created_date, last_modified_by, last_modified_date)
values (2703, 'test_examinationubject', true, 1, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_topic (id, title, activated, order_no, subject_id, created_by, created_date, last_modified_by,
                      last_modified_date)
values (2703, 'test_examination_topic', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system',
        '2019-01-01 00:00:00');

insert into ph_category (id, title, activated, order_no, topic_id, created_by, created_date, last_modified_by,
                         last_modified_date)
values (2703, 'test_examination', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_category_property (category_id, date_column, caption)
values (2703, 'idx_dt', '검사 기록');

insert into PH_USER_CATEGORY (ID, USER_ID, CATEGORY_ID, ACTIVATED, TERM_START, TERM_END, CREATED_BY, CREATED_DATE,
                              LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
values (2703, 2, 2703, true, '2019-01-01 00:00:00', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00', 'system',
        '2019-01-01 00:00:00');

insert into ph_group (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                      last_modified_date)
values (2703, 'test_examination_group', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system',
        '2019-01-01 00:00:00');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2741, 'PACT_ID', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2742, 'PT_NO', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2743, 'PT_NM', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2744, 'SEX_TP_CD', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2745, 'PT_BRDY_DT', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2746, 'HSP_TP_CD', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2747, 'IDX_DT', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2748, 'IMPL_DTM', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2749, 'EXM_NM', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2750, 'ORD_CTG_NM', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2751, 'ORD_SLIP_CTG_NM', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2752, 'NUMB_EXRS_CNTE', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2753, 'AGE_CD_MM', true, 1, 2703, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');


CREATE TABLE TEST_EXAMINATION
(
    IDX             VARCHAR,
    PACT_ID         Varchar,
    PT_NO           Varchar,
    PT_NM           Varchar,
    SEX_TP_CD       Varchar,
    PT_BRDY_DT      Varchar,
    HSP_TP_CD       Varchar,
    IDX_DT          TIMESTAMP,
    IMPL_DTM        Timestamp,
    EXM_NM          Varchar,
    ORD_CTG_NM      Varchar,
    ORD_SLIP_CTG_NM Varchar,
    NUMB_EXRS_CNTE  Numeric,
    AGE_CD_MM       Varchar
);

CREATE TABLE TEST_EXAMINATION_UPDATED
(
    IDX                VARCHAR,
    PACT_ID            Varchar,
    PT_NO              Varchar,
    PT_NM              Varchar,
    SEX_TP_CD          Varchar,
    PT_BRDY_DT         Varchar,
    HSP_TP_CD          Varchar,
    IDX_DT             TIMESTAMP,
    IMPL_DTM           Timestamp,
    EXM_NM             Varchar,
    ORD_CTG_NM         Varchar,
    ORD_SLIP_CTG_NM    Varchar,
    NUMB_EXRS_CNTE     Numeric,
    AGE_CD_MM          Varchar,
    CREATED_BY         CHARACTER VARYING(50),
    CREATED_DATE       TIMESTAMP,
    LAST_MODIFIED_BY   CHARACTER VARYING(50),
    LAST_MODIFIED_DATE TIMESTAMP,
    STATUS             VARCHAR(50),
    primary key (idx)
);


INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (1, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-16 16:26:47.000000',
        'PLT(검사24시간가능)', '임상병리', '일반혈액', 272.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (2, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-16 16:26:47.000000',
        'Hct', '임상병리', '일반혈액', 33.8000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (3, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-16 16:26:47.000000',
        'MPV', '임상병리', '일반혈액', 9.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (4, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-16 16:26:47.000000',
        'PCT', '임상병리', '일반혈액', 0.2400, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (5, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-16 16:26:47.000000',
        'RDW(검사24시간가능)', '임상병리', '일반혈액', 22.5000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (6, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-16 16:26:47.000000',
        'MCV', '임상병리', '일반혈액', 106.6000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (7, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-17 10:16:23.000000',
        'Rh typing', '임상병리', '혈액은행검사', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (8, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-17 22:28:03.000000', 'pH',
        '임상병리', '일반화학(1)', 7.3920, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (9, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-17 22:28:03.000000',
        'O₂CT ( = O2CT)', '임상병리', '일반화학(1)', 13.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (10, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Myelocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (11, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Immature cell', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (12, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Promyelocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (13, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'RDW(검사24시간가능)', '임상병리', '일반혈액', 21.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (14, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Hct', '임상병리', '일반혈액', 30.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (15, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Segmented neutrophil', '임상병리', '일반혈액', 87.7000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (16, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Large unstained cell', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (17, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Hb(검사24시간가능)', '임상병리', '일반혈액', 9.6000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (18, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Immature monocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (19, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Plasma cell', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (20, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Eosinophil', '임상병리', '일반혈액', 0.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (21, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'MCH', '임상병리', '일반혈액', 33.9000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (22, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'MPV', '임상병리', '일반혈액', 9.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (23, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Band neutrophil', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (24, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:40.000000',
        'Normoblast', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (25, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:48.000000',
        'Alkaline phosphatase(검사24시간가능)', '임상병리', '일반화학(1)', 61.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (26, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:48.000000',
        'GOT (AST)(검사24시간가능)', '임상병리', '일반화학(1)', 20.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (27, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:48.000000',
        'Phosphorus(검사24시간가능)', '임상병리', '일반화학(1)', 3.9000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (28, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:48.000000',
        'BUN(검사24시간가능)', '임상병리', '일반화학(1)', 5.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (29, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:04.000000',
        'PT (%)', '임상병리', '혈액응고', 86.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (30, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 17:15:04.000000',
        'Fibrinogen(검사24시간가능)', '임상병리', '혈액응고', 256.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (31, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'ESR(검사24시간가능)', '임상병리', '일반혈액', 13.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (32, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'MCH', '임상병리', '일반혈액', 33.9000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (33, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'Immature monocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (34, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'Promyelocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (35, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'Hb(검사24시간가능)', '임상병리', '일반혈액', 9.4000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (36, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'Band neutrophil', '임상병리', '일반혈액', 14.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (37, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'Myelocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (38, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'ANC', '임상병리', '일반혈액', 14630.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (39, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'Immature lymphocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (40, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'Atypical lymphocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (41, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'WBC(검사24시간가능)', '임상병리', '일반혈액', 15.4000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (42, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'PCT', '임상병리', '일반혈액', 0.1700, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (43, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:00.000000',
        'RBC(검사24시간가능)', '임상병리', '일반혈액', 2.7700, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (44, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:06.000000',
        'eGFR(CKD EPI Cr)', '임상병리', '일반화학(1)', 110.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (45, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:06.000000',
        'Sodium (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 136.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (46, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:37:06.000000',
        'BUN(검사24시간가능)', '임상병리', '일반화학(1)', 6.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (47, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 12:39:11.000000',
        '[POCT, ABGA]Glucose', '임상병리', 'POCT 현장검사', 150.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (48, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 12:39:11.000000',
        '[POCT, ABGA]Hct', '임상병리', 'POCT 현장검사', 35.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (49, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 12:39:11.000000',
        '[POCT, ABGA]Sodium', '임상병리', 'POCT 현장검사', 135.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (50, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 12:39:11.000000',
        '[POCT, ABGA]Calcium, ionized', '임상병리', 'POCT 현장검사', 1.2100, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (51, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        'pH[POCT]', '임상병리', 'POCT 현장검사', 7.4700, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (52, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        'O₂SAT[POCT] ( = O2SAT[POCT])', '임상병리', 'POCT 현장검사', 100.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (53, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        '[POCT, ABGA]Hct', '임상병리', 'POCT 현장검사', 33.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (54, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        '[POCT, ABGA]Lactic acid', '임상병리', 'POCT 현장검사', 0.7000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (55, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        '[POCT, ABGA]Potassium', '임상병리', 'POCT 현장검사', 3.8000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (56, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        'pCO₂[POCT] ( = pCO2[POCT])', '임상병리', 'POCT 현장검사', 36.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (57, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        'pO₂[POCT] ( = pO2[POCT])', '임상병리', 'POCT 현장검사', 202.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (58, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        '[POCT, ABGA]Glucose', '임상병리', 'POCT 현장검사', 172.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (59, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 14:11:52.000000',
        '[POCT, ABGA]CO2, total', '임상병리', 'POCT 현장검사', 27.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (60, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 15:33:00.000000',
        'pH[POCT]', '임상병리', 'POCT 현장검사', 7.4500, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (61, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 15:33:00.000000',
        'HCO3- [POCT]', '임상병리', 'POCT 현장검사', 26.4000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (62, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 15:33:00.000000',
        '[POCT, ABGA]Sodium', '임상병리', 'POCT 현장검사', 135.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (63, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 16:38:46.000000',
        'pCO₂[POCT] ( = pCO2[POCT])', '임상병리', 'POCT 현장검사', 40.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (64, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 16:38:46.000000',
        '[POCT, ABGA]Sodium', '임상병리', 'POCT 현장검사', 134.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (65, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 16:38:46.000000',
        '[POCT, ABGA]Glucose', '임상병리', 'POCT 현장검사', 209.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (66, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 16:38:46.000000',
        'BEecf[POCT]', '임상병리', 'POCT 현장검사', 0.8000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (67, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 16:38:46.000000',
        'BE[POCT]', '임상병리', 'POCT 현장검사', 0.7000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (68, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 16:38:46.000000',
        'O₂SAT[POCT] ( = O2SAT[POCT])', '임상병리', 'POCT 현장검사', 100.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (69, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 16:38:46.000000',
        '[POCT, ABGA]Hb', '임상병리', 'POCT 현장검사', 10.9000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (70, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 16:38:46.000000',
        '[POCT, ABGA]Potassium', '임상병리', 'POCT 현장검사', 3.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (71, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:27:03.000000',
        '[POCT, ABGA]CO2, total', '임상병리', 'POCT 현장검사', 29.9000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (72, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:27:03.000000',
        '[POCT, ABGA]Potassium', '임상병리', 'POCT 현장검사', 3.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (73, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:27:03.000000',
        'HCO3- [POCT]', '임상병리', 'POCT 현장검사', 28.5000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (74, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:27:03.000000',
        '[POCT, ABGA]Sodium', '임상병리', 'POCT 현장검사', 134.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (75, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:27:03.000000',
        'pH[POCT]', '임상병리', 'POCT 현장검사', 7.4000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (76, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-18 21:27:03.000000',
        'BE[POCT]', '임상병리', 'POCT 현장검사', 3.2000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (77, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'MCHC', '임상병리', '일반혈액', 32.5000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (78, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'RBC(검사24시간가능)', '임상병리', '일반혈액', 2.6500, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (79, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'MCV', '임상병리', '일반혈액', 105.7000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (80, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'Immature lymphocyte', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (81, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'MCH', '임상병리', '일반혈액', 34.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (82, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'Blast', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (83, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'Hb(검사24시간가능)', '임상병리', '일반혈액', 9.1000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (84, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'Lymphocyte', '임상병리', '일반혈액', 1.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (85, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'Immature cell', '임상병리', '일반혈액', null, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (86, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:05:57.000000',
        'MPV', '임상병리', '일반혈액', 9.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (87, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:09:33.000000',
        'Chloride (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 100.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (88, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:09:33.000000',
        'Magnesium(검사24시간가능)', '임상병리', '일반화학(1)', 1.5000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (89, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:09:33.000000',
        'Potassium (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 3.8000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (90, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:09:33.000000',
        'eGFR(MDRD)', '임상병리', '일반화학(1)', 124.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (91, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:09:33.000000',
        'Uric Acid(검사24시간가능)', '임상병리', '일반화학(1)', 3.2000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (92, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 07:09:33.000000',
        'Protein, total(검사24시간가능)', '임상병리', '일반화학(1)', 5.3000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (93, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 06:13:12.000000',
        '[POCT, ABGA]Sodium', '임상병리', 'POCT 현장검사', 134.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (94, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 06:13:12.000000',
        'BEecf[POCT]', '임상병리', 'POCT 현장검사', 6.4000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (95, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 06:13:12.000000',
        '[POCT, ABGA]Hb', '임상병리', 'POCT 현장검사', 9.9000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (96, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 06:13:12.000000',
        '[POCT, ABGA]Calcium, ionized', '임상병리', 'POCT 현장검사', 1.1300, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (97, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 06:13:12.000000',
        'pO₂[POCT] ( = pO2[POCT])', '임상병리', 'POCT 현장검사', 72.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (98, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 06:13:12.000000',
        'pCO₂[POCT] ( = pCO2[POCT])', '임상병리', 'POCT 현장검사', 45.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (99, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 06:13:12.000000',
        '[POCT, ABGA]CO2, total', '임상병리', 'POCT 현장검사', 32.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (100, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 17:40:56.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 132.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (101, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-19 21:31:29.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 107.0000, '612');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (102, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:44.000000',
        'MCHC', '임상병리', '일반혈액', 33.6000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (103, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:44.000000',
        'PDW(검사24시간가능)', '임상병리', '일반혈액', 11.6000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (104, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:44.000000',
        'WBC(검사24시간가능)', '임상병리', '일반혈액', 4.5900, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (105, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:27.000000',
        'Albumin(검사24시간가능)', '임상병리', '일반화학(1)', 4.2000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (106, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:27.000000',
        'Uric Acid(검사24시간가능)', '임상병리', '일반화학(1)', 3.9000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (107, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:27.000000',
        'Glucose(검사24시간가능)', '임상병리', '일반화학(1)', 107.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (108, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:27.000000',
        'Calcium(검사24시간가능)', '임상병리', '일반화학(1)', 9.1000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (109, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:27.000000',
        'Protein, total(검사24시간가능)', '임상병리', '일반화학(1)', 6.1000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (110, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:38.000000',
        'PT (sec)', '임상병리', '혈액응고', 11.2000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (111, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 18:44:38.000000',
        'Fibrinogen(검사24시간가능)', '임상병리', '혈액응고', 232.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (112, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 20:32:55.000000',
        'WBC', '임상병리', '요검사', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (113, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 20:32:55.000000',
        'Blood', '임상병리', '요검사', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (114, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 20:32:55.000000',
        'Ketone', '임상병리', '요검사', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (115, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 20:32:55.000000',
        'pH', '임상병리', '요검사', 7.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (116, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 20:32:55.000000',
        'Renal tubular cell', '임상병리', '요검사', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (117, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08 20:32:55.000000',
        'Squamous cell', '임상병리', '요검사', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (118, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'PDW(검사24시간가능)', '임상병리', '일반혈액', 11.1000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (119, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'ANC', '임상병리', '일반혈액', 13589.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (120, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'RDW(검사24시간가능)', '임상병리', '일반혈액', 11.5000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (121, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'PLT(검사24시간가능)', '임상병리', '일반혈액', 217.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (122, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'Segmented neutrophil', '임상병리', '일반혈액', 85.9000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (123, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'Hb(검사24시간가능)', '임상병리', '일반혈액', 13.4000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (124, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'WBC(검사24시간가능)', '임상병리', '일반혈액', 15.8200, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (125, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'Large unstained cell', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (126, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'MPV', '임상병리', '일반혈액', 10.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (127, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'Blast', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (128, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'Promyelocyte', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (129, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:07:42.000000',
        'MCV', '임상병리', '일반혈액', 96.9000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (130, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:08:01.000000',
        'Creatinine(검사24시간가능)', '임상병리', '일반화학(1)', 0.7800, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (131, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:08:01.000000',
        'Bilirubin, total(검사24시간가능)', '임상병리', '일반화학(1)', 0.7000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (132, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:08:01.000000',
        'hs-CRP quantitation(검사24시간가능)', '임상병리', '일반화학(1)', 11.7800, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (133, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:08:01.000000',
        'Uric Acid(검사24시간가능)', '임상병리', '일반화학(1)', 2.5000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (134, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-12 08:08:01.000000',
        'Potassium (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 3.8000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (135, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'Large unstained cell', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (136, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'MPV', '임상병리', '일반혈액', 10.3000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (137, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'MCHC', '임상병리', '일반혈액', 33.3000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (138, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'ANC', '임상병리', '일반혈액', 5873.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (139, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'Eosinophil', '임상병리', '일반혈액', 3.3000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (140, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'Lymphocyte', '임상병리', '일반혈액', 11.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (141, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'Promyelocyte', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (142, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'PLT(검사24시간가능)', '임상병리', '일반혈액', 291.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (143, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'Hb(검사24시간가능)', '임상병리', '일반혈액', 12.4000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (144, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'MCV', '임상병리', '일반혈액', 96.4000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (145, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'Atypical lymphocyte', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (146, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:46.000000',
        'Immature cell', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (147, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:12.000000',
        'Sodium (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 141.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (148, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:12.000000',
        'GPT (ALT)(검사24시간가능)', '임상병리', '일반화학(1)', 26.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (149, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:12.000000',
        'Cholesterol(검사24시간가능)', '임상병리', '일반화학(1)', 155.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (150, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:12.000000',
        'Chloride (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 101.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (151, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-14 08:15:12.000000',
        'Phosphorus(검사24시간가능)', '임상병리', '일반화학(1)', 3.1000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (152, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:03:37.000000',
        'Metamyelocyte', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (153, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:03:37.000000',
        'MCHC', '임상병리', '일반혈액', 33.5000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (154, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:03:37.000000',
        'Atypical lymphocyte', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (155, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:03:37.000000',
        'WBC(검사24시간가능)', '임상병리', '일반혈액', 7.4300, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (156, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:03:37.000000',
        'Blast', '임상병리', '일반혈액', null, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (157, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:03:37.000000',
        'Eosinophil', '임상병리', '일반혈액', 5.2000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (158, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:03:37.000000',
        'RBC(검사24시간가능)', '임상병리', '일반혈액', 4.1700, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (159, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:03:37.000000',
        'Hb(검사24시간가능)', '임상병리', '일반혈액', 13.4000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (160, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'Calcium(검사24시간가능)', '임상병리', '일반화학(1)', 9.1000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (161, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'hs-CRP quantitation(검사24시간가능)', '임상병리', '일반화학(1)', 5.4000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (162, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'eGFR(MDRD)', '임상병리', '일반화학(1)', 102.6000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (163, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'Sodium (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 139.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (164, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'Chloride (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 100.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (165, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'eGFR(CKD EPI Cr)', '임상병리', '일반화학(1)', 102.5000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (166, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'Phosphorus(검사24시간가능)', '임상병리', '일반화학(1)', 3.5000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (167, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'Potassium (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 4.1000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (168, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'Protein, total(검사24시간가능)', '임상병리', '일반화학(1)', 6.5000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (169, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'Cholesterol(검사24시간가능)', '임상병리', '일반화학(1)', 178.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (170, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'GOT (AST)(검사24시간가능)', '임상병리', '일반화학(1)', 30.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (171, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-16 08:02:00.000000',
        'Creatinine(검사24시간가능)', '임상병리', '일반화학(1)', 0.7900, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (172, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:03.000000',
        'ANC', '임상병리', '일반혈액', 8132.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (173, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:03.000000',
        'MCH', '임상병리', '일반혈액', 29.8000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (174, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:03.000000',
        'WBC(검사24시간가능)', '임상병리', '일반혈액', 9.9900, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (175, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:03.000000',
        'Hct', '임상병리', '일반혈액', 38.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (176, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:03.000000',
        'MCV', '임상병리', '일반혈액', 96.2000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (177, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:03.000000',
        'Metamyelocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (178, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:39:59.000000',
        'PT (%)', '임상병리', '혈액응고', 79.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (179, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:05.000000',
        'eGFR(MDRD)', '임상병리', '일반화학(1)', 92.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (180, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:05.000000',
        'Uric Acid(검사24시간가능)', '임상병리', '일반화학(1)', 4.5000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (181, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:05.000000',
        'Creatinine(검사24시간가능)', '임상병리', '일반화학(1)', 0.8200, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (182, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:05.000000',
        'Potassium (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 5.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (183, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 14:40:05.000000',
        'Alkaline phosphatase(검사24시간가능)', '임상병리', '일반화학(1)', 73.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (184, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 19:45:33.000000',
        'Respiratory specimen culture', '임상병리', '일반미생물', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (185, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 19:45:40.000000',
        'Respiratory specimen culture', '임상병리', '일반미생물', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (186, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 19:45:40.000000',
        'Gram stain(Respiratory)', '임상병리', '일반미생물', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (187, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Crystals', '임상병리', '요검사', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (188, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Others', '임상병리', '요검사', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (189, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'pH', '임상병리', '요검사', 5.5000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (190, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Specific Gravity', '임상병리', '요검사', 1.0320, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (191, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Ketone', '임상병리', '요검사', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (192, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Blood', '임상병리', '요검사', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (193, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Turbidity', '임상병리', '요검사', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (194, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Urobilinogen', '임상병리', '요검사', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (195, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Renal tubular cell', '임상병리', '요검사', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (196, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 18:24:54.000000',
        'Transitional cell', '임상병리', '요검사', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (197, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13 17:07:23.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 122.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (198, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'Hb(검사24시간가능)', '임상병리', '일반혈액', 10.6000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (199, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'Lymphocyte', '임상병리', '일반혈액', 15.7000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (200, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'Large unstained cell', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (201, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'MCH', '임상병리', '일반혈액', 30.8000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (202, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'MCV', '임상병리', '일반혈액', 96.5000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (203, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'Band neutrophil', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (204, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'PLT(검사24시간가능)', '임상병리', '일반혈액', 254.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (205, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'Monocyte', '임상병리', '일반혈액', 5.2000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (206, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'MCHC', '임상병리', '일반혈액', 31.9000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (207, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'Basophil', '임상병리', '일반혈액', 0.3000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (208, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'Normoblast', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (209, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:19:15.000000',
        'Promyelocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (210, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:18:19.000000',
        'Protein, total(검사24시간가능)', '임상병리', '일반화학(1)', 6.3000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (211, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:18:19.000000',
        'eGFR(MDRD)', '임상병리', '일반화학(1)', 105.3000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (212, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:18:19.000000',
        'Alkaline phosphatase(검사24시간가능)', '임상병리', '일반화학(1)', 57.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (213, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:18:19.000000',
        'Triglyceride (TG)(검사24시간가능)', '임상병리', '일반화학(1)', 91.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (214, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:18:19.000000',
        'Chloride (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 100.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (215, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:18:19.000000',
        'BUN(검사24시간가능)', '임상병리', '일반화학(1)', 20.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (216, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:18:19.000000',
        'eGFR(CKD EPI Cr)', '임상병리', '일반화학(1)', 92.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (217, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-15 07:18:19.000000',
        'Calcium(검사24시간가능)', '임상병리', '일반화학(1)', 8.5000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (218, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'Band neutrophil', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (219, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'RDW(검사24시간가능)', '임상병리', '일반혈액', 17.2000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (220, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'WBC(검사24시간가능)', '임상병리', '일반혈액', 8.2200, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (221, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'Segmented neutrophil', '임상병리', '일반혈액', 74.4000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (222, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'Atypical lymphocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (223, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'MPV', '임상병리', '일반혈액', 10.7000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (224, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'Monocyte', '임상병리', '일반혈액', 6.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (225, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'Blast', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (226, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'ANC', '임상병리', '일반혈액', 6116.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (227, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'Lymphocyte', '임상병리', '일반혈액', 14.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (228, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'Eosinophil', '임상병리', '일반혈액', 5.2000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (229, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:08:44.000000',
        'Hb(검사24시간가능)', '임상병리', '일반혈액', 10.3000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (230, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'eGFR(CKD EPI Cr)', '임상병리', '일반화학(1)', 87.7000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (231, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'GPT (ALT)(검사24시간가능)', '임상병리', '일반화학(1)', 19.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (232, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'Phosphorus(검사24시간가능)', '임상병리', '일반화학(1)', 4.5000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (233, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'CO2, total (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 38.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (234, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'Uric Acid(검사24시간가능)', '임상병리', '일반화학(1)', 3.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (235, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'eGFR(MDRD)', '임상병리', '일반화학(1)', 92.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (236, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'GOT (AST)(검사24시간가능)', '임상병리', '일반화학(1)', 12.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (237, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'Chloride (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 97.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (238, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:32.000000',
        'Creatinine(검사24시간가능)', '임상병리', '일반화학(1)', 0.8200, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (239, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 08:09:23.000000',
        'Cholesterol(검사24시간가능)', '임상병리', '일반화학(1)', 131.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (240, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-14 17:46:00.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 92.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (241, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'Lymphocyte', '임상병리', '일반혈액', 17.7000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (242, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'Atypical lymphocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (243, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'PDW(검사24시간가능)', '임상병리', '일반혈액', 11.2000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (244, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'WBC(검사24시간가능)', '임상병리', '일반혈액', 7.3000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (245, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'Hct', '임상병리', '일반혈액', 34.7000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (246, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'Large unstained cell', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (247, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'MCHC', '임상병리', '일반혈액', 31.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (248, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'MPV', '임상병리', '일반혈액', 10.6000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (249, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'RBC(검사24시간가능)', '임상병리', '일반혈액', 3.5900, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (250, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 08:43:23.000000',
        'Basophil', '임상병리', '일반혈액', 0.4000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (251, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-16 12:04:28.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 110.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (252, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-17 08:33:12.000000',
        'Monocyte', '임상병리', '일반혈액', 4.8000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (253, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-17 08:33:12.000000',
        'Promyelocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (254, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-17 08:33:12.000000',
        'PDW(검사24시간가능)', '임상병리', '일반혈액', 11.6000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (255, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-17 08:33:12.000000',
        'WBC(검사24시간가능)', '임상병리', '일반혈액', 6.8400, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (256, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-17 08:33:12.000000',
        'Metamyelocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (257, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-17 17:51:40.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 125.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (258, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:45.000000',
        'PCT', '임상병리', '일반혈액', 0.3000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (259, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:45.000000',
        'PLT(검사24시간가능)', '임상병리', '일반혈액', 288.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (260, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:45.000000',
        'Eosinophil', '임상병리', '일반혈액', 13.3000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (261, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:45.000000',
        'Monocyte', '임상병리', '일반혈액', 5.3000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (262, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:45.000000',
        'RDW(검사24시간가능)', '임상병리', '일반혈액', 16.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (263, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:45.000000',
        'Myelocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (264, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:14.000000',
        'eGFR(CKD EPI Cr)', '임상병리', '일반화학(1)', 97.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (265, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:14.000000',
        'CO2, total (serum)(검사24시간가능)', '임상병리', '일반화학(1)', 28.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (266, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:14.000000',
        'Cholesterol(검사24시간가능)', '임상병리', '일반화학(1)', 141.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (267, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:14.000000',
        'Bilirubin, total(검사24시간가능)', '임상병리', '일반화학(1)', 0.6000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (268, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:14.000000',
        'Creatinine(검사24시간가능)', '임상병리', '일반화학(1)', 0.6400, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (269, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 08:07:14.000000',
        'Uric Acid(검사24시간가능)', '임상병리', '일반화학(1)', 0.9000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (270, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'Myelocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (271, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'PLT(검사24시간가능)', '임상병리', '일반혈액', 322.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (272, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'MCV', '임상병리', '일반혈액', 94.9000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (273, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'Large unstained cell', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (274, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'Monocyte', '임상병리', '일반혈액', 5.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (275, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'RDW(검사24시간가능)', '임상병리', '일반혈액', 16.1000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (276, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'Band neutrophil', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (277, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'Hct', '임상병리', '일반혈액', 38.9000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (278, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 08:35:41.000000',
        'Immature cell', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (279, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 11:29:28.000000',
        '[POCT, ABGA]Sodium', '임상병리', 'POCT 현장검사', 151.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (280, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 11:29:28.000000',
        'BEecf[POCT]', '임상병리', 'POCT 현장검사', -1.8000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (281, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 11:29:28.000000',
        '[POCT, ABGA]CO2, total', '임상병리', 'POCT 현장검사', 23.9000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (282, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 11:29:28.000000',
        'HCO3- [POCT]', '임상병리', 'POCT 현장검사', 22.8000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (283, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 11:48:19.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 121.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (284, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 12:47:51.000000',
        'BEecf[POCT]', '임상병리', 'POCT 현장검사', 0.3000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (285, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 12:47:51.000000',
        'pH[POCT]', '임상병리', 'POCT 현장검사', 7.4700, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (286, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 12:47:51.000000',
        'pO₂[POCT] ( = pO2[POCT])', '임상병리', 'POCT 현장검사', 110.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (287, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 12:47:51.000000',
        '[POCT, ABGA]Calcium, ionized', '임상병리', 'POCT 현장검사', 1.0800, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (288, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-18 12:47:51.000000',
        '[POCT, ABGA]Sodium', '임상병리', 'POCT 현장검사', 137.0000, '647');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (289, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-18 21:10:38.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 114.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (290, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-19 06:25:40.000000',
        '[POCT]간이혈당검사', '임상병리', 'POCT 현장검사', 141.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (291, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-20 08:26:26.000000',
        'PLT(검사24시간가능)', '임상병리', '일반혈액', 282.0000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (292, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-20 08:26:26.000000',
        'Basophil', '임상병리', '일반혈액', 0.7000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (293, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-20 08:26:26.000000',
        'MCV', '임상병리', '일반혈액', 94.5000, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (294, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-20 08:26:26.000000',
        'Metamyelocyte', '임상병리', '일반혈액', null, '881');
INSERT INTO TEST_EXAMINATION(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, IMPL_DTM, EXM_NM,
                             ORD_CTG_NM, ORD_SLIP_CTG_NM, NUMB_EXRS_CNTE, AGE_CD_MM)
VALUES (295, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-20 08:26:26.000000',
        'PDW(검사24시간가능)', '임상병리', '일반혈액', 11.3000, '881');
