insert into ph_subject (id, title, activated, order_no, created_by, created_date, last_modified_by, last_modified_date)
values (2701, 'test_visit_subject', true, 1, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_topic (id, title, activated, order_no, subject_id, created_by, created_date, last_modified_by,
                      last_modified_date)
values (2701, 'test_visit_topic', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_category (id, title, activated, order_no, topic_id, created_by, created_date, last_modified_by,
                         last_modified_date)
values (2701, 'test_visit', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_category_property (category_id, date_column, caption)
values (2701, 'med_dt', '수진 기록');

insert into PH_USER_CATEGORY (ID, USER_ID, CATEGORY_ID, ACTIVATED, TERM_START, TERM_END, CREATED_BY, CREATED_DATE,
                              LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
values (2701, 2, 2701, true, '2000-01-01 00:00:00', '2022-12-31 00:00:00', 'system', '2019-01-01 00:00:00', 'system',
        '2019-01-01 00:00:00');

insert into ph_group (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                      last_modified_date)
values (2701, 'test_visit_group', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2701, 'PACT_ID', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2701, 1, '팩트 ID', true);
insert into ph_item_attribute (item_id, data_type) values (2701, 'string');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2702, 'PT_NO', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2702, 2, '환자 번호', true);
insert into ph_item_attribute (item_id, data_type) values (2702, 'string');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2703, 'PT_NM', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2703, 3, '환자 이름', true);
insert into ph_item_attribute (item_id, data_type) values (2703, 'string');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2704, 'SEX_TP_CD', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2704, 4, '성별', true);
insert into ph_item_attribute (item_id, data_type) values (2704, 'selectbox');
insert into ph_item_lookup (item_id, order_no, title) values (2704, 1, 'M');
insert into ph_item_lookup (item_id, order_no, title) values (2704, 2, 'F');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2705, 'PT_BRDY_DT', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2705, 5, '생년월일', true);
insert into ph_item_attribute (item_id, data_type) values (2705, 'date');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2706, 'HSP_TP_CD', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2706, 6, '병원코드', true);
insert into ph_item_attribute (item_id, data_type) values (2706, 'selectbox');
insert into ph_item_lookup (item_id, order_no, title) values (2706, 1, '01');
insert into ph_item_lookup (item_id, order_no, title) values (2706, 2, '02');
insert into ph_item_lookup (item_id, order_no, title) values (2706, 3, '03');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2707, 'IDX_DT', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2707, 7, '수진일', true);
insert into ph_item_attribute (item_id, data_type) values (2707, 'date');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2708, 'MED_DT', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2708, 8, '수진 기록일', true);
insert into ph_item_attribute (item_id, data_type) values (2708, 'date');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2709, 'HSP_DTL_TP_NM', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2709, 9, '병원 세부코드', true);
insert into ph_item_attribute (item_id, data_type) values (2709, 'string');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2710, 'PACT_TP_NM', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2710, 10, '계약종류', true);
insert into ph_item_attribute (item_id, data_type) values (2710, 'string');


insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2711, 'FRVS_RMDE_TP_NM', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2711, 11, '첫 방문 여부', true);
insert into ph_item_attribute (item_id, data_type) values (2711, 'string');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2712, 'AGE_CD_YY', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2712, 12, '나이(년)', true);
insert into ph_item_attribute (item_id, data_type) values (2712, 'number');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2713, 'MED_DEPT_NM', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2713, 13, '진료과', true);
insert into ph_item_attribute (item_id, data_type) values (2713, 'string');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2714, 'DR_STF_NM', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2714, 14, '의사', true);
insert into ph_item_attribute (item_id, data_type) values (2714, 'string');

insert into ph_item (id, title, activated, order_no, category_id, created_by, created_date, last_modified_by,
                     last_modified_date)
values (2715, 'ADS_DT', true, 1, 2701, 'system', '2019-01-01 00:00:00', 'system', '2019-01-01 00:00:00');
insert into ph_item_property (item_id, visible_index, caption, allow_editing) values (2715, 15, '입원일', true);
insert into ph_item_attribute (item_id, data_type) values (2715, 'date');


CREATE TABLE TEST_VISIT
(
    IDX             Integer,
    PACT_ID         Varchar,
    PT_NO           Varchar,
    PT_NM           Varchar,
    SEX_TP_CD       Varchar,
    PT_BRDY_DT      Varchar,
    HSP_TP_CD       Varchar,
    IDX_DT          Date,
    MED_DT          timestamp,
    HSP_DTL_TP_NM   Varchar,
    PACT_TP_NM      Varchar,
    FRVS_RMDE_TP_NM Varchar,
    AGE_CD_YY       Varchar,
    MED_DEPT_NM     Varchar,
    DR_STF_NM       Varchar,
    ADS_DT          timestamp
);

CREATE TABLE TEST_VISIT_UPDATED
(
    IDX                Integer,
    PACT_ID            Varchar,
    PT_NO              Varchar,
    PT_NM              Varchar,
    SEX_TP_CD          Varchar,
    PT_BRDY_DT         Varchar,
    HSP_TP_CD          Varchar,
    IDX_DT             timestamp,
    MED_DT             timestamp,
    HSP_DTL_TP_NM      Varchar,
    PACT_TP_NM         Varchar,
    FRVS_RMDE_TP_NM    Varchar,
    AGE_CD_YY          Varchar,
    MED_DEPT_NM        Varchar,
    DR_STF_NM          Varchar,
    ADS_DT            timestamp,
    CREATED_BY         CHARACTER VARYING(50),
    CREATED_DATE       TIMESTAMP,
    LAST_MODIFIED_BY   CHARACTER VARYING(50),
    LAST_MODIFIED_DATE TIMESTAMP,
    STATUS             VARCHAR(50),
    primary key (idx)
);

INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (1, '0033957963', 'G010504989604', '박**', 'M', '2015-08', '01', '2021-03-06', '2021-03-06', '어린이', '입원', null,
        '5', '소아외과', '윤**', '2021-03-06');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (2, '0011038620', 'G010489352971', '문**', 'M', '2015-01', '01', '2017-06-17', '2017-06-17', '어린이', '입원', null,
        '2', '소아청소년과(소화기영양)', '문**', '2017-06-17');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (3, '0011965202', 'G010493151429', '배**', 'M', '2016-09', '01', '2017-08-14', '2017-08-13', '어린이', '입원', null,
        '0', '소아외과', '김**', '2017-08-13');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (4, '0033422414', 'G010345082515', '김**', 'F', '1966-05', '01', '2021-02-05', '2021-02-03', '본원', '입원', null,
        '54', '위장관외과', '공**', '2021-02-03');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (5, '0027397609', 'G010349803259', '백**', 'F', '1969-02', '01', '2020-02-18', '2020-02-16', '본원', '입원', null,
        '50', '흉부외과', '강**', '2020-02-16');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (6, '0028542105', 'G010355270037', '김**', 'F', '1941-06', '01', '2020-04-28', '2020-04-26', '본원', '입원', null,
        '78', '위장관외과', '양**', '2020-04-26');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (7, '0027755711', 'G010355631452', '안**', 'M', '1966-04', '01', '2020-03-10', '2020-03-08', '본원', '입원', null,
        '53', '이비인후과', '안**', '2020-03-08');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (8, '0024484685', 'G010356387385', '김**', 'F', '1958-06', '01', '2019-09-03', '2019-08-31', '본원', '입원', null,
        '61', '외과', '박**', '2019-08-31');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (9, '0025418756', 'G010325191425', '김**', 'F', '1961-12', '01', '2019-10-28', '2019-10-25', '본원', '입원', null,
        '57', '외과', '양**', '2019-10-25');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (10, '0009714567', 'G010333051941', '문**', 'M', '1953-12', '01', '2017-03-23', '2017-03-22', '본원', '입원', null,
        '63', '소화기내과', '정**', '2017-03-22');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (11, '0014983033', 'G010441270900', '남**', 'M', '1995-09', '01', '2018-02-22', '2018-02-21', '어린이', '입원', null,
        '22', '소아청소년과(소화기영양)', '문**', '2018-02-21');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (12, '0032491637', 'G010453917053', '소**', 'F', '2005-05', '01', '2020-12-30', '2020-12-11', '어린이', '입원', null,
        '15', '소아외과', '김**', '2020-12-11');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (13, '0033372995', 'G010275935183', '손**', 'F', '1955-08', '01', '2021-02-03', '2021-02-01', '본원', '입원', null,
        '65', '위장관외과', '공**', '2021-02-01');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (14, '0026554929', 'G010198026976', '권**', 'F', '1986-01', '01', '2019-12-30', '2019-12-29', '본원', '입원', null,
        '33', '위장관외과', '박**', '2019-12-29');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (15, '0010451226', 'G010312467380', '최**', 'M', '1946-02', '01', '2017-05-15', '2017-05-11', '본원', '입원', null,
        '71', '외과', '박**', '2017-05-11');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (16, '0017184632', 'G010320031736', '강**', 'F', '1946-12', '01', '2018-07-24', '2018-07-07', '본원', '입원', null,
        '71', '외과', '양**', '2018-07-07');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (17, '0009534856', 'G010239806985', '김**', 'F', '1953-01', '01', '2017-03-14', '2017-03-12', '본원', '입원', null,
        '64', '외과', '양**', '2017-03-12');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (18, '0008874991', 'G010483166922', '강**', 'M', '2014-09', '01', '2017-02-01', '2017-01-31', '어린이', '입원', null,
        '2', '소아외과', '김**', '2017-01-31');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (19, '0027855403', 'G010343404513', '이**', 'M', '1946-10', '01', '2020-03-24', '2020-03-13', '본원', '입원', null,
        '73', '흉부외과', '강**', '2020-03-13');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (20, '0021046684', 'G010344165696', '김**', 'M', '1976-02', '01', '2019-02-22', '2019-02-20', '본원', '입원', null,
        '43', '외과', '이**', '2019-02-20');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (21, '0018442964', 'G010349135884', '윤**', 'M', '1940-01', '01', '2018-09-19', '2018-09-19', '본원', '입원', null,
        '78', '소화기내과', '유**', '2018-09-19');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (22, '0009873330', 'G010325146055', '백**', 'F', '1942-10', '01', '2017-04-04', '2017-04-02', '본원', '입원', null,
        '74', '외과', '양**', '2017-04-02');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (23, '0019206193', 'G010441270900', '남**', 'M', '1995-09', '01', '2018-02-22', '2018-11-07', '어린이', '입원', null,
        '23', '소아청소년과(소화기영양)', '문**', '2018-11-07');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (24, '0008294746', 'G010323613895', '김**', 'F', '1949-09', '01', '2016-12-26', '2016-12-23', '본원', '입원', null,
        '67', '외과', '서**', '2016-12-23');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (25, '0031269545', 'G010462557708', '양**', 'F', '2007-07', '01', '2020-10-08', '2020-10-05', '어린이', '입원', null,
        '13', '소아청소년과(소화기영양)', '문**', '2020-10-05');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (26, '0039298583', 'G010068217342', '박**', 'M', '1945-11', '01', '2021-12-24', '2021-12-22', '본원', '입원', null,
        '76', '위장관외과', '공**', '2021-12-22');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (27, '0037711806', 'G010132815619', '노**', 'F', '1944-10', '01', '2021-10-01', '2021-09-29', '본원', '입원', null,
        '76', '위장관외과', '공**', '2021-09-29');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (28, '0021102756', 'G010212020058', '최**', 'F', '1970-11', '01', '2019-02-25', '2019-02-23', '본원', '입원', null,
        '48', '외과', '공**', '2019-02-23');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (29, '0014669364', 'G010271531417', '유**', 'F', '1951-07', '01', '2018-02-02', '2018-01-31', '본원', '입원', null,
        '66', '외과', '공**', '2018-01-31');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (30, '0028866594', 'G010271126051', '민**', 'M', '1960-03', '01', '2020-05-19', '2020-05-16', '본원', '입원', null,
        '60', '흉부외과', '강**', '2020-05-16');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (31, '0025830533', 'G010502197251', '김**', 'M', '2017-12', '01', '2019-11-21', '2019-11-18', '어린이', '입원', null,
        '1', '소아외과', '김**', '2019-11-18');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (32, '0038156399', 'G010510407967', '김**', 'M', '2017-04', '01', '2021-10-24', '2021-10-24', '어린이', '입원', null,
        '4', '소아청소년과(소화기영양)', '문**', '2021-10-24');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (33, '0020686119', 'G010343666862', '이**', 'F', '1960-04', '01', '2019-02-03', '2019-01-29', '본원', '입원', null,
        '58', '비뇨의학과', '김**', '2019-01-29');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (34, '0032756322', 'G010348923572', '지**', 'M', '1968-08', '01', '2020-12-30', '2020-12-28', '본원', '입원', null,
        '52', '위장관외과', '공**', '2020-12-28');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (35, '0010940633', 'G010333488122', '이**', 'F', '1955-12', '01', '2017-06-13', '2017-06-12', '본원', '입원', null,
        '61', '외과', '양**', '2017-06-12');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (36, '0008536243', 'G010489020065', '양**', 'M', '2015-11', '01', '2017-01-09', '2017-01-08', '어린이', '입원', null,
        '1', '소아외과', '김**', '2017-01-08');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (37, '0009659902', 'G010489092240', '장**', 'M', '2016-05', '01', '2017-03-21', '2017-03-20', '어린이', '입원', null,
        '0', '소아외과', '김**', '2017-03-20');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (38, '0010256790', 'G010489324436', '김**', 'F', '2017-03', '01', '2017-04-26', '2017-04-25', '어린이', '입원', null,
        '0', '소아외과', '김**', '2017-04-25');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (39, '0036257282', 'G010494043018', '김**', 'F', '2008-04', '01', '2021-07-13', '2021-07-12', '어린이', '입원', null,
        '13', '소아청소년과(소화기영양)', '문**', '2021-07-12');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (40, '0016180994', 'G010494635046', '강**', 'F', '2017-11', '01', '2018-05-14', '2018-05-07', '어린이', '입원', null,
        '0', '소아외과', '윤**', '2018-05-07');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (41, '0033517853', 'G010494661469', '민**', 'M', '2017-03', '01', '2021-02-11', '2021-02-08', '어린이', '입원', null,
        '3', '소아외과', '고**', '2021-02-08');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (42, '0019227308', 'G010495550951', '신**', 'F', '2018-11', '01', '2018-11-12', '2018-11-08', '어린이', '입원', null,
        '0', '소아청소년과(신생아)', '신**', '2018-11-08');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (43, '0014146041', 'G010439959849', '지**', 'F', '1998-08', '01', '2018-01-01', '2018-01-01', '본원', '입원', null,
        '19', '외과', '공**', '2018-01-01');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (44, '0011915385', 'G010450755049', '구**', 'F', '2000-05', '01', '2017-08-10', '2017-08-09', '어린이', '입원', null,
        '17', '소아청소년과(소화기영양)', '문**', '2017-08-09');
INSERT INTO TEST_VISIT(IDX, PACT_ID, PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, MED_DT, HSP_DTL_TP_NM,
                       PACT_TP_NM, FRVS_RMDE_TP_NM, AGE_CD_YY, MED_DEPT_NM, DR_STF_NM, ADS_DT)
VALUES (45, '0025427895', 'G010173344392', '이**', 'F', '1982-06', '01', '2019-10-29', '2019-10-27', '본원', '입원', null,
        '37', '외과', '양**', '2019-10-27');
