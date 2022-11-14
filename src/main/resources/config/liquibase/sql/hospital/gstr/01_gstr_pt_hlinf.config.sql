DROP TABLE IF EXISTS GSTR.GSTR_PT_HLINF;
DROP TABLE IF EXISTS GSTR.GSTR_PT_HLINF_UPDATED;

-- 01.위암_환자_건강정보
CREATE TABLE IF NOT EXISTS GSTR.GSTR_PT_HLINF (
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

CREATE TABLE IF NOT EXISTS GSTR.GSTR_PT_HLINF_UPDATED (
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
VALUES (9100, 'GSTR.GSTR_PT_HLINF', '위암_환자_건강_정보', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (9100, null, '위암_환자_건강_정보');

insert into ph_item (id, title, activated, category_id, created_by) values (9101, 'pt_no', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, visible) values (9101, '환자대체번호', false, false, false);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9102, 'hosp_cd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9102, '병원코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9102, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9103, 'adm_ymd', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9103, '입원일자', false, true);
insert into ph_item_attribute (item_id, data_type) values (9103, 'date');

insert into ph_item (id, title, activated, category_id, created_by) values (9104, 'hlinf_seq', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9104, '건강정보순번', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9105, 'dsch_ymd', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9105, '퇴원일자', false, true);
insert into ph_item_attribute (item_id, data_type) values (9105, 'date');

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9106, 'cur_drnk_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9106, '현재음주여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9106, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9107, 'cur_drnk_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9107, '현재음주여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9108, 'dhis_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9108, '음주력여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9108, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9109, 'dhis_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9109, '음주력여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9110, 'drnk_strt_age_vl', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9110, '음주시작연령값', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9111, 'drnk_kncd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9111, '음주종류코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9111, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9112, 'drnk_knnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9112, '음주종류명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9113, 'drnk_qty', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9113, '음주량', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9114, 'drnk_nt', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9114, '음주횟수', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9115, 'drnk_dtrn_ycnt', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9115, '음주기간년수', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9116, 'nsmk_strt_yr', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9116, '금주시작년도', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9117, 'cur_smok_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9117, '현재흡연여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9117, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9118, 'cur_smok_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9118, '현재흡연여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9119, 'shis_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9119, '흡연력여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9119, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9120, 'shis_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9120, '흡연력여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9121, 'smok_strt_age_vl', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9121, '흡연시작연령값', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9122, 'smok_dtrn_ycnt', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9122, '흡연기간년수', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9123, 'smok_qty', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9123, '흡연량', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9124, 'nsmk_yr', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9124, '금연시작년도', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9125, 'mhis_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9125, '병력여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9125, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9126, 'mhis_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9126, '병력여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9127, 'mhis_hl_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9127, '병력고지혈증여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9127, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9128, 'mhis_hl_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9128, '병력고지혈증여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9129, 'mhis_htn_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9129, '병력고혈압여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9129, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9130, 'mhis_htn_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9130, '병력고혈압여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9131, 'mhis_dbt_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9131, '병력당뇨여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9131, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9132, 'mhis_dbt_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9132, '병력당뇨여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9133, 'mhis_tb_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9133, '병력결핵여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9133, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9134, 'mhis_tb_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9134, '병력결핵여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9135, 'mhis_lvds_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9135, '병력간질환여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9135, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9136, 'mhis_lvds_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9136, '병력간질환여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9137, 'mhis_cncr_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9137, '병력암여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9137, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9138, 'mhis_cncr_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9138, '병력암여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9139, 'mhis_cncr_kncd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9139, '병력암종류코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9139, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9140, 'mhis_cncr_knnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9140, '병력암종류명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9141, 'mhis_depr_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9141, '병력우울증여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9141, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9142, 'mhis_depr_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9142, '병력우울증여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9143, 'mhis_insm_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9143, '병력불면증여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9143, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9144, 'mhis_insm_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9144, '병력불면증여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9145, 'mhis_cads_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9145, '병력심장질환여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9145, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9146, 'mhis_cads_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9146, '병력심장질환여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9147, 'etc_mhis_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9147, '기타병력여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9147, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9148, 'etc_mhis_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9148, '기타병력여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9149, 'etc_mhis_diss_cont', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9149, '기타병력질환내용', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9150, 'main_sym_cont', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9150, '주증상내용', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9151, 'main_sym_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9151, '주증상여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9151, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9152, 'main_sym_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9152, '주증상여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9153, 'ohad_hstr_yn_noans_spcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9153, '타병원진단후전원여부무응답구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9153, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9154, 'ohad_hstr_yn_noans_spnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9154, '타병원진단후전원여부무응답구분명', false, true);

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (9155, 'dsch_stcd', true, 9100, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9155, '퇴원상태코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9155, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (9156, 'dsch_stnm', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9156, '퇴원상태명', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9157, 'crtn_dt', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9157, '생성일시', false, true);
insert into ph_item_attribute (item_id, data_type) values (9157, 'date');

insert into ph_item (id, title, activated, category_id, created_by) values (9158, 'pact_id', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9158, 'pact_id ui용', false, true);

insert into ph_item (id, title, activated, category_id, created_by) values (9159, 'REC_WRT_DTM', true, 9100, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9159, '작성일자 ui용,', false, true);

