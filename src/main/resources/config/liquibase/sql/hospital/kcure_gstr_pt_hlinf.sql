-- 01.위암_환자_건강정보
CREATE TABLE gstr_pt_hlinf (
                               idx varchar(20) NOT NULL,
                               hosp_cd varchar(20) NOT NULL, -- 병원코드
                               pt_no varchar(10) NOT NULL, -- 환자대체번호
                               adm_ymd varchar(8) NOT NULL, -- 입원일자
                               hlinf_seq numeric(3) NOT NULL, -- 건강정보순번
                               dsch_ymd varchar(8) NULL, -- 퇴원일자
                               cur_drnk_yn_noans_spcd varchar(20) NULL, -- 현재음주여부무응답구분코드
                               cur_drnk_yn_noans_spnm varchar(50) NULL, -- 현재음주여부무응답구분명
                               dhis_yn_noans_spcd varchar(20) NULL, -- 음주력여부무응답구분코드
                               dhis_yn_noans_spnm varchar(50) NULL, -- 음주력여부무응답구분명
                               drnk_strt_age_vl numeric(4) NULL, -- 음주시작연령값
                               drnk_kncd varchar(20) NULL, -- 음주종류코드
                               drnk_knnm varchar(200) NULL, -- 음주종류명
                               drnk_qty varchar(100) NULL, -- 음주량
                               drnk_nt numeric(3) NULL, -- 음주횟수
                               drnk_dtrn_ycnt numeric(3) NULL, -- 음주기간년수
                               nsmk_strt_yr varchar(4) NULL, -- 금주시작년도
                               cur_smok_yn_noans_spcd varchar(20) NULL, -- 현재흡연여부무응답구분코드
                               cur_smok_yn_noans_spnm varchar(50) NULL, -- 현재흡연여부무응답구분명
                               shis_yn_noans_spcd varchar(20) NULL, -- 흡연력여부무응답구분코드
                               shis_yn_noans_spnm varchar(50) NULL, -- 흡연력여부무응답구분명
                               smok_strt_age_vl numeric(4) NULL, -- 흡연시작연령값
                               smok_dtrn_ycnt numeric(3) NULL, -- 흡연기간년수
                               smok_qty numeric(3) NULL, -- 흡연량
                               nsmk_yr varchar(4) NULL, -- 금연시작년도
                               mhis_yn_noans_spcd varchar(20) NULL, -- 병력여부무응답구분코드
                               mhis_yn_noans_spnm varchar(50) NULL, -- 병력여부무응답구분명
                               mhis_hl_yn_noans_spcd varchar(20) NULL, -- 병력고지혈증여부무응답구분코드
                               mhis_hl_yn_noans_spnm varchar(50) NULL, -- 병력고지혈증여부무응답구분명
                               mhis_htn_yn_noans_spcd varchar(20) NULL, -- 병력고혈압여부무응답구분코드
                               mhis_htn_yn_noans_spnm varchar(50) NULL, -- 병력고혈압여부무응답구분명
                               mhis_dbt_yn_noans_spcd varchar(20) NULL, -- 병력당뇨여부무응답구분코드
                               mhis_dbt_yn_noans_spnm varchar(50) NULL, -- 병력당뇨여부무응답구분명
                               mhis_tb_yn_noans_spcd varchar(20) NULL, -- 병력결핵여부무응답구분코드
                               mhis_tb_yn_noans_spnm varchar(50) NULL, -- 병력결핵여부무응답구분명
                               mhis_lvds_yn_noans_spcd varchar(20) NULL, -- 병력간질환여부무응답구분코드
                               mhis_lvds_yn_noans_spnm varchar(50) NULL, -- 병력간질환여부무응답구분명
                               mhis_cncr_yn_noans_spcd varchar(20) NULL, -- 병력암여부무응답구분코드
                               mhis_cncr_yn_noans_spnm varchar(50) NULL, -- 병력암여부무응답구분명
                               mhis_cncr_kncd varchar(20) NULL, -- 병력암종류코드
                               mhis_cncr_knnm varchar(200) NULL, -- 병력암종류명
                               mhis_depr_yn_noans_spcd varchar(20) NULL, -- 병력우울증여부무응답구분코드
                               mhis_depr_yn_noans_spnm varchar(50) NULL, -- 병력우울증여부무응답구분명
                               mhis_insm_yn_noans_spcd varchar(20) NULL, -- 병력불면증여부무응답구분코드
                               mhis_insm_yn_noans_spnm varchar(50) NULL, -- 병력불면증여부무응답구분명
                               mhis_cads_yn_noans_spcd varchar(20) NULL, -- 병력심장질환여부무응답구분코드
                               mhis_cads_yn_noans_spnm varchar(50) NULL, -- 병력심장질환여부무응답구분명
                               etc_mhis_yn_noans_spcd varchar(20) NULL, -- 기타병력여부무응답구분코드
                               etc_mhis_yn_noans_spnm varchar(50) NULL, -- 기타병력여부무응답구분명
                               etc_mhis_diss_cont varchar(200) NULL, -- 기타병력질환내용
                               main_sym_cont varchar(200) NULL, -- 주증상내용
                               main_sym_yn_noans_spcd varchar(20) NULL, -- 주증상여부무응답구분코드
                               main_sym_yn_noans_spnm varchar(50) NULL, -- 주증상여부무응답구분명
                               ohad_hstr_yn_noans_spcd varchar(20) NULL, -- 타병원진단후전원여부무응답구분코드
                               ohad_hstr_yn_noans_spnm varchar(50) NULL, -- 타병원진단후전원여부무응답구분명
                               dsch_stcd varchar(20) NULL, -- 퇴원상태코드
                               dsch_stnm varchar(200) NULL, -- 퇴원상태명
                               crtn_dt timestamp NOT NULL, -- 생성일시
                               pact_id varchar(50) null, -- pact_id ui용
                               REC_WRT_DTM varchar(20) null, -- 작성일자 ui용
                               CONSTRAINT gstr_pt_hlinf_pk PRIMARY KEY (idx)
);

CREATE TABLE gstr_pt_hlinf_updated (
                                       idx varchar(20) NOT NULL,
                                       hosp_cd varchar(20) NOT NULL, -- 병원코드
                                       pt_no varchar(10) NOT NULL, -- 환자대체번호
                                       adm_ymd varchar(8) NOT NULL, -- 입원일자
                                       hlinf_seq numeric(3) NOT NULL, -- 건강정보순번
                                       dsch_ymd varchar(8) NULL, -- 퇴원일자
                                       cur_drnk_yn_noans_spcd varchar(20) NULL, -- 현재음주여부무응답구분코드
                                       cur_drnk_yn_noans_spnm varchar(50) NULL, -- 현재음주여부무응답구분명
                                       dhis_yn_noans_spcd varchar(20) NULL, -- 음주력여부무응답구분코드
                                       dhis_yn_noans_spnm varchar(50) NULL, -- 음주력여부무응답구분명
                                       drnk_strt_age_vl numeric(4) NULL, -- 음주시작연령값
                                       drnk_kncd varchar(20) NULL, -- 음주종류코드
                                       drnk_knnm varchar(200) NULL, -- 음주종류명
                                       drnk_qty varchar(100) NULL, -- 음주량
                                       drnk_nt numeric(3) NULL, -- 음주횟수
                                       drnk_dtrn_ycnt numeric(3) NULL, -- 음주기간년수
                                       nsmk_strt_yr varchar(4) NULL, -- 금주시작년도
                                       cur_smok_yn_noans_spcd varchar(20) NULL, -- 현재흡연여부무응답구분코드
                                       cur_smok_yn_noans_spnm varchar(50) NULL, -- 현재흡연여부무응답구분명
                                       shis_yn_noans_spcd varchar(20) NULL, -- 흡연력여부무응답구분코드
                                       shis_yn_noans_spnm varchar(50) NULL, -- 흡연력여부무응답구분명
                                       smok_strt_age_vl numeric(4) NULL, -- 흡연시작연령값
                                       smok_dtrn_ycnt numeric(3) NULL, -- 흡연기간년수
                                       smok_qty numeric(3) NULL, -- 흡연량
                                       nsmk_yr varchar(4) NULL, -- 금연시작년도
                                       mhis_yn_noans_spcd varchar(20) NULL, -- 병력여부무응답구분코드
                                       mhis_yn_noans_spnm varchar(50) NULL, -- 병력여부무응답구분명
                                       mhis_hl_yn_noans_spcd varchar(20) NULL, -- 병력고지혈증여부무응답구분코드
                                       mhis_hl_yn_noans_spnm varchar(50) NULL, -- 병력고지혈증여부무응답구분명
                                       mhis_htn_yn_noans_spcd varchar(20) NULL, -- 병력고혈압여부무응답구분코드
                                       mhis_htn_yn_noans_spnm varchar(50) NULL, -- 병력고혈압여부무응답구분명
                                       mhis_dbt_yn_noans_spcd varchar(20) NULL, -- 병력당뇨여부무응답구분코드
                                       mhis_dbt_yn_noans_spnm varchar(50) NULL, -- 병력당뇨여부무응답구분명
                                       mhis_tb_yn_noans_spcd varchar(20) NULL, -- 병력결핵여부무응답구분코드
                                       mhis_tb_yn_noans_spnm varchar(50) NULL, -- 병력결핵여부무응답구분명
                                       mhis_lvds_yn_noans_spcd varchar(20) NULL, -- 병력간질환여부무응답구분코드
                                       mhis_lvds_yn_noans_spnm varchar(50) NULL, -- 병력간질환여부무응답구분명
                                       mhis_cncr_yn_noans_spcd varchar(20) NULL, -- 병력암여부무응답구분코드
                                       mhis_cncr_yn_noans_spnm varchar(50) NULL, -- 병력암여부무응답구분명
                                       mhis_cncr_kncd varchar(20) NULL, -- 병력암종류코드
                                       mhis_cncr_knnm varchar(200) NULL, -- 병력암종류명
                                       mhis_depr_yn_noans_spcd varchar(20) NULL, -- 병력우울증여부무응답구분코드
                                       mhis_depr_yn_noans_spnm varchar(50) NULL, -- 병력우울증여부무응답구분명
                                       mhis_insm_yn_noans_spcd varchar(20) NULL, -- 병력불면증여부무응답구분코드
                                       mhis_insm_yn_noans_spnm varchar(50) NULL, -- 병력불면증여부무응답구분명
                                       mhis_cads_yn_noans_spcd varchar(20) NULL, -- 병력심장질환여부무응답구분코드
                                       mhis_cads_yn_noans_spnm varchar(50) NULL, -- 병력심장질환여부무응답구분명
                                       etc_mhis_yn_noans_spcd varchar(20) NULL, -- 기타병력여부무응답구분코드
                                       etc_mhis_yn_noans_spnm varchar(50) NULL, -- 기타병력여부무응답구분명
                                       etc_mhis_diss_cont varchar(200) NULL, -- 기타병력질환내용
                                       main_sym_cont varchar(200) NULL, -- 주증상내용
                                       main_sym_yn_noans_spcd varchar(20) NULL, -- 주증상여부무응답구분코드
                                       main_sym_yn_noans_spnm varchar(50) NULL, -- 주증상여부무응답구분명
                                       ohad_hstr_yn_noans_spcd varchar(20) NULL, -- 타병원진단후전원여부무응답구분코드
                                       ohad_hstr_yn_noans_spnm varchar(50) NULL, -- 타병원진단후전원여부무응답구분명
                                       dsch_stcd varchar(20) NULL, -- 퇴원상태코드
                                       dsch_stnm varchar(200) NULL, -- 퇴원상태명
                                       crtn_dt timestamp NOT NULL, -- 생성일시
                                       pact_id varchar(50) null, -- pact_id ui용
                                       REC_WRT_DTM varchar(20) null, -- 작성일자 ui용,
                                       CREATED_BY         CHARACTER VARYING(50),
                                       CREATED_DATE       TIMESTAMP,
                                       LAST_MODIFIED_BY   CHARACTER VARYING(50),
                                       LAST_MODIFIED_DATE TIMESTAMP,
                                       STATUS             VARCHAR(50)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (2000, 'gstr_pt_hlinf', 'gstr_pt_hlinf', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (2000, null, '위암_환자_건강_정보');

insert into ph_item (id, title, activated, category_id, created_by) values (2001, 'pt_no', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2001, '환자대체번호', false, false);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2002, 'hosp_cd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2002, '병원코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2002, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2003, 'adm_ymd', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2003, '입원일자', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2004, 'hlinf_seq', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2004, '건강정보순번', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2005, 'dsch_ymd', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2005, '퇴원일자', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2006, 'cur_drnk_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2006, '현재음주여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2006, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2007, 'cur_drnk_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2007, '현재음주여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2008, 'dhis_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2008, '음주력여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2008, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2009, 'dhis_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2009, '음주력여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2010, 'drnk_strt_age_vl', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2010, '음주시작연령값', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2011, 'drnk_kncd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2011, '음주종류코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2011, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2012, 'drnk_knnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2012, '음주종류명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2013, 'drnk_qty', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2013, '음주량', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2014, 'drnk_nt', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2014, '음주횟수', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2015, 'drnk_dtrn_ycnt', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2015, '음주기간년수', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2016, 'nsmk_strt_yr', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2016, '금주시작년도', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2017, 'cur_smok_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2017, '현재흡연여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2017, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2018, 'cur_smok_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2018, '현재흡연여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2019, 'shis_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2019, '흡연력여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2019, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2020, 'shis_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2020, '흡연력여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2021, 'smok_strt_age_vl', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2021, '흡연시작연령값', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2022, 'smok_dtrn_ycnt', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2022, '흡연기간년수', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2023, 'smok_qty', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2023, '흡연량', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2024, 'nsmk_yr', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2024, '금연시작년도', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2025, 'mhis_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2025, '병력여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2025, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2026, 'mhis_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2026, '병력여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2027, 'mhis_hl_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2027, '병력고지혈증여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2027, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2028, 'mhis_hl_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2028, '병력고지혈증여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2029, 'mhis_htn_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2029, '병력고혈압여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2029, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2030, 'mhis_htn_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2030, '병력고혈압여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2031, 'mhis_dbt_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2031, '병력당뇨여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2031, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2032, 'mhis_dbt_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2032, '병력당뇨여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2033, 'mhis_tb_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2033, '병력결핵여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2033, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2034, 'mhis_tb_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2034, '병력결핵여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2035, 'mhis_lvds_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2035, '병력간질환여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2035, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2036, 'mhis_lvds_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2036, '병력간질환여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2037, 'mhis_cncr_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2037, '병력암여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2037, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2038, 'mhis_cncr_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2038, '병력암여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2039, 'mhis_cncr_kncd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2039, '병력암종류코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2039, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2040, 'mhis_cncr_knnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2040, '병력암종류명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2041, 'mhis_depr_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2041, '병력우울증여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2041, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2042, 'mhis_depr_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2042, '병력우울증여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2043, 'mhis_insm_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2043, '병력불면증여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2043, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2044, 'mhis_insm_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2044, '병력불면증여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2045, 'mhis_cads_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2045, '병력심장질환여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2045, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2046, 'mhis_cads_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2046, '병력심장질환여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2047, 'etc_mhis_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2047, '기타병력여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2047, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2048, 'etc_mhis_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2048, '기타병력여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2049, 'etc_mhis_diss_cont', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2049, '기타병력질환내용', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2050, 'main_sym_cont', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2050, '주증상내용', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2051, 'main_sym_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2051, '주증상여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2051, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2052, 'main_sym_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2052, '주증상여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2053, 'ohad_hstr_yn_noans_spcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2053, '타병원진단후전원여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2053, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2054, 'ohad_hstr_yn_noans_spnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2054, '타병원진단후전원여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (2055, 'dsch_stcd', true, 2000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (2055, '퇴원상태코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (2055, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (2056, 'dsch_stnm', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2056, '퇴원상태명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2057, 'crtn_dt', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2057, '생성일시', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2058, 'pact_id', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2058, 'pact_id ui용', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (2059, 'REC_WRT_DTM', true, 2000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (2059, '작성일자 ui용,', false, true);

